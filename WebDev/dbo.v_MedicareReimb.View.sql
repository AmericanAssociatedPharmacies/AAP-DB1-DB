USE [WebDev]
GO
/****** Object:  View [dbo].[v_MedicareReimb]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_MedicareReimb]
AS
SELECT        dbo.Rx30Latest.[Pharm ID], dbo.Rx30Latest.[BIN Nbr], dbo.Rx30Latest.[Group Nbr], dbo.Rx30Latest.Submitted, dbo.Rx30Latest.[Rx Date], 
                         dbo.Rx30Latest.[Qty Dispensed], dbo.Rx30Latest.[Day Supply], dbo.Rx30Latest.NDC, dbo.Rx30Latest.[Fee Submitted], dbo.Rx30Latest.[Fee Paid], 
                         dbo.Rx30Latest.[Cost Paid], dbo.Rx30Latest.[Total Price], dbo.Rx30Latest.[Tx Response], dbo.Rx30Latest.[Rx Nbr], dbo.Rx30Latest.RfNbr, dbo.Rx30Latest.desi2, 
                         dbo.Rx30Latest.[Cost Submitted], dbo.Rx30Latest.UpdatedOn, dbo.Rx30Latest.PatID, dbo.Rx30Latest.RA, dbo.Rx30Latest.PatName, dbo.Rx30Latest.Doctor, 
                         dbo.Rx30Latest.BirthDate, dbo.Rx30Latest.[U and C], dbo.Rx30Latest.RxID, dbo.Rx30Latest.BB, dbo.Rx30Latest.WHN, Medispan.dbo.v_NDC_GPI.GPI, 
                         claims.dbo.v_LowestAAPPriceGPIWeek.AAPPrice, 
                         dbo.Rx30Latest.[Total Price] - claims.dbo.v_LowestAAPPriceGPIWeek.AAPPrice * dbo.Rx30Latest.[Qty Dispensed] AS Profit, 
                         PharmacyMaster.dbo.PMStores.AccountName
FROM            dbo.Rx30Latest INNER JOIN
                         Medispan.dbo.v_NDC_GPI ON dbo.Rx30Latest.NDC = Medispan.dbo.v_NDC_GPI.NDC INNER JOIN
                         claims.dbo.PlanBINs ON dbo.Rx30Latest.[BIN Nbr] = claims.dbo.PlanBINs.BIN LEFT OUTER JOIN
                         PharmacyMaster.dbo.PMStores ON dbo.Rx30Latest.[Pharm ID] = PharmacyMaster.dbo.PMStores.NCPDP LEFT OUTER JOIN
                         claims.dbo.v_LowestAAPPriceGPIWeek ON Medispan.dbo.v_NDC_GPI.GPI = claims.dbo.v_LowestAAPPriceGPIWeek.GPI
WHERE        (claims.dbo.PlanBINs.Medicare_D = 'True')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[55] 4[26] 2[17] 3) )"
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
               Bottom = 441
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_NDC_GPI (Medispan.dbo)"
            Begin Extent = 
               Top = 198
               Left = 318
               Bottom = 331
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_LowestAAPPriceGPIWeek (claims.dbo)"
            Begin Extent = 
               Top = 299
               Left = 616
               Bottom = 417
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PlanBINs (claims.dbo)"
            Begin Extent = 
               Top = 18
               Left = 325
               Bottom = 155
               Right = 535
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "PMStores (PharmacyMaster.dbo)"
            Begin Extent = 
               Top = 27
               Left = 1070
               Bottom = 319
               Right = 1368
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
         Column = 11100
         Alias = 900
         Table = 3795
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_MedicareReimb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'= 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_MedicareReimb'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_MedicareReimb'
GO
