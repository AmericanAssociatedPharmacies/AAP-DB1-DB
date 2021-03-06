USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMRx30PMLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













-- =============================================
-- Author:		JOSHILA NARAYANANAN
-- Create date: 05/05/09
-- Description:	LOAD RX30PM with Rejected, UnderBilled and Low Gross Profit claims for Accounting to use in access app
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMRx30PMLoad]


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	Declare @pharmid nvarchar(15)
	DECLARE  cu_store CURSOR
	FOR Select NABP FROM Rx30Stores Where ProfitMinder = 1 
	
	OPEN cu_store
	FETCH NEXT FROM cu_store INTO	
		@pharmid	
	
	WHILE  (@@FETCH_STATUS = 0)	
	BEGIN
			--REJECTED CLAIMS
			INSERT INTO Rx30RejPM(RxNbr, NCPDP, NDC, Fill_dt, Bill_code, Drug_Name, Reject_Code, Reject_Text, RPH, Reject_Amt,UploadedOn) 
			Select [Rx Nbr] AS RxNbr, @pharmid,MIN(NDC),MIN([Rx Date]) AS DateOfService, MAX([Bill Code]) AS BillCode,MIN(DrugName), MAX([Rej Code]), MIN([ResponseReason]),MIN(RPH),MAX([Gross Amt Due]), getdate() FROM  v_Rx30Master
			WHERE ([Rx Nbr] IS NOT NULL) AND [Pharm ID] = @pharmid AND (RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=2)) GROUP BY [Rx Nbr]	HAVING MIN([Tx Response]) = 'R' 
			

			--UNDERBILLED
			INSERT INTO RX30UBPM (RxNbr, NCPDP, NDC, Fill_dt, Bill_code, Drug_Name, Qty, Sale_Price, UploadedOn)  
			Select MIN([Rx Nbr]) AS RxNbr, @pharmid,MIN(NDC),MIN([Rx Date]) AS DateOfService,MAX([Bill Code]), MIN(DrugName), MAX([Qty Dispensed]), MIN([Total Price]), getdate() FROM  v_Rx30Master
			WHERE ([Total Price] = [Gross Amt Due]) AND [Pharm ID] = @pharmid AND [Tx Response] <> 'R' AND DrugName is not null AND RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=2) GROUP BY [Rx Nbr] 


			--LOW GP

			INSERT INTO RX30LGPPM (RxNbr, NCPDP, NDC, Fill_dt, Bill_code, Drug_Name, Qty, Sale_Price, Acq_Cost,Brand_Flag, UploadedOn) 
			Select MIN([Rx Nbr]) AS RxNbr, @pharmid,MIN(v_Rx30Master.NDC) as NDC,MIN([Rx Date]) AS DateOfService,MAX([Bill Code]) as BillCode, MIN(DrugName) as DrugName, MAX([Qty Dispensed]) as Qty, MIN([Total Price]) as Sale_Price, ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST) as Acq_Cost,MIN([Brand]) as Brand_Flag,getdate()
			FROM         v_Rx30Master LEFT OUTER JOIN CHPH_1 ON v_Rx30Master.ACCT_NO = CHPH_1.Store AND v_Rx30Master.NDC = CHPH_1.NDC  
			WHERE     ([Pharm ID] = @pharmid AND DateDiff(dd,CHPH_1.INV_DATE,getdate()) < 360) AND NDCGI1=2 AND [Qty Dispensed] <> 0 AND ((UNIT_COST/PS) * [Qty Dispensed]) > 0
			AND ([Total Price] - ((([Qty Dispensed]/CSP)/PS) * [UNIT_COST]))/[Total Price] * 100 < 5 AND RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=2)
			GROUP BY [Rx Nbr]
			ORDER BY ((MIN([Total Price]) - ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST))/(MIN([Total Price]))) * 100 

			

			INSERT INTO RX30LGPPM (RxNbr, NCPDP, NDC, Fill_dt, Bill_code, Drug_Name, Qty, Sale_Price, Acq_Cost,Brand_Flag,UploadedOn) 
			Select MIN([Rx Nbr]) AS RxNbr, @pharmid,MIN(v_Rx30Master.NDC),MIN([Rx Date]) AS DateOfService,MAX([Bill Code]), MIN(DrugName), MAX([Qty Dispensed]), MIN([Total Price]), ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST) as Acq_Cost,MIN([Brand]) as Brand_Flag, getdate()
			FROM  v_Rx30Master LEFT JOIN CHPH_1 ON v_Rx30Master.ACCT_NO = CHPH_1.Store AND v_Rx30Master.NDC = CHPH_1.NDC  
			WHERE     ([Pharm ID] = @pharmid AND DateDiff(dd,CHPH_1.INV_DATE,getdate()) < 360) AND NDCGI1=1 AND [Qty Dispensed] <> 0 AND ((UNIT_COST/PS) * [Qty Dispensed]) > 0
			AND ([Total Price] - ((([Qty Dispensed]/CSP)/PS) * [UNIT_COST]))/[Total Price] * 100 < 15 AND RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=2)
			GROUP BY [Rx Nbr]
			ORDER BY ((MIN([Total Price]) - (((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)))/(MIN([Total Price]))) * 100


	FETCH NEXT FROM cu_store INTO
		@pharmid

	END
	CLOSE cu_store
	DEALLOCATE cu_store

	DECLARE @maxid int	
	SELECT @maxid = MAX(RxID) FROM Rx30Master

    -- Insert statements for procedure here
	INSERT INTO Rx30PMLast(RxID,Type,GeneratedOn) VALUES (@maxid,2,getdate())


END

















GO
