USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeAff]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_VendorVolumeAff]
AS
SELECT     dbo.v_VendorVolumeRebate.ID, dbo.v_VendorVolumeRebate.VendorID, dbo.v_VendorVolumeRebate.PMID, dbo.v_VendorVolumeRebate.UDNo, 
                      dbo.v_VendorVolumeRebate.StoreName, dbo.v_VendorVolumeRebate.VolumeAmt, dbo.v_VendorVolumeRebate.RebateAmt, 
                      dbo.v_VendorVolumeRebate.AccruedStartdt, dbo.v_VendorVolumeRebate.AccruedEnddt, dbo.v_VendorVolumeRebate.FileID, 
                      dbo.v_VendorVolumeRebate.TransactionID, dbo.v_VendorVolumeRebate.Eligibility, dbo.v_VendorVolumeRebate.PayTo, dbo.PPStores.AAPAccountNo, 
                      dbo.PPStores.NCPDP, dbo.PPStores.DEA, dbo.PPStores.AccountName, dbo.PPStores.Addr1, dbo.PPStores.Addr2, dbo.PPStores.City, dbo.PPStores.State, 
                      CONVERT(varchar, dbo.PPStores.AAPQuitDate, 101) AS AAPQuitDate, dbo.PPStores.PMParentID, dbo.PPStores.Zip, dbo.PPStores.AAPParentNo, 
                      dbo.v_VendorVolumeRebate.Affiliate, dbo.v_VendorVolumeRebate.StorePaidDt, dbo.PPStores.Affiliate AS PMAffiliate, dbo.v_VendorVolumeRebate.VendorName, 
                      CASE WHEN RebateReportDisplayName IS NULL THEN v_VendorVolumeRebate.VendorName ELSE RebateReportDisplayName END AS ReportVendorName, 
                      dbo.PPStores.PMID AS PMPMID, dbo.PPStores.AAPPaymentMode, dbo.v_VendorVolumeRebate.FileName, dbo.v_VendorVolumeRebate.PaidDt, 
                      dbo.v_VendorVolumeRebate.LoadDate
FROM         dbo.v_VendorVolumeRebate LEFT OUTER JOIN
                      dbo.PPStores ON dbo.v_VendorVolumeRebate.PMID = dbo.PPStores.PMID
WHERE     (dbo.v_VendorVolumeRebate.StorePaidDt IS NULL) AND (dbo.v_VendorVolumeRebate.PMID IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[24] 2[23] 3) )"
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
         Begin Table = "v_VendorVolumeRebate"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 342
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "PPStores"
            Begin Extent = 
               Top = 3
               Left = 296
               Bottom = 319
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 22
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
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeAff'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeAff'
GO
