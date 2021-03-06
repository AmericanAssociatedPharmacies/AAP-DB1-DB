USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesDetail_SetHoldback]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		LeeAnn Carrell
-- Create date: 20180615
-- Description:	This stored procedure is used to update the API and Affiliate Holdback percent and amounts in the API Sales Detail load.
--	This procedure is executed daily, via the LoadAPICons C# application, via the API Sales Load windows scheduled job on DB1
-- =============================================
CREATE PROCEDURE [dbo].[usp_APISalesDetail_SetHoldback]
AS
BEGIN
	SET NOCOUNT ON;

	/*
	SET THE API AND AFFILIATE HOLDBACK PERCENT
	*/
	UPDATE sd
	SET sd.AffiliateHoldbackPercent = ISNULL(sdh.AffiliateHoldbackPercent, 0.00)
		, sd.APIHoldbackPercent = ISNULL(sdh.APIHoldbackPercent, 0.00)
	FROM API.dbo.APISalesDetail AS sd
	LEFT JOIN (
		SELECT WHAccountID
			, InvDate
			, InvNbr
			, APIItemNbr
			, OrderNbr
			, Rebate
			, CASE WHEN h.Group_ID IN (99,110,13) THEN IIF(hb.Rebate <> 0.00, h.HoldbackPercent, 0.00) --PFOA and CPI: Applied to total rebate
				WHEN h.Group_ID IN (7,6,9,103,109) THEN IIF(Type = 'Generic', h.HoldbackPercent, 0.00) --Keystone, RxPlus, SPC: Applied to Generic Sales
				WHEN h.Group_ID = 10 THEN IIF(Type = 'Generic', h.HoldbackPercent, IIF(Type = 'OTC', 0.005, 0.00)) --Legend: 1% Generic Sales, 0.5% OTC Sales
				ELSE 0.00
				END AS AffiliateHoldbackPercent
			, CASE WHEN Type = 'Generic' THEN h2.HoldbackPercent
				ELSE 0.00
				END AS APIHoldbackPercent
		FROM API.dbo.APISalesDetail as hb
		LEFT JOIN (SELECT * FROM PharmacyMaster.dbo.PM_HoldbackPercent WHERE HeldBy = 'API') as h2
			ON hb.InvDate >= h2.StartDate AND hb.InvDate <= h2.EndDate
		LEFT JOIN PharmacyMaster.dbo.v_APItoPMID_LifeTime as al 
			ON hb.WHAccountID = LEFT(al.APIAccountNo, 8) AND hb.InvDate >= al.API_PMID_EffectiveDate AND hb.InvDate < ISNULL(al.API_PMID_QuitDate, '29991231')
		LEFT JOIN PharmacyMaster.dbo.PM_Groups_xref as g
			ON al.PMID = g.PMID
		LEFT JOIN PharmacyMaster.dbo.PM_HoldbackPercent as h
			ON g.Group_ID = h.Group_ID AND hb.InvDate >= h.StartDate AND hb.InvDate <= h.EndDate
		WHERE (AffiliateHoldbackPercent IS NULL OR APIHoldbackPercent IS NULL)
		) sdh 
		ON sd.WHAccountID = sdh.WHAccountID AND sd. InvDate = sdh.InvDate AND sd.InvNbr = sdh.InvNbr AND sd.APIItemNbr = sdh.APIItemNbr AND sd.OrderNbr = sdh.OrderNbr AND sd.Rebate = sdh.Rebate
	WHERE (sd.AffiliateHoldbackPercent IS NULL OR sd.APIHoldbackPercent IS NULL)
		
	/*
	SET API AND AFFILIATE HOLDBACK AMOUNTS
	*/
	UPDATE sd
	SET sd.APIHoldbackAmount = sdh.APIHoldbackAmount
		, sd.AffiliateHoldbackAmount = sdh.AffiliateHoldbackAmount
	FROM API.dbo.APISalesDetail AS sd
	LEFT JOIN (
		SELECT WHAccountID
			, InvDate
			, InvNbr
			, APIItemNbr
			, OrderNbr
			, Rebate
			, APIHoldbackPercent
			, AffiliateHoldbackPercent
			, Type
			, CASE WHEN g.Group_ID IN (99,110,13) THEN hb.Rebate*hb.AffiliateHoldbackPercent
				WHEN g.Group_ID IN (7,6,9,103,109,13) THEN hb.ExtSales*hb.AffiliateHoldbackPercent
				ELSE 0.00
				END AS AffiliateHoldbackAmount
			, hb.ExtSales*hb.APIHoldbackPercent AS APIHoldbackAmount
		FROM API.dbo.APISalesDetail as hb
		--LEFT JOIN (SELECT * FROM PharmacyMaster.dbo.PM_HoldbackPercent WHERE HeldBy = 'API') as h2
		--	ON hb.InvDate >= h2.StartDate AND hb.InvDate <= h2.EndDate
		LEFT JOIN PharmacyMaster.dbo.v_APItoPMID_LifeTime as al 
			ON hb.WHAccountID = LEFT(al.APIAccountNo, 8) AND hb.InvDate >= al.API_PMID_EffectiveDate AND hb.InvDate < ISNULL(al.API_PMID_QuitDate, '29991231')
		LEFT JOIN PharmacyMaster.dbo.PM_Groups_xref as g
			ON al.PMID = g.PMID
		--LEFT JOIN PharmacyMaster.dbo.PM_HoldbackPercent as h
		--	ON g.Group_ID = h.Group_ID AND hb.InvDate >= h.StartDate AND hb.InvDate <= h.EndDate
		WHERE (APIHoldbackAmount IS NULL OR AffiliateHoldbackAmount IS NULL)
		) sdh 
		ON sd.WHAccountID = sdh.WHAccountID AND sd. InvDate = sdh.InvDate AND sd.InvNbr = sdh.InvNbr AND sd.APIItemNbr = sdh.APIItemNbr AND sd.OrderNbr = sdh.OrderNbr AND sd.Rebate = sdh.Rebate
	WHERE (sd.APIHoldbackAmount IS NULL OR sd.AffiliateHoldbackAmount IS NULL)

	/*
	SET REBATE AMOUNTS AFTER API AND AFFILIATE HOLDBACK AMOUNT
	*/
	UPDATE sd
	SET RebateAfterAPIHoldbackAmount = Rebate - APIHoldbackAmount
		, FinalRebateAmount = Rebate - APIHoldbackAmount - AffiliateHoldbackAmount
	FROM API.dbo.APISalesDetail AS sd
	WHERE RebateAfterAPIHoldbackAmount IS NULL OR FinalRebateAmount IS NULL

END



GO
