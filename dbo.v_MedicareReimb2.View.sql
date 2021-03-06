USE [WebTest]
GO
/****** Object:  View [dbo].[v_MedicareReimb2]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_MedicareReimb2]
AS
SELECT        dbo.Rx30Latest.[Pharm ID], dbo.Rx30Latest.[BIN Nbr], dbo.Rx30Latest.[Rx Date], dbo.Rx30Latest.[Qty Dispensed], dbo.Rx30Latest.NDC, dbo.Rx30Latest.[Fee Paid], 
                         dbo.Rx30Latest.[Total Price], dbo.Rx30Latest.RxID, PharmacyMaster.dbo.PMStores.AccountName, claims.dbo.GetAPINetPrice(dbo.Rx30Latest.NDC, 
                         dbo.Rx30Latest.[Rx Date]) AS APINetPrice, claims.dbo.GetCAHRebatePercent(dbo.Rx30Latest.[Rx Date], dbo.Rx30Latest.[Pharm ID]) AS CAHRebatePercent, 
                         claims.dbo.GetCAHUnitPrice(dbo.Rx30Latest.NDC, dbo.Rx30Latest.[Rx Date]) AS CAHUnitPrice
FROM            dbo.Rx30Latest INNER JOIN
                         claims.dbo.PlanBINs ON dbo.Rx30Latest.[BIN Nbr] = claims.dbo.PlanBINs.BIN LEFT OUTER JOIN
                         PharmacyMaster.dbo.PMStores ON dbo.Rx30Latest.[Pharm ID] = PharmacyMaster.dbo.PMStores.NCPDP
WHERE        (claims.dbo.PlanBINs.Medicare_D = 'True')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[28] 2[15] 3) )"
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
         Begin Table = "Rx30Latest"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 335
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PlanBINs (claims.dbo)"
            Begin Extent = 
               Top = 137
               Left = 339
               Bottom = 266
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PMStores (PharmacyMaster.dbo)"
            Begin Extent = 
               Top = 0
               Left = 328
               Bottom = 129
               Right = 560
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
         Column = 7650
         Alias = 2670
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_MedicareReimb2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_MedicareReimb2'
GO
