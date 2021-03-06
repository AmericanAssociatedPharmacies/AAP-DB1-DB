USE [reporting]
GO
/****** Object:  View [dbo].[v_united]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_united]
AS
SELECT     dbo.united.[Pharm ID], dbo.united.[BIN Nbr], dbo.united.PCN, dbo.united.[Group Nbr], dbo.united.Submitted, dbo.united.[Rx Date], 
                      dbo.united.[Qty Dispensed], dbo.united.[Day Supply], dbo.united.NDC, dbo.united.[Fee Submitted], dbo.united.[Cost Submitted], dbo.united.[Fee Paid], 
                      dbo.united.[Cost Paid], dbo.united.[Plan Amount], dbo.united.[Co Pay Amount], dbo.united.[U and C], dbo.united.[Total Price], dbo.united.B, dbo.united.OI,
                       FDB.dbo.v1.type, FDB.dbo.v1.name, FDB.dbo.RNP2_PIVOT.BB, dbo.united.Discount
FROM         dbo.united LEFT OUTER JOIN
                      FDB.dbo.v1 ON dbo.united.NDC = FDB.dbo.v1.ndc LEFT OUTER JOIN
                      FDB.dbo.RNP2_PIVOT ON dbo.united.NDC = FDB.dbo.RNP2_PIVOT.ndc
WHERE     (FDB.dbo.v1.type = 'SSB')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[17] 2[20] 3) )"
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
         Begin Table = "united"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 331
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "v1 (FDB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 148
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RNP2_PIVOT (FDB.dbo)"
            Begin Extent = 
               Top = 169
               Left = 270
               Bottom = 359
               Right = 430
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_united'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_united'
GO
