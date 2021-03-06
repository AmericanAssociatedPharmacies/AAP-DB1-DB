USE [ODSIntake]
GO
/****** Object:  View [sales].[v_Import_API_WH_Sales]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--Gets the most recent days API Sales Details from the AS400. Output should be identical to
--the data in API..APISalesDetail


CREATE VIEW [sales].[v_Import_API_WH_Sales] AS (
	
	SELECT Sales.IDCUNO AS WHAccountID,
		Sales.IDINVN AS InvNbr, 
		Sales.IDLINE AS InvLine, 
		SRONAM.NANAME AS CustomerName, 
		LEFT(Sales.IDPRDC, 6) AS APIItemNbr,
		RIGHT(Sales.IDPRDC, LEN(Sales.IDPRDC)-6) AS ItemDescription, 
		Sales.IDQTY AS Qty, 
		Sales.IDSALP AS UnitAmt, 
		SROPRG.PGPGRP AS ItermGrp, 
		SROPRG.PGAGRP AS AcctGrp, 
		"Territory" = CASE Sales.IDSALE
			WHEN '04' THEN '52'
			WHEN '07' THEN '58'
			WHEN '08' THEN '53'
			WHEN '12' THEN '71'
			WHEN '13' THEN '56'
			WHEN '20' THEN '50'
			WHEN '21' THEN '54'
			WHEN '25' THEN '59'
		END, 
		CONVERT(VARCHAR, Sales.IDIDAT, 120) AS InvDate, 
		IIf(Left([IDINVN],1)='7',([IDAMOU]*-1),[IDAMOU]) AS LineAmt, 
		IIf(Left([IDINVN],1)='7',([IDNSVA]*-1),[IDNSVA]) AS ExtSales, 
		Sales.IDORNO AS OrderNbr,
		[SROPRG].[PGUFA2] AS NDC_orig,
		"NDC" = CASE
			WHEN LEN([SROPRG].[PGUFA2]) = 13 THEN REPLACE([SROPRG].[PGUFA2], '-', '') 
			WHEN LEN([SROPRG].[PGUFA2]) > 11 THEN REPLACE(REPLACE([SROPRG].[PGUFA2], '-', ''), '0', '')
		END,
		GETDATE() as DateLoaded,
		"Type" = CASE SROPRG.PGAGRP
			WHEN NULL THEN ''
			WHEN 'I01' THEN 'Brand'
			--WHEN 'I17' THEN 'Brand'
			WHEN 'I02' THEN 'Generic'
			WHEN 'I03' THEN
				CASE 
					WHEN SROPRG.PGPGRP in('EMPU', 'EMPA', 'EMPH', 'EMPO', 'EMPP', 'FE', 'FR', 'RSTK') THEN 'OTC'
				END
		END,
		NULL as WHNbr
			 
	FROM OPENQUERY([10.96.0.3], 'SELECT * FROM APIASW.AX1492BFRX.SROISDPL
	 WHERE IDIDAT = (SELECT VARCHAR(year(current date)*10000 + month(current date)*100 + day(current date)-1) from sysibm.sysdummy1)') AS Sales
		INNER JOIN OPENQUERY([10.96.0.3], 'SELECT * FROM APIASW.AX1492BFRX.SRONAM') AS SRONAM
			ON Sales.IDCUNO = [SRONAM].NANUM 
		INNER JOIN OPENQUERY([10.96.0.3], 'SELECT * FROM APIASW.AX1492BFRX.SROPRG') AS SROPRG
			ON Sales.IDPRDC = [SROPRG].PGPRDC AND
				Sales.IDPRDC = SROPRG.PGPRDC
	--WHERE Sales.IDIDAT = year(getdate())*10000 + month(getdate())*100 + day(getdate())
	WHERE SROPRG.PGAGRP <> 'I17'

)







GO
