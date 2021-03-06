USE [reporting]
GO
/****** Object:  View [dbo].[v_ClaimsSrc]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ClaimsSrc]
AS
SELECT     dbo.GMAnalysis.AnalysisID, dbo.GMAnalysis.FileName, dbo.GMAnalysis.PriceFileDate, dbo.GMAnalysis.FDBDate, dbo.GMDataSource.DataSource, 
                      dbo.PriceFile.WholeSaler AS WS, dbo.GMAnalysis.CreatedOn, dbo.GMAnalysis.WholeSaler, dbo.GMAnalysis.Discount, 
                      dbo.GMAnalysis.DispensingFee, dbo.GMAnalysis.Fromdt, dbo.GMAnalysis.Todt, dbo.GMAnalysis.daytype, dbo.GMAnalysis.days
FROM         dbo.GMAnalysis LEFT OUTER JOIN
                      dbo.PriceFile ON dbo.GMAnalysis.WholeSaler = dbo.PriceFile.id LEFT OUTER JOIN
                      dbo.GMDataSource ON dbo.GMAnalysis.DataID = dbo.GMDataSource.DataID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[6] 3) )"
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
         Begin Table = "PriceFile"
            Begin Extent = 
               Top = 187
               Left = 541
               Bottom = 300
               Right = 713
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GMDataSource"
            Begin Extent = 
               Top = 17
               Left = 542
               Bottom = 180
               Right = 702
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GMAnalysis"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 240
               Right = 198
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
         Width = 3960
         Width = 2355
         Width = 2175
         Width = 1140
         Width = 1260
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2475
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimsSrc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimsSrc'
GO
