USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeSales]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_VendorVolumeSales]
AS
------------------------------------------------------------- Orginal----------------------------------------------------------------------------------
 /* SELECT     '2014Q2' AS Period, PMID, SUM(VolumeAmt) AS VolumeAmt, SUM(RebateAmt) AS RebateAmt, CONVERT(numeric(8, 2), SUM(RebateAmt) * .90) AS PaymentAmt, 
                      MIN(Eligibility) AS Eligible, MIN(Affiliate) AS Affiliate, (CASE WHEN (MIN(AAPQuitDate) >= '04/01/2014' AND MIN(AAPQuitDate) < '07/01/2014' AND 
                      Year(MIN(AAPQuitDate)) = '2014') THEN 1 ELSE 0 END) AS LastPayment, CONVERT(numeric(8, 2), SUM(CASE WHEN (Affiliate IS NULL) THEN ((RebateAmt * .90) 
                      * Eligibility) ELSE 0 END)) AS PaidToStore, CONVERT(numeric(8, 2), SUM(CASE WHEN (Affiliate IS NOT NULL) THEN ((RebateAmt * .90) * Eligibility) ELSE 0 END)) 
                      AS PaidToAffiliate
FROM         dbo.v_VendorVolumeEligibility
GROUP BY PMID
HAVING      (MIN(Affiliate) IS NOT NULL) OR
                      (MIN(Affiliate) IS NULL) AND (SUM(RebateAmt) * .90 > 15) */

-------------------------------------------------Changed: 11/20/2014-------------------------------------------------------------------------------
-- Deduct $15 check fee from stores (without an affiliate) whose balance is more than $30. 
-- Use PPStores table instead of PM_Pharmacy
-- USE Min and Max instead of grouping by Eligibility, Affiliate and Paymentmode.

/*SELECT  
 '2014Q3' AS Period,
 e.PMID,
SUM(VolumeAmt) AS VolumeAmt,
CONVERT(numeric(8, 2),SUM(e.RebateAmt)) AS [RebateAmt],
CONVERT(numeric(8, 2),SUM(e.RebateAmt*0.90)) AS [PaymentAmt],
MIN(Eligibility) AS Eligible,
--MIN(pp.AAPPaymentMode) AS PayMode, 
MIN(e.Affiliate) AS Affiliate, 
(CASE WHEN (MIN(e.AAPQuitDate) >= '07/01/2014' AND MIN(e.AAPQuitDate) < '11/01/2014' AND Year(MIN(e.AAPQuitDate)) = '2014') THEN 1 ELSE 0 END) AS LastPayment, 
 CASE  WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'Check' AND SUM(e.RebateAmt*0.90)>30) THEN CONVERT(numeric(8, 2),SUM(e.RebateAmt * .90) -15) * MIN(Eligibility)
      WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'Check' AND SUM(e.RebateAmt*0.90) < 30 ) THEN 0
      WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'ACH') THEN CONVERT(numeric(8, 2),SUM(e.RebateAmt * .90)) * MIN(Eligibility)
      ELSE 0 END AS [PaidToStore],
CONVERT(numeric(8, 2), SUM(CASE WHEN (e.Affiliate IS NOT NULL) THEN ((e.RebateAmt * .90) * Eligibility) ELSE 0 END)) AS PaidToAffiliate
from v_VendorVolumeEligibility e
LEFT JOIN PharmacyMaster..PPStores pp
ON e.PMID = pp.PMID
GROUP by e.PMID
HAVING  (MIN(e.Affiliate) IS NOT NULL) OR (MIN(e.Affiliate) IS NULL) AND (SUM(e.RebateAmt) * .90 > 15)*/

