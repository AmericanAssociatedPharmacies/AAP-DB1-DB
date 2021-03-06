USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_APISalesDetail_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Staging].[usp_APISalesDetail_Load]

AS

SET NOCOUNT ON;

/*
Author: Yodi

Changed Author: RSE
Changed Date: 01/09/2020
Reason: Original code did not account for when a day has not been loaded, e.g. an error in the ETL caused day(s) not to be loaded. 
		The new code gets the MAX InvDate and will put a list of dates to loop thru by using a CURSOR.
*/

 

BEGIN
 

	DECLARE @Today DATETIME
	, @OPENQUERY varchar(8000)
	, @TSQL varchar(8000)
	, @LinkedServer varchar(8000)
	, @var CHAR(10)

	SET @Today = DATEADD(d, DATEDIFF(d,0, GETDATE()), 0)
	SET @LinkedServer = '[10.80.2.41]'
	SET @OPENQUERY = 'SELECT TRY_CONVERT(VARCHAR(35),InvNbr) AS [InvNbr]
					, TRY_CONVERT(VARCHAR(4),InvLine) AS InvLine
					, TRY_CONVERT(VARCHAR(35),CustNbr) AS CustNbr
					, TRY_CONVERT(VARCHAR(100),Cust) AS Cust
					, TRY_CONVERT(VARCHAR(25),ItemNo) AS ItemNo
					, TRY_CONVERT(VARCHAR(125),Item) AS Item
					, TRY_CONVERT(VARCHAR(50),NDC) AS NDC
					, TRY_CONVERT(VARCHAR(20),Qty) AS Qty
					, TRY_CONVERT(VARCHAR(20),ItemAmt) AS ItemAmt
					, TRY_CONVERT(VARCHAR(10),ItemGrp) AS ItemGrp
					, TRY_CONVERT(VARCHAR(10),AcctGrp) AS [AcctGrp]
					, TRY_CONVERT(VARCHAR(4),Slsman) AS [Slsman]
					, TRY_CONVERT(VARCHAR(20),InvDate) AS InvDate
					, TRY_CONVERT(VARCHAR(20),LineAmt) AS LineAmt
					, TRY_CONVERT(VARCHAR(20),ExtSales) AS ExtSales
					, TRY_CONVERT(VARCHAR(20),SalesOrd) AS SalesOrd
					, TRY_CONVERT(VARCHAR(4),IDTYPP) AS IDTYPP
					, TRY_CONVERT(VARCHAR(20),REBATE) AS REBATE
					, TRY_CONVERT(VARCHAR(4),IDPAGR) AS [IDPAGR]
					, TRY_CONVERT(DECIMAL(5,2),DiscountPercentage) AS [DiscountPercentage]
					, TRY_CONVERT(VARCHAR(50), CarrierCode) AS CarrierCode
					, TRY_CONVERT(VARCHAR(10), WharehouseNum ) AS WharehouseNum 
					, TRY_CONVERT(VARCHAR(100), CarrierDesc) AS CarrierDesc
					, TRY_CONVERT(VARCHAR(100), CustomerRef) AS CustomerRef
					, TRY_CONVERT(VARCHAR(100), OrderType) AS OrderType
					 FROM OPENQUERY('+ @LinkedServer + ','''

	DECLARE C1 CURSOR FOR
	SELECT DISTINCT CONVERT(VARCHAR(8),ca.TheDate, 112) AS InvDate
	FROM(SELECT MAX(InvDate) AS MaxInvDate
		 FROM API.dbo.APISalesDetail
		) AS dt
	CROSS APPLY ODSIntake.dbo.DateDim AS ca
	WHERE ca.TheDate > dt.MaxInvDate
	AND ca.TheDate < @Today
	AND IsWeekend = 0
	

	OPEN C1

	FETCH NEXT
	FROM C1
	INTO @var

	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @TSQL = 'SELECT SBINV as InvNbr
					, SBLINE as InvLine
					, SACUST as CustNbr
					, SASNAM as Cust
					, SBITEM as ItemNo
					, SBITD1 as Item
					, SBXNDC as NDC
					, SBQSHP as Qty
					, SBPRIC as ItemAmt
					, SBCLS  as ItemGrp
					, SBDIV  AS AcctGrp
					, SBSMNO as Slsman
					, SAINDT as InvDate
					, SBQSHP * SBPRIC as LineAmt
					, SBQSHP * SBPRIC as ExtSales
					, SAORD as SalesOrd
					, SATYPE as IDTYPP
					, NVL(RBIAMT,0) as REBATE
					, SBDIV as IDPAGR
					, NVL(CC_DISCP,0) + NVL(IR_DISCP,0) AS DiscountPercentage
					, SAVIA AS CarrierCode
					, SALOC AS WharehouseNum 
					, REDESC AS CarrierDesc
					, SACPO AS CustomerRef
					, SAORDS AS OrderType
					FROM R60FILES.VSAHEAD 
					JOIN R60FILES.VSADETL ON SACMP = SBCMP 
											AND SAORD = SBORD 
											AND SABOCD = SBBOCD
					LEFT OUTER JOIN R60FILES.VARSVIA ON SAVIA = RESVIA
					LEFT OUTER JOIN (SELECT CDCUST as CC_CUST, O1_CLS as CC_CLS , O1_DISCP as CC_DISCP, O1_DESC as CC_DESC
									FROM R60MODSDTA.VCPCSDC
									JOIN R60MODSDTA.VCPADCHG
									ON CDSEQ = R60MODSDTA.VCPADCHG.O1_SEQ
									JOIN R60FILES.VCOADCHG
									ON CDSEQ = R60FILES.VCOADCHG.O1_SEQ
									WHERE CDSEQ in (2,3,4)
									AND R60MODSDTA.VCPADCHG.O1_LOC = ''''01''''
									AND R60FILES.VCOADCHG.O1_LOC = ''''01''''
									AND CDDEL = ''''A''''
									AND O1_DEL = ''''A''''
									) CC ON SBCUST = CC_CUST
															AND SBCLS = CC_CLS
			LEFT OUTER JOIN (SELECT CDCUST as IR_CUST, O1_CLS as IR_CLS, O1_DISCP as IR_DISCP, O1_DESC as IR_DESC
							FROM R60MODSDTA.VCPCSDC
							JOIN R60MODSDTA.VCPADCHG
							ON CDSEQ = R60MODSDTA.VCPADCHG.O1_SEQ
							JOIN R60FILES.VCOADCHG
							ON CDSEQ = R60FILES.VCOADCHG.O1_SEQ
							WHERE CDSEQ in (1)
							AND R60MODSDTA.VCPADCHG.O1_LOC = ''''01''''
							AND R60FILES.VCOADCHG.O1_LOC = ''''01''''
							AND CDDEL = ''''A''''
							AND O1_DEL = ''''A''''
							) IR ON SBCUST = IR_CUST
			LEFT OUTER JOIN (SELECT RBIITEM,RBMFRDT, RBMTODT, RBIAMT
							FROM R60FILES.VCORBTMS
							JOIN R60FILES.VPORBTIT
							ON RBMID = RBIID
							WHERE RBMDEL = ''''A''''
							AND RBIDEL = ''''A''''
							) RB ON SBITEM = RBIITEM
			AND SAINDT >= RBMFRDT
			AND SAINDT < RBMTODT
			WHERE SADEL = ''''A'''' 
			AND SBPCOD <> ''''LS''''
			AND SAINDT ='''''+ @var +''''''')'



		INSERT INTO [Staging].[APISalesDetail](InvNbr, InvLine, CustNbr, Cust, ItemNo, Item, NDC, Qty, ItemAmt, ItemGrp, AcctGrp, Slsman, InvDate, LineAmt, ExtSales, SalesOrd, IDTYPP, REBATE, IDPAGR, DiscountPercentage
												,CarrierCode, WharehouseNum, CarrierDesc, [CustomerRef], [OrderType]
												)
		EXEC (@OPENQUERY+@TSQL)

		--PRINT (@OPENQUERY+@TSQL)


		FETCH NEXT
		FROM C1
		INTO @var


	END

	CLOSE C1
	DEALLOCATE C1

END

/**********************************************************************************************************************************************************************************

																	Depercated SQL Code

************************************************************************************************************************************************************************************/

/*		SET @sql = 'select *

		from openquery([10.96.0.3],

			''SELECT

				AX1492BFRX.SROISDPL.IDINVN as InvNbr,

				AX1492BFRX.SROISDPL.IDLINE as InvLine,

				AX1492BFRX.SROISDPL.IDCUNO as CustNbr,

				AX1492BFRX.SRONAM.NANAME as Cust,

				AX1492BFRX.SROISDPL.IDPRDC as Item,

				AX1492BFRX.SROPRG.PGUFA2 as NDC,

				AX1492BFRX.SROISDPL.IDQTY as Qty,

				AX1492BFRX.SROISDPL.IDSALP as ItemAmt,

				AX1492BFRX.SROPRG.PGPGRP as ItemGrp,

				AX1492BFRX.SROPRG.PGAGRP as AcctGrp,

				AX1492BFRX.SROISDPL.IDSALE as Slsman,

				AX1492BFRX.SROISDPL.IDIDAT as InvDate,

				case when Left(IDINVN,1) = 7 then (IDSALP*IDQTY*-1) else IDSALP*IDQTY end as LineAmt,

				case when Left(IDINVN,1) = 7 then (IDSALP*IDQTY*-1) else IDSALP*IDQTY end as ExtSales,

				AX1492BFRX.SROISDPL.IDORNO as SalesOrd,

				-- IIf([DISREBATE]=0,0,IIf([IDTYPP]=2,[DISREBATE]*-1,[DISREBATE]))

				case

					when IDUSCURB <> 0  and IDTYPP <> 2 then (IDUSCURB)

					when IDUSCURB <> 0  and IDTYPP = 2 then (IDUSCURB*-1)

					else 0 end AS DISREBATE,

				AX1492BFRX.SROISDPL.IDTYPP,

				AX1492BFRX.SROISDPL.IDNSVA,

				(IDUSCURB*-1) AS REBATE,

				AX1492BFRX.SROISDPL.IDPAGR,

				AX1492BFRX.SROISDPL.IDDCPR AS DiscountPercentage

		FROM AX1492BFRX.SROISDPL

		join AX1492BFRX.SROPRG

			on AX1492BFRX.SROISDPL.IDPRDC = AX1492BFRX.SROPRG.PGPRDC

		join AX1492BFRX.SRONAM

			on AX1492BFRX.SROISDPL.IDCUNO = AX1492BFRX.SRONAM.NANUM

		WHERE AX1492BFRX.SROISDPL.IDIDAT='''''+ @var +''''''')'
*/






GO
