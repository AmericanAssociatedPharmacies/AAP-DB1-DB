USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_RevenueDistributionByPharmacy]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_RevenueDistributionByPharmacy]

AS


SELECT 
	'2019' as Period
	, v.PMID
	, p.VendorName
	, p.VendorID
	, pm.AccountName
	, pm.Addr1
	, pm.Addr2
	, pm.City
	, pm.State
	, pm.Zip
	, pm.NCPDP
	, v.Affiliate
	, pm.Affiliate as PMAffiliate
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
		, SUM(RebateAmt) as RebateAmt
		FROM 
		PharmacyMaster.dbo.VendorVolumeRebate 
	WHERE 
		StorePaidDt IS NULL 
		AND Eligibility = 1
	GROUP BY 
		PMID, Affiliate, VendorID
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
GO
