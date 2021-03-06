USE [reporting]
GO
/****** Object:  View [dbo].[v_ClaimsGCNGEN]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ClaimsGCNGEN]
AS
SELECT     MIN(dbo.v_ClaimsGEN.[Brand Type]) AS BrandType, FDB.dbo.v_GPIMediDesc.gcn, SUM(dbo.v_ClaimsGEN.[TRx Count]) AS RxCount, 
                      SUM(dbo.v_ClaimsGEN.[TRx Quantity Dispensed]) AS QtyDisp, SUM(dbo.v_ClaimsGEN.[Total  AWP]) AS TotalAWP, 
                      SUM(dbo.v_ClaimsGEN.[Patient Paid Amount]) AS PatientPaid, SUM(dbo.v_ClaimsGEN.[Total Paid Amount]) AS TotalPaid, 
                      MIN(dbo.v_ClaimsGEN.[Price Per Unit]) AS Cardprice, FDB.dbo.v_GPIMediDesc.MEDDesc, FDB.dbo.v_GPIMediDesc.GPIDesc, 
                      MIN(dbo.v_ClaimsGEN.[Dot Nbr]) AS [Dot Nbr], SUM(dbo.v_ClaimsGEN.TotalWAC) AS TotalWAC
FROM         dbo.v_ClaimsGEN INNER JOIN
                      FDB.dbo.v_GPIMediDesc ON dbo.v_ClaimsGEN.NDC11 = FDB.dbo.v_GPIMediDesc.NDC
WHERE     (dbo.v_ClaimsGEN.[TRx Quantity Dispensed] IS NOT NULL)
GROUP BY FDB.dbo.v_GPIMediDesc.gcn, FDB.dbo.v_GPIMediDesc.MEDDesc, FDB.dbo.v_GPIMediDesc.GPIDesc, dbo.v_ClaimsGEN.[Dot Nbr], 
                      dbo.v_ClaimsGEN.TotalWAC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[21] 2[17] 3) )"
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
         Begin Table = "v_ClaimsGEN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 270
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "v_GPIMediDesc (FDB.dbo)"
            Begin Extent = 
               Top = 0
               Left = 361
               Bottom = 222
               Right = 624
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
      Begin ColumnWidths = 13
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 2325
         Alias = 1980
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimsGCNGEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimsGCNGEN'
GO
