USE [reporting]
GO
/****** Object:  View [dbo].[v_ClaimCAH]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ClaimCAH]
AS
SELECT     dbo.tmp_MagmaClaims.NDC11, dbo.tmp_MagmaClaims.[Drug Name], dbo.tmp_MagmaClaims.Strength, dbo.tmp_MagmaClaims.[Brand Type], 
                      dbo.tmp_MagmaClaims.DAW, dbo.tmp_MagmaClaims.[Column 5], dbo.tmp_MagmaClaims.[Dot Nbr], dbo.tmp_MagmaClaims.Metrics, 
                      dbo.tmp_MagmaClaims.[TRx Count], dbo.tmp_MagmaClaims.[TRx Quantity Dispensed], dbo.tmp_MagmaClaims.[Total  AWP], 
                      dbo.tmp_MagmaClaims.[Patient Paid Amount], dbo.tmp_MagmaClaims.[Total Paid Amount], dbo.tmp_MagmaClaims.[Dispensing Fee Amount], 
                      dbo.tmp_MagmaClaims.[Total Ingredient Cost], dbo.tmp_MagmaClaims.[Usual Customary Amount], dbo.tmp_MagmaClaims.TotalWAC, 
                      dbo.tmp_MagmaClaims.UDS, dbo.tmp_MagmaClaims.GCN, dbo.v_CAHFDB.[Price Per Unit]
FROM         dbo.tmp_MagmaClaims INNER JOIN
                      dbo.v_CAHFDB ON dbo.tmp_MagmaClaims.NDC11 = dbo.v_CAHFDB.[NDC UPC]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[29] 2[23] 3) )"
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
         Begin Table = "tmp_MagmaClaims"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 284
               Right = 245
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "v_CAHFDB"
            Begin Extent = 
               Top = 6
               Left = 294
               Bottom = 254
               Right = 520
            End
            DisplayFlags = 280
            TopColumn = 7
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
         Alias = 1485
         Table = 2145
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimCAH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimCAH'
GO
