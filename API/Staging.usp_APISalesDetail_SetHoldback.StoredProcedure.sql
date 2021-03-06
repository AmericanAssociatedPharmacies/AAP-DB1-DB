USE [API]
GO
/****** Object:  StoredProcedure [Staging].[usp_APISalesDetail_SetHoldback]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LeeAnn Carrell
-- Create date: 20180615
-- Description:	This stored procedure is used to update the API and Affiliate Holdback percent and amounts in the API Sales Detail load.
--	This procedure is executed daily, via the LoadAPICons C# application, via the API Sales Load windows scheduled job on DB1
-- Edited: Yodi Haile
-- Date: 20190510
-- Per Scott request: created this to refer Staging table
-- Edited: Stuart Mullins
-- Date: 20200401
-- Notes: Added PPP, Group_ID '111' to CASE statements below. Note there appears to be a bug in second statement below on Group_ID=13. 
--        We will review this separately and determine impact.
-- =============================================
CREATE PROCEDURE [Staging].[usp_APISalesDetail_SetHoldback]

AS

SET NOCOUNT ON;

BEGIN

	/*
	SET THE API AND AFFILIATE HOLDBACK PERCENT
	*/
	UPDATE sd
	SET sd.AffiliateHoldbackPercent = ISNULL(sdh.AffiliateHoldbackPercent, 0.00)
	, sd.APIHoldbackPercent = ISNULL(sdh.APIHoldbackPercent, 0.00)
	FROM Staging.APISalesDetail AS sd
	INNER JOIN(SELECT hb.ID
				, CASE 
				WHEN h.Group_ID IN (99,110,13) THEN IIF(hb.Rebate <> 0.00, h.HoldbackPercent, 0.00) --PFOA and CPI: Applied to total rebate
				WHEN h.Group_ID IN (7,6,9,103,109,111) THEN IIF(Type = 'Generic', h.HoldbackPercent, 0.00) --Keystone, RxPlus, SPC: Applied to Generic Sales
				WHEN h.Group_ID = 10 THEN IIF(Type = 'Generic', h.HoldbackPercent, IIF(Type = 'OTC', 0.005, 0.00)) --Legend: 1% Generic Sales, 0.5% OTC Sales
				ELSE 0.00
				END AS AffiliateHoldbackPercent
			 , CASE WHEN Type = 'Generic' THEN h2.HoldbackPercent
				ELSE 0.00
				END AS APIHoldbackPercent
			FROM Staging.APISalesDetail as hb
			INNER JOIN RXMaster.dbo.PharmacyDim AS d ON d.PMID = hb.PMID
																AND hb.InvDate BETWEEN ISNULL(d.APIEffectiveDate, '19000101') AND ISNULL(d.APIQuitDate, '29991231')
			LEFT JOIN (SELECT * 
						FROM PharmacyMaster.dbo.PM_HoldbackPercent 
						WHERE HeldBy = 'API'
						) as h2 ON hb.InvDate BETWEEN h2.StartDate AND h2.EndDate
			LEFT JOIN PharmacyMaster.dbo.PM_Groups_xref as g
												ON d.PMID = g.PMID
			LEFT JOIN PharmacyMaster.dbo.PM_HoldbackPercent as h
												ON g.Group_ID = h.Group_ID 
												AND hb.InvDate BETWEEN h.StartDate AND hb.InvDate 
			LEFT OUTER JOIN PharmacyMaster.dbo.PM_AffiliateHistory AS a ON d.PMID = a.PMID --SR #974
															AND hb.InvDate BETWEEN a.StartDate AND ISNULL(a.EndDate,'29991231')		
			WHERE d.APINumber IS NOT NULL	
			AND hb.Rebate <> 0.00				
			) sdh ON sdh.ID = sd.ID
				
	/*
	SET API AND AFFILIATE HOLDBACK AMOUNTS
	*/
	UPDATE sd
	SET sd.APIHoldbackAmount = sdh.APIHoldbackAmount
	, sd.AffiliateHoldbackAmount = sdh.AffiliateHoldbackAmount
	FROM Staging.APISalesDetail AS sd
	INNER JOIN (SELECT hb.ID
				, hb.PMID
				, AffiliateHoldbackPercent
				, a.GroupID
				, CASE 
					WHEN a.GroupID IN (99,110,13) THEN (hb.Rebate*hb.AffiliateHoldbackPercent)
					WHEN a.GroupID IN (7,6,9,103,109,111,13) THEN (hb.ExtSales*hb.AffiliateHoldbackPercent)
					ELSE 0.00
					END AS AffiliateHoldbackAmount
				, (hb.ExtSales*hb.APIHoldbackPercent) AS APIHoldbackAmount
				FROM Staging.APISalesDetail as hb
				INNER JOIN RXMaster.dbo.PharmacyDim AS d ON d.APINumber = hb.WHAccountID
																	AND hb.InvDate BETWEEN ISNULL(d.APIEffectiveDate, '19000101') AND ISNULL(d.APIQuitDate, '29991231')
				LEFT OUTER JOIN PharmacyMaster.dbo.PM_AffiliateHistory AS a ON d.PMID = a.PMID
																AND hb.InvDate BETWEEN a.StartDate AND ISNULL(a.EndDate,'29991231')		
				WHERE d.APINumber IS NOT NULL	
				AND hb.Rebate <> 0.00								
				) AS sdh ON sdh.ID = sd.ID		
	

	/*
	SET REBATE AMOUNTS AFTER API AND AFFILIATE HOLDBACK AMOUNT
	*/
	UPDATE sd
	SET RebateAfterAPIHoldbackAmount = Rebate - APIHoldbackAmount
	, FinalRebateAmount = Rebate - APIHoldbackAmount - AffiliateHoldbackAmount
	FROM Staging.APISalesDetail AS sd


	--Update amounts when a line item is a return
	UPDATE x
	SET Rebate = dt.Rebate
	, APIHoldbackAmount = dt.APIHoldBackAmount
	, RebateAfterAPIHoldbackAmount = dt.RebateAfterAPIHoldbackAmount
	, AffiliateHoldbackAmount = dt.AffiliateHoldBackAmount
	, FinalRebateAmount = dt.FinalRebateAmount
	, ConferenceCreditPercentage  = dt.ConferenceCreditPercentage
	, ConferenceCreditAmount = dt.ConferenceCreditAmount
	FROM Staging.APISalesDetail AS x
	INNER JOIN(SELECT ID
				, (Rebate * -1) AS Rebate
				, IIF(APIHoldBackAmount > 0, (APIHoldBackAmount * -1), APIHoldBackAmount) AS APIHoldBackAmount
				, IIF(RebateAfterAPIHoldbackAmount > 0, (RebateAfterAPIHoldbackAmount * -1), RebateAfterAPIHoldbackAmount) AS RebateAfterAPIHoldbackAmount
				, IIF(AffiliateHoldBackAmount > 0, (AffiliateHoldBackAmount * -1), AffiliateHoldBackAmount) AS AffiliateHoldBackAmount
				, IIF(FinalRebateAmount > 0, (FinalRebateAmount * -1), FinalRebateAmount) AS FinalRebateAmount
				, IIF([ConferenceCreditPercentage]> 0, (ConferenceCreditPercentage * -1), ConferenceCreditPercentage) AS ConferenceCreditPercentage
				, IIF([ConferenceCreditAmount]> 0, (ConferenceCreditAmount * -1), ConferenceCreditAmount) AS ConferenceCreditAmount
				FROM Staging.APISalesDetail
				WHERE [TransTypeCode] = 'R' -- S2K Code
				--AND ItemDescription NOT LIKE '%CREDIT%' --ASW Code RSE 08/20/2020
			) AS dt ON x.ID = dt.ID


	--Tier 2 rebates will not be reported. Set any "Rebate Amount" columns to $0.00
	UPDATE x
	SET FinalRebateAmount = 0.00
	FROM Staging.APISalesDetail AS x
	WHERE x.ItemGrp = 'G06'	



END















GO
