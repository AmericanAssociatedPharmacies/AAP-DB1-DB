USE [reporting]
GO
/****** Object:  View [dbo].[v_RxMasterCHPHOld]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_RxMasterCHPHOld]
AS
SELECT     dbo.Rx30Master.[Pharm ID], dbo.Rx30Master.[BIN Nbr], dbo.Rx30Master.PCN, dbo.Rx30Master.[Group Nbr], dbo.v_Stores.STORE, 
                      dbo.v_Stores.ADDR1, dbo.v_Stores.ADDR2, dbo.v_Stores.CITY, dbo.v_Stores.STATE, dbo.v_Stores.ZIP, dbo.Rx30Master.Submitted, 
                      dbo.Rx30Master.[Rx Date], dbo.Rx30Master.[Qty Dispensed], dbo.Rx30Master.[Day Supply], dbo.Rx30Master.NDC, dbo.Rx30Master.[Fee Submitted], 
                      dbo.Rx30Master.[Cost Submitted], dbo.Rx30Master.[Fee Paid], dbo.Rx30Master.[Cost Paid], dbo.Rx30Master.[Plan Amount], 
                      dbo.Rx30Master.[Co Pay Amount], dbo.Rx30Master.[U and C], dbo.Rx30Master.[Total Price], dbo.Rx30Master.B, dbo.Rx30Master.OI, 
                      dbo.chph_sum_ext_cost_ndc_Quarterly.Q4, dbo.chph_sum_ext_cost_ndc_Quarterly.Q4_st_cnt
FROM         dbo.Rx30Master LEFT OUTER JOIN
                      dbo.v_Stores ON dbo.Rx30Master.[Pharm ID] = dbo.v_Stores.NABP LEFT OUTER JOIN
                      dbo.chph_sum_ext_cost_ndc_Quarterly ON dbo.Rx30Master.NDC = dbo.chph_sum_ext_cost_ndc_Quarterly.NDC
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "Rx30Master"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 331
               Right = 192
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_Stores"
            Begin Extent = 
               Top = 6
               Left = 505
               Bottom = 198
               Right = 669
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "chph_sum_ext_cost_ndc_Quarterly"
            Begin Extent = 
               Top = 111
               Left = 238
               Bottom = 373
               Right = 474
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RxMasterCHPHOld'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RxMasterCHPHOld'
GO
