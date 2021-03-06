USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_RevenueDistributionByVendor]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vw_RevenueDistributionByVendor]

AS


SELECT 
	p.VendorName
	, p.VendorID
	, ISNULL(rev.[Admin Fee], 0) as AdminFeeFraction
	, ISNULL(rev.Rebate, 0) as RebateFraction
	, ISNULL(rev.[Admin Fee], 0) + ISNULL(rev.Rebate, 0) as TotalFraction
	, ISNULL(rev.[Admin Fee], 0) * v.RebateAmt as AdminFeeAmount
	, ISNULL(rev.Rebate, 0) * v.RebateAmt as RebateAmount
	, v.RebateAmt as TotalRebateAmountLoaded
	, ISNULL(rev.Rebate,0) as VendorDistributionPercentage
FROM 
	(SELECT 
		VendorID
		, SUM(RebateAmt) as RebateAmt
		FROM 
		PharmacyMaster.dbo.VendorVolumeRebate 
	WHERE 
		StorePaidDt IS NULL 
		--AND Eligibility = 1
		--AND DATEPART(YEAR, AccruedStartdt) = 2018 
		--AND StorePaidDt IS NULL
	GROUP BY 
		VendorID
	) as v
LEFT JOIN 
	PharmacyMaster.dbo.Partners as p
	ON v.VendorID = p.VendorID
LEFT JOIN 
	PharmacyMaster.dbo.PPRevenueDistribution2019 as rev
	ON v.VendorID = rev.VendorID
--ORDER BY p.VendorName

--SELECT SUM(RebateAmt)
--FROM PharmacyMaster.dbo.VendorVolumeRebate 
--WHERE VendorID = 198
--AND StorePaidDt IS NULL
--AND DATEPART(YEAR, AccruedStartdt) >= 2016

--SELECT *
--FROM PharmacyMaster.dbo.Partners
--WHERE VendorID 
--WHERE VendorName LIKE '%Digital%'
GO
