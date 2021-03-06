USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeReport]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_VendorVolumeReport]
AS
SELECT        dbo.VendorTransaction.PaidDt, dbo.Partners.VendorName, dbo.VendorVolumeRebate.ID, dbo.VendorVolumeRebate.VendorID, dbo.VendorVolumeRebate.PMID, 
                         dbo.VendorVolumeRebate.UDNo, dbo.VendorVolumeRebate.StoreName, dbo.VendorVolumeRebate.VolumeAmt, dbo.VendorVolumeRebate.RebateAmt, 
                         dbo.VendorVolumeRebate.AccruedStartdt, dbo.VendorVolumeRebate.AccruedEnddt, dbo.VendorVolumeRebate.FileID, dbo.VendorVolumeRebate.TransactionID, 
                         dbo.VendorLoad.FileName, dbo.VendorLoad.LoadDate, dbo.VendorLoad.LoadedBy, dbo.VendorVolumeRebate.Eligibility, dbo.VendorVolumeRebate.PayTo, 
                         dbo.VendorVolumeRebate.StorePaidDt, dbo.PPStores.AccountName
FROM            dbo.Partners INNER JOIN
                         dbo.VendorTransaction ON dbo.Partners.VendorID = dbo.VendorTransaction.VendorID INNER JOIN
                         dbo.VendorVolumeRebate ON dbo.VendorTransaction.TransactionID = dbo.VendorVolumeRebate.TransactionID LEFT OUTER JOIN
                         dbo.PPStores ON dbo.VendorVolumeRebate.PMID = dbo.PPStores.PMID LEFT OUTER JOIN
                         dbo.VendorLoad ON dbo.VendorVolumeRebate.FileID = dbo.VendorLoad.FileID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[20] 3) )"
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
         Begin Table = "Partners"
            Begin Extent = 
               Top = 254
               Left = 858
               Bottom = 391
               Right = 1091
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VendorTransaction"
            Begin Extent = 
               Top = 260
               Left = 508
               Bottom = 391
               Right = 714
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VendorVolumeRebate"
            Begin Extent = 
               Top = 0
               Left = 77
               Bottom = 345
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VendorLoad"
            Begin Extent = 
               Top = 125
               Left = 510
               Bottom = 254
               Right = 706
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PPStores"
            Begin Extent = 
               Top = 4
               Left = 766
               Bottom = 246
               Right = 1025
            End
            DisplayFlags = 280
            TopColumn = 5
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
      Begin ColumnWidths = 11
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
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeReport'
GO
