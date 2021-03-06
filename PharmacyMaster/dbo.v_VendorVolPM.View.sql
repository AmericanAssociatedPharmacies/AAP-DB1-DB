USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolPM]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_VendorVolPM]
AS
SELECT     dbo.VendorVolumeRebate.PMID, dbo.VendorVolumeRebate.UDNo, dbo.VendorVolumeRebate.StoreName, dbo.VendorVolumeRebate.VolumeAmt, 
                      dbo.VendorVolumeRebate.RebateAmt, dbo.PPStores.City, dbo.PPStores.State, dbo.PPStores.Zip, dbo.PPStores.DEA, dbo.PPStores.NCPDP, 
                      dbo.PPStores.AAPAccountNo, dbo.PPStores.AccountName, dbo.VendorVolumeRebate.FileID, dbo.PPStores.Addr1, dbo.VendorVolumeRebate.AccruedStartdt, 
                      dbo.VendorVolumeRebate.AccruedEnddt, dbo.VendorVolumeRebate.ID, dbo.Partners.VendorName, dbo.VendorVolumeRebate.VendorID, 
                      dbo.VendorVolumeRebate.TransactionID, dbo.VendorVolumeRebate.StorePaidDt, dbo.VendorVolumeRebate.Eligibility
FROM         dbo.VendorVolumeRebate LEFT OUTER JOIN
                      dbo.Partners ON dbo.VendorVolumeRebate.VendorID = dbo.Partners.VendorID LEFT OUTER JOIN
                      dbo.PPStores ON dbo.VendorVolumeRebate.PMID = dbo.PPStores.PMID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[65] 4[1] 2[28] 3) )"
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
               Top = 6
               Left = 38
               Bottom = 306
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Partners"
            Begin Extent = 
               Top = 18
               Left = 439
               Bottom = 148
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PPStores"
            Begin Extent = 
               Top = 6
               Left = 670
               Bottom = 125
               Right = 851
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
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3420
         Width = 1500
         Width = 1500
         Width = 2940
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
         Column = 1440
         Alias = 2565
         Table = 3750
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolPM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolPM'
GO
