USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_RevenueDistributionByPharmacyFor2019]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_RevenueDistributionByPharmacyFor2019]

AS


SELECT 
	f.Period
	, f.PMID
	, SUM(f.VolumeAmt) as VolumeAmt
	, SUM(f.RebateAmt) as RebateAmt
	, f.Affiliate
	, SUM(f.AdminFeeAmount) as AdminFeeAmount
	, SUM(f.RebateAmount) as RebateAmount
	, SUM(f.RebateAmount) as FinalPaymentAmount
FROM (
	SELECT 
		'2019' as Period
		, v.PMID
		, v.VolumeAmt
		, v.RebateAmt
		, v.Affiliate
		--, pm.Affiliate as PMAffiliate
		, ISNULL(rev.[Admin Fee], 0) as AdminFeeFraction
		, ISNULL(rev.Rebate, 0) as RebateFraction
		, ISNULL(rev.[Admin Fee], 0) + ISNULL(rev.Rebate, 0) as TotalFraction
		, ISNULL(rev.[Admin Fee], 0) * v.RebateAmt as AdminFeeAmount
		, ISNULL(rev.Rebate, 0) * v.RebateAmt as RebateAmount
		, v.RebateAmt as TotalRebateAmountLoaded
	FROM 
		(SELECT 
			PMID
			, Affiliate
			, VendorID
			, Eligibility
			, SUM(VolumeAmt) as VolumeAmt
			, SUM(RebateAmt) as RebateAmt
			FROM 
			PharmacyMaster.dbo.VendorVolumeRebate as a
		WHERE 
			StorePaidDt IS NULL 
			AND Eligibility = 1
		GROUP BY 
			PMID, Affiliate, VendorID, Eligibility
		) as v
	LEFT JOIN 
		PharmacyMaster.dbo.Partners as p
		ON v.VendorID = p.VendorID
	LEFT JOIN 
		PharmacyMaster.dbo.v_PM_AllWithAffiliates as pm
		ON v.PMID = pm.PMID
	LEFT JOIN 
		PharmacyMaster.dbo.PPRevenueDistribution2019 as rev
		ON v.VendorID = rev.VendorID
	--ORDER BY v.PMID, p.VendorID
) as f
GROUP BY Period, PMID, Affiliate
GO
