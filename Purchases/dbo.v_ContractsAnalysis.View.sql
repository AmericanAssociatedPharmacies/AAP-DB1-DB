USE [Purchases]
GO
/****** Object:  View [dbo].[v_ContractsAnalysis]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ContractsAnalysis]
AS
SELECT     dbo.CHPH_AAP.NDC, dbo.CHPH_AAP.INV_DATE, dbo.CHPH_AAP.INVOICE_NO, dbo.CHPH_AAP.UNIT_COST, dbo.CHPH_AAP.BRAND, 
                      dbo.CHPH_AAP.ITEM_TYPE, Medispan.dbo.v_DrugMaster.DrugType, Medispan.dbo.v_DrugMaster.AWP, 
                      reporting.dbo.test_NADAC.[NADAC_Per Unit]
FROM         dbo.CHPH_AAP LEFT OUTER JOIN
                      reporting.dbo.test_NADAC ON dbo.CHPH_AAP.NDC = reporting.dbo.test_NADAC.NDC LEFT OUTER JOIN
                      Medispan.dbo.v_DrugMaster ON dbo.CHPH_AAP.NDC = Medispan.dbo.v_DrugMaster.NDC
WHERE     (Medispan.dbo.v_DrugMaster.DrugTypeShort = 'GEN') AND (dbo.CHPH_AAP.INV_DATE > '10/31/2013') AND (dbo.CHPH_AAP.INV_DATE < '12/01/2013') 
                      AND (dbo.CHPH_AAP.ITEM_TYPE <> 'OTC')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[13] 2[24] 3) )"
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
         Begin Table = "v_DrugMaster (Medispan.dbo)"
            Begin Extent = 
               Top = 0
               Left = 407
               Bottom = 272
               Right = 688
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "test_NADAC (reporting.dbo)"
            Begin Extent = 
               Top = 281
               Left = 406
               Bottom = 455
               Right = 732
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CHPH_AAP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 458
               Right = 314
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
         Table = 2865
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ContractsAnalysis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ContractsAnalysis'
GO
