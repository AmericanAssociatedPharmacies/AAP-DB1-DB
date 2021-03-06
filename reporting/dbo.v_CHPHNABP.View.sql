USE [reporting]
GO
/****** Object:  View [dbo].[v_CHPHNABP]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_CHPHNABP]
AS
SELECT     Purchases.dbo.CHPH_AAP.EXT_COST, Purchases.dbo.CHPH_AAP.INVOICE_NO, Purchases.dbo.CHPH_AAP.INV_DATE, 
                      Purchases.dbo.CHPH_AAP.SHIP_QTY, Purchases.dbo.CHPH_AAP.ORDER_QTY, Purchases.dbo.CHPH_AAP.ITEM_DESCR, 
                      Purchases.dbo.CHPH_AAP.BRAND, Purchases.dbo.CHPH_AAP.NDC, Purchases.dbo.CHPH_AAP.UNIT_COST, Purchases.dbo.CHPH_AAP.STORE, 
                      PharmacyMaster.dbo.v_PM_AllWithAffiliates.NCPDP AS NABP, Medispan.dbo.v_DrugMaster.GPI AS GCN, Medispan.dbo.v_DrugMaster.PS, 
                      Medispan.dbo.v_DrugMaster.DrugType
FROM         Purchases.dbo.CHPH_AAP INNER JOIN
                      PharmacyMaster.dbo.v_PM_AllWithAffiliates ON 
                      Purchases.dbo.CHPH_AAP.PMID = PharmacyMaster.dbo.v_PM_AllWithAffiliates.PMID LEFT OUTER JOIN
                      Medispan.dbo.v_DrugMaster ON Purchases.dbo.CHPH_AAP.NDC = Medispan.dbo.v_DrugMaster.NDC
WHERE     (PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPQuitDate IS NULL) AND (PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPAccountNo IS NOT NULL)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[60] 4[5] 2[25] 3) )"
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
         Begin Table = "CHPH_AAP (Purchases.dbo)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 521
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_PM_AllWithAffiliates (PharmacyMaster.dbo)"
            Begin Extent = 
               Top = 13
               Left = 672
               Bottom = 467
               Right = 928
            End
            DisplayFlags = 280
            TopColumn = 33
         End
         Begin Table = "v_DrugMaster (Medispan.dbo)"
            Begin Extent = 
               Top = 163
               Left = 424
               Bottom = 363
               Right = 667
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
      Begin ColumnWidths = 17
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1770
         Table = 3750
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
   E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHNABP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHNABP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_CHPHNABP'
GO
