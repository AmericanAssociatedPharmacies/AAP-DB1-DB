USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[PP_Journal_20190322]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PP_Journal_20190322]

AS

SELECT dt.PMID
, CASE	
		WHEN Affiliate IS NULL AND AAPPaymentMode = 'Check' AND PaymentAmt >= 30 THEN CONVERT(NUMERIC(8,2), PaymentAmt - 15) * Eligible
		WHEN Affiliate IS NULL AND AAPPaymentMode = 'Check' AND PaymentAmt < 30 THEN 0
		WHEN Affiliate IS NULL AND AAPPaymentMode = 'ACH' AND PaymentAmt >= 15 THEN CONVERT(NUMERIC(8,2), PaymentAmt) * Eligible
		WHEN Affiliate IS NULL AND AAPPaymentMode = 'ACH' AND PaymentAmt < 15 THEN 0
		ELSE 0
		END AS PaidToStore
FROM(SELECT a.PMID
	, MIN(Eligibility) AS Eligible
	, MIN(Affiliate) AS Affiliate
	, ISNULL(MIN(a.AAPPaymentMode), MIN(b.AAPPaymentMode)) AS AAPPaymentMode
	, SUM(PaymentAmt) AS PaymentAmt
	FROM dbo.PP_20190321 AS a
	LEFT OUTER JOIN [dbo].[PMIDAAPPaymentMethods_20190322] AS b ON a.PMID = b.PMID
	WHERE a.AAPPaymentMode IS NOT NULL
			OR b.AAPPaymentMode IS NOT NULL
	GROUP BY a.PMID
	) AS dt
	--WHERE PMID = 108260
--ORDER BY dt.PMID ASC
GO
