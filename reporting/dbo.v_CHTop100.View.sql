USE [reporting]
GO
/****** Object:  View [dbo].[v_CHTop100]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CHTop100]
AS
SELECT     dbo.CHTop100.Description, dbo.CHTop100.Size, dbo.CHTop100.Supplier, dbo.CHTop100.AWP, dbo.CHTop100.Top100Price, dbo.CHTop100.UDSPrice, 
                      dbo.CHTop100.PricePerUnit, dbo.CHTop100.BrandName, dbo.CHTop100.Form, dbo.CHTop100.Color, dbo.CHTop100.NDC, dbo.CHTop100.CIN, 
                      dbo.CHTop100.DP, dbo.CHTop100.GCN_SEQNO, dbo.CHTop100.Filedate, dbo.CHTop100.GCN, Medispan.dbo.M25_G.Generic_Product_Identifier AS GPI,
                       Medispan.dbo.M25_L.Package_Size AS PS
FROM         dbo.CHTop100 LEFT OUTER JOIN
                      Medispan.dbo.M25_L ON dbo.CHTop100.NDC = Medispan.dbo.M25_L.NDC_UPC_HRI LEFT OUTER JOIN
                      Medispan.dbo.M25_G ON dbo.CHTop100.NDC = Medispan.dbo.M25_G.NDC_UPC_HRI
WHERE     (dbo.CHTop100.Filedate =
                          (SELECT     MAX(Filedate) AS Expr1
                            FROM          dbo.CHTop100 AS CHTop100_1))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[17] 2[17] 3) )"
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
         Begin Table = "CHTop100"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 343
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M25_G (Medispan.dbo)"
            Begin Extent = 
               Top = 13
               Left = 300
               Bottom = 222
               Right = 557
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M25_L (Medispan.dbo)"
            Begin Extent = 
               Top = 237
               Left = 303
               Bottom = 504
               Right = 564
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
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1035
         Width = 2220
         Width = 855
         Width = 1200
         Width = 990
         Width = 1305
         Width = 1260
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 945
         Width = 1020
         Width = 1020
         Width = 1335
         Width = 1740
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1530
         Table = 2805
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 7290
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHTop100'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHTop100'
GO
