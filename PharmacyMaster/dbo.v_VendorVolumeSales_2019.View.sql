USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeSales_2019]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dbo].[v_VendorVolumeSales_2019]

AS

SELECT Period
	, PMID
	, VendorID
	, VendorName
	, SUM(VolumeAmt) as VolumeAmt
	, SUM(RebateAmt) as RebateAmt
	, SUM(PaymentAmt) as PaymentAmt
	, MIN(Eligible) as Eligible
	, MIN(Affiliate) as Affiliate
	, MIN(pmt.LastPayment) as LastPayment
	, CASE	
		WHEN MIN(Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'Check' AND SUM(PaymentAmt) >= 30 THEN CONVERT(NUMERIC(8,2), SUM(PaymentAmt) - 15) * MIN(Eligible)
		WHEN MIN(Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'Check' AND SUM(PaymentAmt) < 30 THEN 0
		WHEN MIN(Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'ACH' AND SUM(PaymentAmt) >= 15 THEN CONVERT(NUMERIC(8,2), SUM(PaymentAmt)) * MIN(Eligible)
		WHEN MIN(Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'ACH' AND SUM(PaymentAmt) < 15 THEN 0
		ELSE 0
		END AS PaidToStore
	, CONVERT(NUMERIC(8,2), 
							CASE WHEN MIN(Affiliate) IS NOT NULL THEN (SUM(PaymentAmt)* MIN(Eligible)) 
							ELSE 0 END
							) AS PaidToAffiliates
	
FROM 
	(
		SELECT 
			pp.Period
			, pp.PMID
			, pp.VendorID
			, pp.VendorName
			, pp.VolumeAmt
			, pp.RebateAmt
			, pp.RebateAmt * dp.DistributionPercent as PaymentAmt
			, pp.Eligible
			, pp.Affiliate
			, pp.LastPayment
			, s.AAPPaymentMode
		FROM (
				SELECT 
					'2019' as Period
					, vve.PMID
					, vve.VendorID
					, vve.VendorName
					, SUM(vve.VolumeAmt) as VolumeAmt
					, CONVERT(NUMERIC(8,2), SUM(vve.RebateAmt)) as RebateAmt
					, MIN(vve.Eligibility) as Eligible
					, MIN(vve.Affiliate) as Affiliate
					, CASE 
						WHEN YEAR(MIN(vve.AAPQuitDate)) = '2019' THEN 1 
						ELSE 0 
						END AS LastPayment
				FROM 
					PharmacyMaster.dbo.v_VendorVolumeEligibility_2018 as vve
				WHERE (vve.Affiliate IS NOT NULL) OR (vve.Affiliate IS NULL)
				GROUP BY vve.PMID, vve.VendorID, vve.VendorName
			) as pp
		LEFT JOIN 
			PharmacyMaster.dbo.PPRevenueDistribution2019 as dp
			ON pp.VendorID = dp.VendorID
		LEFT JOIN
			PharmacyMaster.dbo.PPStores as s
			ON pp.PMID = s.PMID 
			) as pmt
GROUP BY
	Period	
	, PMID
	, VendorID
	, VendorName
	














GO
