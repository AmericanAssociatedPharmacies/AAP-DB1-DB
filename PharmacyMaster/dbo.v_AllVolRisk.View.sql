USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_AllVolRisk]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllVolRisk]
AS
SELECT     CASE WHEN dbo.RiskVolume.NCPDP IS NULL THEN RiskCP.NCPDP ELSE RiskVolume.NCPDP END AS NCPDP, CASE WHEN dbo.RiskVolume.Month IS NULL 
                      THEN RiskCP.MO ELSE RiskVolume.Month END AS Month, CASE WHEN dbo.RiskVolume.Year IS NULL THEN RiskCP.YR ELSE RiskVolume.Year END AS Year, 
                      dbo.RiskVolume.CHSVolume, dbo.RiskVolume.APIVolume, dbo.RiskVolume.MLVolume, dbo.RiskVolume.TotalVolume, dbo.RiskCP.CPAMOUNT, 
                      ISNULL(dbo.RiskVolume.TotalVolume, 0) - dbo.RiskCP.CPAMOUNT AS DiffCPToVolume
FROM         dbo.RiskVolume FULL OUTER JOIN
                      dbo.RiskCP ON dbo.RiskVolume.Month = dbo.RiskCP.MO AND dbo.RiskVolume.Year = dbo.RiskCP.YR AND dbo.RiskVolume.NCPDP = dbo.RiskCP.NCPDP
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[35] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Begin Table = "RiskVolume"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 242
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiskCP"
            Begin Extent = 
               Top = 11
               Left = 337
               Bottom = 184
               Right = 570
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1470
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2415
         Width = 1500
         Width = 1995
         Width = 1920
         Width = 2580
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 7335
         Alias = 5100
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllVolRisk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AllVolRisk'
GO
