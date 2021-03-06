USE [Medispan]
GO
/****** Object:  View [dbo].[v_DrugMaster]    Script Date: 12/22/2020 9:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_DrugMaster]
AS
SELECT     dbo.M25_A.NDC_UPC_HRI AS NDC, dbo.M25_G.Generic_Product_Identifier AS GPI, dbo.M25_J.Product_Description_Abbreviat AS DrugName, 
                      dbo.M25_J.Manufacturers_Labeler_Name AS MFG, dbo.f_MediDrugtypefull(dbo.M25_A.Multi_Source_Code, dbo.M25_A.Brand_Name_Code) AS DrugType, 
                      dbo.f_MediDrugtype(dbo.M25_A.Multi_Source_Code, dbo.M25_A.Brand_Name_Code) AS DrugTypeShort, dbo.M25_L.Package_Size_Unit_of_Measure AS Unit, 
                      dbo.M25_L.Dosage_Form AS Form, dbo.M25_L.Package_Size AS PS, dbo.M25_L.Package_Description AS PD, 
                      CASE RX_OTC_Indicator_Code WHEN 'R' THEN 'Rx' WHEN 'S' THEN 'Rx' WHEN 'O' THEN 'OTC' WHEN 'P' THEN 'OTC' END AS RxOTC, 
                      dbo.M25_L.Repackage_Code AS Repack, dbo.M25_G.GPI_Generic_Name AS GPIDesc, dbo.M25_M.Strength, dbo.M25_M.Strength_Unit_Measure, 
                      dbo.M25_M.Inactive_Date AS OBSDTEC, 
                      CASE DEA_Class_Code WHEN 'C-I' THEN 1 WHEN 'C-II' THEN 2 WHEN 'C-III' THEN 3 WHEN 'C-IV' THEN 4 WHEN 'C-V' THEN 5 ELSE 0 END AS DEA, 
                      dbo.v_LastWAC.WACPkg, dbo.v_LastWAC.WAC, dbo.v_LastWAC.WACEffDate, dbo.v_LastAWP.AWPPkg, dbo.v_LastAWP.AWP, dbo.v_LastAWP.AWPEffDate AS BBDC, 
                      dbo.M25_A.Multi_Source_Code AS MSC, dbo.M25_A.Brand_Name_Code AS BNC, dbo.M25_L.Package_Quantity AS CSP, dbo.M25_L.DESI_Code AS DESI, 
                      dbo.M25_A.DEA_Class_Code, dbo.M25_A.Route_of_Administration AS RouteAdmin, dbo.M25_A.RX_OTC_Indicator_Code, 
                      dbo.M25_A.Unit_Dose_Unit_of_Use_Package, dbo.M25_A.AHFSCC_Therapeutic_Class_Code
FROM         dbo.M25_A LEFT OUTER JOIN
                      dbo.M25_J ON dbo.M25_A.NDC_UPC_HRI = dbo.M25_J.NDC_UPC_HRI LEFT OUTER JOIN
                      dbo.v_LastAWP ON dbo.M25_A.NDC_UPC_HRI = dbo.v_LastAWP.NDC LEFT OUTER JOIN
                      dbo.v_LastWAC ON dbo.M25_A.NDC_UPC_HRI = dbo.v_LastWAC.NDC LEFT OUTER JOIN
                      dbo.M25_M ON dbo.M25_A.NDC_UPC_HRI = dbo.M25_M.NDC_UPC_HRI LEFT OUTER JOIN
                      dbo.M25_L ON dbo.M25_A.NDC_UPC_HRI = dbo.M25_L.NDC_UPC_HRI LEFT OUTER JOIN
                      dbo.M25_G ON dbo.M25_A.NDC_UPC_HRI = dbo.M25_G.NDC_UPC_HRI

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[72] 4[17] 2[11] 3) )"
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
         Begin Table = "M25_A"
            Begin Extent = 
               Top = 6
               Left = 26
               Bottom = 612
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M25_J"
            Begin Extent = 
               Top = 258
               Left = 434
               Bottom = 492
               Right = 673
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_LastAWP"
            Begin Extent = 
               Top = 417
               Left = 693
               Bottom = 571
               Right = 914
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_LastWAC"
            Begin Extent = 
               Top = 26
               Left = 850
               Bottom = 168
               Right = 1034
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M25_M"
            Begin Extent = 
               Top = 173
               Left = 906
               Bottom = 418
               Right = 1149
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M25_L"
            Begin Extent = 
               Top = 19
               Left = 1168
               Bottom = 487
               Right = 1456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M25_G"
            Begin Extent = 
               Top = 21
               Left = 438
               Bottom = 220
               Right = 683
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_DrugMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 21
         Width = 284
         Width = 1500
         Width = 2895
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4425
         Width = 1500
         Width = 1500
         Width = 2475
         Width = 3510
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 945
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 11715
         Alias = 1695
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_DrugMaster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_DrugMaster'
GO
