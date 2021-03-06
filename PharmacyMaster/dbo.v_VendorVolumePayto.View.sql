USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumePayto]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_VendorVolumePayto]
AS
SELECT     dbo.VendorVolumeRebate.ID, dbo.VendorVolumeRebate.VendorID, dbo.VendorVolumeRebate.PayTo AS PMID, dbo.VendorVolumeRebate.UDNo, 
                      dbo.VendorVolumeRebate.StoreName, dbo.VendorVolumeRebate.VolumeAmt, dbo.VendorVolumeRebate.RebateAmt, dbo.VendorVolumeRebate.AccruedStartdt, 
                      dbo.VendorVolumeRebate.AccruedEnddt, dbo.VendorVolumeRebate.FileID, dbo.VendorVolumeRebate.TransactionID, dbo.VendorVolumeRebate.Eligibility, 
                      dbo.VendorVolumeRebate.PayTo, dbo.PPStores.AAPAccountNo, dbo.PPStores.NCPDP, dbo.PPStores.DEA, dbo.PPStores.AccountName, dbo.PPStores.Addr1, 
                      dbo.PPStores.Addr2, dbo.PPStores.City, dbo.PPStores.State, CONVERT(varchar, dbo.PPStores.AAPQuitDate, 101) AS AAPQuitDate, dbo.PPStores.PMParentID, 
                      dbo.PPStores.Zip, dbo.PPStores.AAPParentNo, dbo.VendorVolumeRebate.Affiliate, dbo.VendorVolumeRebate.StorePaidDt, dbo.PPStores.Affiliate AS PMAffiliate, 
                      dbo.Partners.VendorName, CASE WHEN RebateReportDisplayName IS NULL THEN VendorName ELSE RebateReportDisplayName END AS ReportVendorName
FROM         dbo.VendorVolumeRebate LEFT OUTER JOIN
                      dbo.Partners ON dbo.VendorVolumeRebate.VendorID = dbo.Partners.VendorID LEFT OUTER JOIN
                      dbo.PPStores ON dbo.VendorVolumeRebate.PayTo = dbo.PPStores.PMID
WHERE     (dbo.VendorVolumeRebate.PayTo IS NOT NULL) AND (dbo.VendorVolumeRebate.StorePaidDt IS NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[12] 2[31] 3) )"
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
         Begin Table = "VendorVolumeRebate"
            Begin Extent = 
               Top = 17
               Left = 21
               Bottom = 327
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners"
            Begin Extent = 
               Top = 2
               Left = 322
               Bottom = 121
               Right = 526
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PPStores"
            Begin Extent = 
               Top = 6
               Left = 564
               Bottom = 125
               Right = 745
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
      Begin ColumnWidths = 32
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9240
         Alia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumePayto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N's = 4260
         Table = 3570
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumePayto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumePayto'
GO
