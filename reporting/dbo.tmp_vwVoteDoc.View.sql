USE [reporting]
GO
/****** Object:  View [dbo].[tmp_vwVoteDoc]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tmp_vwVoteDoc]
AS
SELECT     dbo.tmp_MagmaClaimsold.NDC11, dbo.tmp_MagmaClaimsold.[Drug Name], dbo.tmp_MagmaClaimsold.Strength, 
                      dbo.tmp_MagmaClaimsold.[Brand Type], dbo.tmp_MagmaClaimsold.DAW, dbo.tmp_MagmaClaimsold.[Column 5], dbo.tmp_MagmaClaimsold.[Dot Nbr], 
                      dbo.tmp_MagmaClaimsold.Metrics, dbo.tmp_MagmaClaimsold.[TRx Count], dbo.tmp_MagmaClaimsold.[TRx Quantity Dispensed], 
                      dbo.tmp_MagmaClaimsold.[Total  AWP], dbo.tmp_MagmaClaimsold.[Patient Paid Amount], dbo.tmp_MagmaClaimsold.[Total Paid Amount], 
                      dbo.tmp_MagmaClaimsold.[Dispensing Fee Amount], dbo.tmp_MagmaClaimsold.[Total Ingredient Cost], 
                      dbo.tmp_MagmaClaimsold.[Usual Customary Amount], dbo.tmp_MagmaClaimsold.TotalWAC, dbo.tmp_MagmaClaimsold.UDS, 
                      dbo.tmp_MagmaClaimsold.Top100 / dbo.top100size.Size AS Top100, dbo.tmp_MagmaClaimsold.GCN, dbo.chph_sum_ext_cost_ndc_Quarterly.Q4, 
                      dbo.chph_sum_ext_cost_ndc_Quarterly.Q4_st_cnt, CASE WHEN top100 IS NOT NULL THEN 'Y' ELSE 'N' END AS T100, 
                      FDB.dbo.RNP2_PIVOT.WHN * dbo.tmp_MagmaClaimsold.[TRx Quantity Dispensed] AS FDBWAC, 
                      FDB.dbo.RNP2_PIVOT.BB * dbo.tmp_MagmaClaimsold.[TRx Quantity Dispensed] AS FDBAWP, dbo.tmp_MagmaClaimsold.ProjPaid, 
                      CASE WHEN Top100 IS NOT NULL AND 
                      Top100 < UDS THEN Top100 * dbo.tmp_MagmaClaimsold.[TRx Quantity Dispensed] ELSE UDS * dbo.tmp_MagmaClaimsold.[TRx Quantity Dispensed] END
                       AS CardPrice, dbo.udsource.AWP AS cardawp, 
                      CASE WHEN ProjPaid < [Usual Customary Amount] THEN ProjPaid ELSE [Usual Customary Amount] END AS MINProjUC, dbo.udsource.[Price Per Unit], 
                      dbo.top100size.Size
FROM         dbo.tmp_MagmaClaimsold LEFT OUTER JOIN
                      dbo.top100size ON dbo.tmp_MagmaClaimsold.NDC11 = dbo.top100size.NDC LEFT OUTER JOIN
                      dbo.udsource ON dbo.tmp_MagmaClaimsold.NDC11 = dbo.udsource.[NDC UPC] LEFT OUTER JOIN
                      dbo.chph_sum_ext_cost_ndc_Quarterly ON dbo.tmp_MagmaClaimsold.NDC11 = dbo.chph_sum_ext_cost_ndc_Quarterly.NDC LEFT OUTER JOIN
                      FDB.dbo.RNP2_PIVOT ON dbo.tmp_MagmaClaimsold.NDC11 = FDB.dbo.RNP2_PIVOT.ndc
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[10] 4[48] 2[42] 3) )"
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
         Begin Table = "tmp_MagmaClaimsold"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 371
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "top100size"
            Begin Extent = 
               Top = 8
               Left = 534
               Bottom = 93
               Right = 686
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udsource"
            Begin Extent = 
               Top = 21
               Left = 824
               Bottom = 275
               Right = 1005
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "chph_sum_ext_cost_ndc_Quarterly"
            Begin Extent = 
               Top = 293
               Left = 860
               Bottom = 527
               Right = 1144
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RNP2_PIVOT (FDB.dbo)"
            Begin Extent = 
               Top = 308
               Left = 416
               Bottom = 492
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Column = 16035
         Alias = 1110
         Table = 3015
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tmp_vwVoteDoc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tmp_vwVoteDoc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'tmp_vwVoteDoc'
GO
