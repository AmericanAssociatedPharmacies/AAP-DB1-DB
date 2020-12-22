USE [reporting]
GO
/****** Object:  View [dbo].[v_RxStoresDec08]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_RxStoresDec08]
AS
SELECT     TOP (100) PERCENT dbo.RxDec08.[Pharm ID], dbo.RxDec08.[BIN Nbr], dbo.RxDec08.PCN, dbo.RxDec08.[Group Nbr], dbo.v_Stores.STORE, 
                      dbo.v_Stores.ADDR1, dbo.v_Stores.ADDR2, dbo.v_Stores.CITY, dbo.v_Stores.STATE, dbo.v_Stores.ZIP, dbo.RxDec08.Submitted, 
                      dbo.RxDec08.[Rx Date], dbo.RxDec08.[Qty Dispensed], dbo.RxDec08.[Day Supply], dbo.RxDec08.NDC, dbo.RxDec08.[Fee Submitted], 
                      dbo.RxDec08.[Cost Submitted], dbo.RxDec08.[Fee Paid], dbo.RxDec08.[Cost Paid], dbo.RxDec08.[Plan Amount], dbo.RxDec08.[Co Pay Amount], 
                      dbo.RxDec08.[Total Price], dbo.RxDec08.[U and C]
FROM         dbo.RxDec08 LEFT OUTER JOIN
                      dbo.v_Stores ON dbo.RxDec08.[Pharm ID] = dbo.v_Stores.NABP
WHERE     (dbo.RxDec08.[Pharm ID] <> '0134192')
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
         Begin Table = "RxDec08"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 193
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_Stores"
            Begin Extent = 
               Top = 6
               Left = 231
               Bottom = 121
               Right = 383
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RxStoresDec08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RxStoresDec08'
GO
