USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeDetailed]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_VendorVolumeDetailed]
AS

/* SELECT     TOP (100) PERCENT r.PMID, p.VendorName, r.Affiliate, r.Eligibility, SUM(r.VolumeAmt) AS Volume, SUM(r.RebateAmt) AS [Rebate Amount], dbo.PPStores.AccountName, 
                      dbo.PPStores.AAPPaymentMode
FROM                  dbo.VendorVolumeRebate AS r LEFT OUTER JOIN
                      dbo.PPStores ON r.PMID = dbo.PPStores.PMID LEFT OUTER JOIN
                      dbo.Partners AS p ON r.VendorID = p.VendorID
GROUP BY r.PMID, r.VendorID, p.VendorName, r.Affiliate, r.Eligibility, dbo.PPStores.AccountName, dbo.PPStores.AAPPaymentMode
ORDER BY r.PMID */


SELECT     TOP (100) PERCENT 
'2014Q3' AS Period,
MIN(StorePaidDt) AS [StorePaidDT],
dbo.VendorVolumeRebate.PMID, MIN ( dbo.Partners.VendorName) AS [VendorName], MIN(dbo.VendorVolumeRebate.Affiliate) AS [Affiliate], 
                         MIN(dbo.VendorVolumeRebate.Eligibility) AS [Eligibility], 
                        SUM(dbo.VendorVolumeRebate.VolumeAmt) AS Volume, SUM(dbo.VendorVolumeRebate.RebateAmt) AS [Rebate Amount], 
                        MIN (PPStores.AccountName) AS [AccountName], 
                        MIN(PPStores.AAPPaymentMode)AS [AAPPaymentMode]
FROM                  dbo.VendorVolumeRebate LEFT OUTER JOIN
                      dbo.PPStores ON dbo.VendorVolumeRebate.PMID = dbo.PPStores.PMID LEFT OUTER JOIN
                      dbo.Partners ON dbo.VendorVolumeRebate.VendorID =  dbo.Partners.VendorID
WHERE (dbo.VendorVolumeRebate.StorePaidDt IS NULL) AND (dbo.VendorVolumeRebate.PMID IS NOT NULL)
GROUP BY dbo.VendorVolumeRebate.PMID,  dbo.Partners.VendorID
--ORDER BY r.PMID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[15] 2[15] 3) )"
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
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 322
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PPStores"
            Begin Extent = 
               Top = 196
               Left = 578
               Bottom = 419
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 14
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 23
               Left = 568
               Bottom = 142
               Right = 802
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
      Begin ColumnWidths = 9
         Width = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeDetailed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_VendorVolumeDetailed'
GO
