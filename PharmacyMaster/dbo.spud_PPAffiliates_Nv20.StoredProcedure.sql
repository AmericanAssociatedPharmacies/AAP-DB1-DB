USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPAffiliates_Nv20]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOS/ILA  NARAYANAN
-- Create date: 08/08/2012
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_PPAffiliates_Nv20]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

Select  Affiliate, 
SUM(VolumeAmt) as TotalVol,
SUM(RebateAmt) as Totalrebate, 
Convert(numeric(8,2),SUM(RebateAmt) * .90) AS PaymentAmt, 
Convert(numeric(8,2),SUM(RebateAmt) * .90) AS [PaymentAmt-Fee],
Convert(numeric(8,2),SUM(Case WHEN Eligibility=0 Then 0 ELSE (RebateAmt * .90) END)) AS Payment 
from v_VendorVolumeAff WHERE Affiliate IS NOT NULL
GROUP BY Affiliate

UNION

Select 'Others ACH' As Affiliate, SUM(TotalVol) as TotalVol,SUM(Totalrebate) as Totalrebate,SUM(PaymentAmt) as PaymentAmt, SUM ([PaymentAmt-Fee]) as [PaymentAmt-Fee], SUM(Payment) as Payment 
FROM (Select 
SUM(VolumeAmt) as TotalVol,
SUM(RebateAmt) as Totalrebate, 
Convert(numeric(8,2),SUM(RebateAmt) * .90) AS PaymentAmt, 
CASE WHEN Eligibility = 0 THEN 0 ELSE Convert(numeric(8,2),SUM(RebateAmt) * .90) END AS [PaymentAmt-Fee],
CASE WHEN Eligibility = 0 THEN 0 ELSE Convert(numeric(8,2),SUM(RebateAmt) * .90) END AS [Payment]
from v_VendorVolumeAff 
LEFT JOIN PharmacyMaster..PM_Pharmacy pm
ON v_VendorVolumeAff.PMID = pm.PMID
WHERE Affiliate IS NULL 
GROUP BY v_VendorVolumeAff .PMID, Eligibility, pm.AAPPaymentMode
HAVING SUM(RebateAmt *.9) >= 15 AND pm.AAPPaymentMode = 'ACH')v


UNION

Select 'Others CHECK' As Affiliate, SUM(TotalVol) as TotalVol,SUM(Totalrebate) as Totalrebate,SUM(PaymentAmt) as PaymentAmt, SUM ([PaymentAmt-Fee]) as [PaymentAmt-Fee], SUM(Payment) as Payment 
FROM (Select 
SUM(VolumeAmt) as TotalVol,
SUM(RebateAmt) as Totalrebate, 
Convert(numeric(8,2),SUM(RebateAmt) * .90) AS PaymentAmt, 
--Convert(numeric(8,2),SUM(RebateAmt) * .90) AS [PaymentAmt-Fee],
CASE WHEN Eligibility = 0 THEN 0 ELSE CONVERT(numeric(8, 2),SUM(RebateAmt * .90) -15) END AS [PaymentAmt-Fee],
CASE WHEN Eligibility = 0 THEN 0 ELSE CONVERT(numeric(8, 2),SUM(RebateAmt * .90) -15) END AS [Payment]
from v_VendorVolumeAff 
LEFT JOIN PharmacyMaster..PM_Pharmacy pm
ON v_VendorVolumeAff.PMID = pm.PMID
WHERE Affiliate IS NULL 
GROUP BY v_VendorVolumeAff .PMID, Eligibility, pm.AAPPaymentMode
HAVING SUM(RebateAmt *.9) >= 30 AND pm.AAPPaymentMode = 'Check'  )v

UNION

Select 'Others ACH Less Than 15' As Affiliate, SUM(TotalVol) as TotalVol,SUM(Totalrebate) as Totalrebate,SUM(PaymentAmt) as PaymentAmt,
SUM([PaymentAmt-Fee]) AS [PaymentAmt-Fee],  SUM(Payment) as Payment 
FROM (Select 
SUM(VolumeAmt) as TotalVol,
SUM(RebateAmt) as Totalrebate, 
Convert(numeric(8,2),SUM(RebateAmt) * .90) AS PaymentAmt, 
Convert(numeric(8,2),SUM(Case WHEN Eligibility=0 Then 0 ELSE (RebateAmt * .90) END)) AS [PaymentAmt-Fee],
Convert(numeric(8,2),SUM(Case WHEN Eligibility=0 Then 0 ELSE (RebateAmt * .90) END)) AS Payment 
from v_VendorVolumeAff 
LEFT JOIN PharmacyMaster..PM_Pharmacy pm
ON v_VendorVolumeAff.PMID = pm.PMID
WHERE Affiliate IS NULL 
GROUP BY v_VendorVolumeAff .PMID, pm.AAPPaymentMode
HAVING SUM(RebateAmt *.9) < 15 AND pm.AAPPaymentMode = 'ACH'  ) v


UNION

Select 'Others CHECK Less Than 30' As Affiliate, SUM(TotalVol) as TotalVol,SUM(Totalrebate) as Totalrebate,SUM(PaymentAmt) as PaymentAmt,
SUM([PaymentAmt-Fee]) AS [PaymentAmt-Fee],  SUM(Payment) as Payment 
FROM (Select 
SUM(VolumeAmt) as TotalVol,
SUM(RebateAmt) as Totalrebate, 
Convert(numeric(8,2),SUM(RebateAmt) * .90) AS PaymentAmt, 
Convert(numeric(8,2),SUM(Case WHEN Eligibility=0 Then 0 ELSE (RebateAmt * .90) END)) AS [PaymentAmt-Fee],
Convert(numeric(8,2),SUM(Case WHEN Eligibility=0 Then 0 ELSE (RebateAmt * .90) END)) AS Payment 
from v_VendorVolumeAff 
LEFT JOIN PharmacyMaster..PM_Pharmacy pm
ON v_VendorVolumeAff.PMID = pm.PMID
WHERE Affiliate IS NULL 
GROUP BY v_VendorVolumeAff .PMID, pm.AAPPaymentMode
HAVING SUM(RebateAmt *.9) < 30 AND pm.AAPPaymentMode = 'Check' ) v

END
GO
