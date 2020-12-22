USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT     TOP (100) PERCENT '2014Q2' AS Period, e.PMID, p.VendorName, a.AccountName, SUM(e.VolumeAmt) AS VolumeAmt, SUM(e.RebateAmt) AS RebateAmt, 
                      CONVERT(numeric(8, 2), SUM(e.RebateAmt) * .90) AS PaymentAmt, MIN(e.Eligibility) AS Eligible, MIN(e.Affiliate) AS Affiliate, (CASE WHEN (MIN(e.AAPQuitDate) 
                      >= '04/01/2014' AND MIN(e.AAPQuitDate) < '07/01/2014' AND Year(MIN(e.AAPQuitDate)) = '2014') THEN 1 ELSE 0 END) AS LastPayment, CONVERT(numeric(8, 2), 
                      SUM(CASE WHEN (e.Affiliate IS NULL) THEN ((RebateAmt * .90) * Eligibility) ELSE 0 END)) AS PaidToStore, CONVERT(numeric(8, 2), 
                      SUM(CASE WHEN (e.Affiliate IS NOT NULL) THEN ((RebateAmt * .90) * Eligibility) ELSE 0 END)) AS PaidToAffiliate
FROM         dbo.v_VendorVolumeEligibility AS e LEFT OUTER JOIN
                      dbo.Partners AS p ON e.VendorID = p.VendorID LEFT OUTER JOIN
                      dbo.v_PM_AllWithAffiliates AS a ON e.PMID = a.PMID
GROUP BY e.PMID, p.VendorID, p.VendorName, a.AccountName
HAVING      (MIN(e.Affiliate) IS NOT NULL) OR
                      (MIN(e.Affiliate) IS NULL) AND (SUM(e.RebateAmt) * .90 > 15)
ORDER BY e.PMID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 125
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 547
               Bottom = 125
               Right = 757
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
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
