USE [reporting]
GO
/****** Object:  View [dbo].[v_CHPHNABPGCN]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CHPHNABPGCN]
AS
SELECT     TOP (100) PERCENT dbo.v_CHPHNABP.EXT_COST, dbo.v_CHPHNABP.INVOICE_NO, dbo.v_CHPHNABP.INV_DATE, dbo.v_CHPHNABP.SHIP_QTY, 
                      dbo.v_CHPHNABP.ORDER_QTY, dbo.v_CHPHNABP.NABP, dbo.v_CHPHNABP.ITEM_DESCR, dbo.v_CHPHNABP.BRAND, dbo.v_CHPHNABP.GCN, 
                      dbo.v_CHPHNABP.PS, dbo.v_CHPHNABP.NDC, dbo.v_LowestGCNNDC.NDC AS BestNDC, dbo.v_LowestGCNNDC.PricePerUnit, 
                      dbo.v_LowestGCNNDC.GCN AS BestGCN, dbo.v_CHPHNABP.GTI, dbo.v_CHPHNABP.NDCGI1, dbo.v_CHPHNABP.UNIT_COST, dbo.v_CHPHNABP.GMI, 
                      dbo.v_CHPHNABP.STORE, claims.dbo.Rx30Stores.ProfitMinder
FROM         dbo.v_CHPHNABP INNER JOIN
                      claims.dbo.Rx30Stores ON dbo.v_CHPHNABP.NABP = claims.dbo.Rx30Stores.NABP LEFT OUTER JOIN
                      dbo.v_LowestGCNNDC ON dbo.v_CHPHNABP.GCN = dbo.v_LowestGCNNDC.GCN
WHERE     (dbo.v_CHPHNABP.NDC <> dbo.v_LowestGCNNDC.NDC) AND (claims.dbo.Rx30Stores.ProfitMinder = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[16] 2[17] 3) )"
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
         Begin Table = "v_CHPHNABP"
            Begin Extent = 
               Top = 11
               Left = 32
               Bottom = 288
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Rx30Stores (claims.dbo)"
            Begin Extent = 
               Top = 178
               Left = 365
               Bottom = 278
               Right = 517
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_LowestGCNNDC"
            Begin Extent = 
               Top = 22
               Left = 340
               Bottom = 160
               Right = 529
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
      Begin ColumnWidths = 19
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2415
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
         Column = 1440
         Alias = 900
         Table = 2250
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
   En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHNABPGCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHNABPGCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHNABPGCN'
GO
