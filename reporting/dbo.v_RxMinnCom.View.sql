USE [reporting]
GO
/****** Object:  View [dbo].[v_RxMinnCom]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_RxMinnCom]
AS
SELECT     dbo.v_RxMinn.[Pharm ID], dbo.v_RxMinn.[BIN Nbr], dbo.v_RxMinn.PCN, dbo.v_RxMinn.[Group Nbr], dbo.v_RxMinn.Submitted, 
                      dbo.v_RxMinn.[Rx Date], dbo.v_RxMinn.[Qty Dispensed], dbo.v_RxMinn.[Day Supply], dbo.v_RxMinn.NDC, dbo.v_RxMinn.[Fee Submitted], 
                      dbo.v_RxMinn.[Cost Submitted], dbo.v_RxMinn.[Fee Paid], dbo.v_RxMinn.[Cost Paid], dbo.v_RxMinn.[Plan Amount], dbo.v_RxMinn.[Co Pay Amount], 
                      dbo.v_RxMinn.[Total Price], dbo.v_RxMinn.B, dbo.v_RxMinn.OI, dbo.v_RxMinn.[U and C], dbo.v_RxMinn.Discount, 
                      dbo.v_RxMinn2.[Pharm ID] AS [Pharm ID1], dbo.v_RxMinn2.[BIN Nbr] AS [BIN Nbr1], dbo.v_RxMinn2.PCN AS PCN1, 
                      dbo.v_RxMinn2.[Group Nbr] AS [Group Nbr1], dbo.v_RxMinn2.Submitted AS Submitted1, dbo.v_RxMinn2.[Rx Date] AS [Rx Date1], 
                      dbo.v_RxMinn2.[Qty Dispensed] AS [Qty Dispensed1], dbo.v_RxMinn2.[Day Supply] AS [Day Supply1], dbo.v_RxMinn2.NDC AS NDC1, 
                      dbo.v_RxMinn2.[Fee Submitted] AS [Fee Submitted1], dbo.v_RxMinn2.[Cost Submitted] AS [Cost Submitted1], dbo.v_RxMinn2.[Fee Paid] AS [Fee Paid1],
                       dbo.v_RxMinn2.[Cost Paid] AS [Cost Paid1], dbo.v_RxMinn2.[Plan Amount] AS [Plan Amount1], dbo.v_RxMinn2.[Co Pay Amount] AS [Co Pay Amount1], 
                      dbo.v_RxMinn2.[Total Price] AS [Total Price1], dbo.v_RxMinn2.B AS B1, dbo.v_RxMinn2.OI AS OI1, dbo.v_RxMinn2.[U and C] AS [U and C1], 
                      dbo.v_RxMinn2.Discount AS Discount2, dbo.v_RxMinn.type, dbo.v_RxMinn.name, dbo.v_RxMinn.BB
FROM         dbo.v_RxMinn INNER JOIN
                      dbo.v_RxMinn2 ON dbo.v_RxMinn.[BIN Nbr] = dbo.v_RxMinn2.[BIN Nbr] AND dbo.v_RxMinn.PCN = dbo.v_RxMinn2.PCN AND 
                      dbo.v_RxMinn.[Group Nbr] = dbo.v_RxMinn2.[Group Nbr] AND dbo.v_RxMinn.NDC = dbo.v_RxMinn2.NDC
WHERE     (dbo.v_RxMinn.PCN <> '') AND (dbo.v_RxMinn.[Group Nbr] <> '')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[8] 2[33] 3) )"
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
         Begin Table = "v_RxMinn"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 357
               Right = 207
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "v_RxMinn2"
            Begin Extent = 
               Top = 4
               Left = 325
               Bottom = 357
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 3
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
         Column = 1905
         Alias = 3210
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RxMinnCom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RxMinnCom'
GO
