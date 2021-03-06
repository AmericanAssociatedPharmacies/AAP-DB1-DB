USE [Purchases]
GO
/****** Object:  View [dbo].[v_CHPH_AAPGCN]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CHPH_AAPGCN]
AS
SELECT     TOP (25) FDB.dbo.v_NDCGCN.GCN, MIN(dbo.CHPH_AAP.TRADE_NAME) AS TradeName, MIN(dbo.CHPH_AAP.STRENGTH) AS Stength, 
                      MIN(dbo.CHPH_AAP.UNIT_COST) AS UnitCost, SUM(dbo.CHPH_AAP.EXT_COST) AS TotalextCost, 
                      AVG(claims.dbo.UPRx30.TotalPaid / claims.dbo.UPRx30.[Qty Dispensed]) AS AvgReimb
FROM         dbo.CHPH_AAP INNER JOIN
                      FDB.dbo.v_NDCGCN ON dbo.CHPH_AAP.NDC = FDB.dbo.v_NDCGCN.NDC INNER JOIN
                      claims.dbo.UPRx30 ON dbo.CHPH_AAP.NDC = claims.dbo.UPRx30.NDC
WHERE     (dbo.CHPH_AAP.INV_DATE > DATEADD(mm, - 1, GETDATE())) AND (dbo.CHPH_AAP.UNIT_COST > 0)
GROUP BY FDB.dbo.v_NDCGCN.GCN, claims.dbo.UPRx30.TotalPaid
ORDER BY TotalextCost DESC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[63] 4[7] 2[18] 3) )"
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
         Begin Table = "CHPH_AAP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 333
               Right = 301
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_NDCGCN (FDB.dbo)"
            Begin Extent = 
               Top = 9
               Left = 397
               Bottom = 168
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UPRx30 (claims.dbo)"
            Begin Extent = 
               Top = 215
               Left = 397
               Bottom = 498
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 4
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
         Alias = 2010
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPH_AAPGCN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPH_AAPGCN'
GO