-------------------------------------------------Changed: 01/13/2016-------------------------------------------------------------------------------
/* SELECT  
 '2014Q4' AS Period,
 e.PMID,
SUM(VolumeAmt) AS VolumeAmt,
CONVERT(numeric(8, 2),SUM(e.RebateAmt)) AS [RebateAmt],
CONVERT(numeric(8, 2),SUM(e.RebateAmt*0.90)) AS [PaymentAmt],
MIN(Eligibility) AS Eligible,
--MIN(pp.AAPPaymentMode) AS PayMode, 
MIN(e.Affiliate) AS Affiliate, 
(CASE WHEN (MIN(e.AAPQuitDate) >= '10/01/2014' AND MIN(e.AAPQuitDate) < '01/01/2015' AND Year(MIN(e.AAPQuitDate)) = '2014') THEN 1 ELSE 0 END) AS LastPayment, 
 CASE  WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'Check' AND SUM(e.RebateAmt*0.90) >= 30) THEN CONVERT(numeric(8, 2),SUM(e.RebateAmt * .90) -15) * MIN(Eligibility)
       WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'Check' AND SUM(e.RebateAmt*0.90) < 30 ) THEN 0
       WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'ACH' AND (SUM(e.RebateAmt) * .90 >= 15)) THEN CONVERT(numeric(8, 2),SUM(e.RebateAmt * .90)) * MIN(Eligibility)
       WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'ACH' AND SUM(e.RebateAmt*0.90) < 15 ) THEN 0
       ELSE 0 END AS [PaidToStore],
CONVERT(numeric(8, 2), SUM(CASE WHEN (e.Affiliate IS NOT NULL) THEN ((e.RebateAmt * .90) * Eligibility) ELSE 0 END)) AS PaidToAffiliate
from v_VendorVolumeEligibility e
LEFT JOIN PharmacyMaster..PPStores pp
ON e.PMID = pp.PMID
GROUP by e.PMID
HAVING  (MIN(e.Affiliate) IS NOT NULL) OR (MIN(e.Affiliate) IS NULL) AND (SUM(e.RebateAmt) * .90 > 15) */


--Commented out 3/23/2018 by LA
--New requirement to apply a selected distribution % per vendor, rather than a flat 90%

--SELECT  
-- '2016' AS Period,
-- e.PMID,
--SUM(VolumeAmt) AS VolumeAmt,
--CONVERT(numeric(8, 2),SUM(e.RebateAmt)) AS [RebateAmt],
--CONVERT(numeric(8, 2),SUM(e.RebateAmt*0.90)) AS [PaymentAmt],
--MIN(Eligibility) AS Eligible,
----MIN(pp.AAPPaymentMode) AS PayMode, 
--MIN(e.Affiliate) AS Affiliate, 
--(CASE WHEN Year(MIN(e.AAPQuitDate)) = '2016' THEN 1 ELSE 0 END) AS LastPayment,
-- CASE  WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode) = 'Check' AND SUM(e.RebateAmt*0.90) >= 30) THEN CONVERT(numeric(8, 2),SUM(e.RebateAmt * .90) -15) * MIN(Eligibility)
--       WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'Check' AND SUM(e.RebateAmt*0.90) < 30 ) THEN 0
--       WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'ACH' AND (SUM(e.RebateAmt) * .90 >= 15)) THEN CONVERT(numeric(8, 2),SUM(e.RebateAmt * .90)) * MIN(Eligibility)
--       WHEN (MIN(e.Affiliate) IS NULL AND MIN(AAPPaymentMode)  = 'ACH' AND SUM(e.RebateAmt*0.90) < 15 ) THEN 0
--       ELSE 0 END AS [PaidToStore],
--CONVERT(numeric(8, 2), SUM(CASE WHEN (e.Affiliate IS NOT NULL) THEN ((e.RebateAmt * .90) * Eligibility) ELSE 0 END)) AS PaidToAffiliate
--from v_VendorVolumeEligibility e
--LEFT JOIN PharmacyMaster..PPStores pp
--ON e.PMID = pp.PMID
--GROUP by e.PMID
--HAVING  (MIN(e.Affiliate) IS NOT NULL) OR (MIN(e.Affiliate) IS NULL) AND (SUM(e.RebateAmt) * .90 > 15)


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
	, CONVERT(NUMERIC(8,2), CASE WHEN MIN(Affiliate) IS NOT NULL THEN (SUM(PaymentAmt)* MIN(Eligible)) ELSE 0 END) AS PaidToAffiliates
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
					'2017' as Period
					, vve.PMID
					, vve.VendorID
					, vve.VendorName
					, SUM(vve.VolumeAmt) as VolumeAmt
					, CONVERT(NUMERIC(8,2), SUM(vve.RebateAmt)) as RebateAmt
					, MIN(vve.Eligibility) as Eligible
					, MIN(vve.Affiliate) as Affiliate
					, CASE 
						WHEN YEAR(MIN(vve.AAPQuitDate)) = '2017' THEN 1 
						ELSE 0 
						END AS LastPayment
				FROM 
					PharmacyMaster.dbo.v_VendorVolumeEligibility as vve
				WHERE (vve.Affiliate IS NOT NULL) OR (vve.Affiliate IS NULL)
				GROUP BY vve.PMID, vve.VendorID, vve.VendorName
			) as pp
		LEFT JOIN 
			PharmacyMaster.dbo.PP_DistributionAmount2018 as dp
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
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[33] 2[37] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v_VendorVolumeEligibility"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 225
               Right = 334
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 12180
         Alias = 1860
         Table = 2670
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1425
         Or = 2025
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeSales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeSales'
GO
