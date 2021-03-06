USE [reporting]
GO
/****** Object:  View [dbo].[v_ClaimsFDBMSB]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ClaimsFDBMSB]
AS
SELECT     dbo.v_ClaimsMSB.NDC11, dbo.v_ClaimsMSB.[Drug Name], dbo.v_ClaimsMSB.Strength, dbo.v_ClaimsMSB.[Brand Type], dbo.v_ClaimsMSB.DAW, 
                      dbo.v_ClaimsMSB.[Column 5], dbo.v_ClaimsMSB.[Dot Nbr], dbo.v_ClaimsMSB.Metrics, dbo.v_ClaimsMSB.[TRx Count], 
                      dbo.v_ClaimsMSB.[TRx Quantity Dispensed], dbo.v_ClaimsMSB.[Total  AWP], dbo.v_ClaimsMSB.[Patient Paid Amount], 
                      dbo.v_ClaimsMSB.[Total Paid Amount], dbo.v_ClaimsMSB.[Dispensing Fee Amount], dbo.v_ClaimsMSB.[Total Ingredient Cost], 
                      dbo.v_ClaimsMSB.[Usual Customary Amount], dbo.v_ClaimsMSB.UDS, dbo.v_ClaimsMSB.GCN, FDB.dbo.RNP2.NPT_PRICEX, 
                      dbo.v_ClaimsMSB.[Price Per Unit], dbo.v_ClaimsMSB.TotalWAC
FROM         dbo.v_ClaimsMSB INNER JOIN
                      FDB.dbo.RNP2 ON dbo.v_ClaimsMSB.NDC11 = FDB.dbo.RNP2.NDC
WHERE     (FDB.dbo.RNP2.NPT_DATEC IN
                          (SELECT     MAX(NPT_DATEC) AS NPT_DATEC
                            FROM          FDB.dbo.RNP2 AS RNP2_1
                            WHERE      (NPT_TYPE = 09) AND (NDC = FDB.dbo.RNP2.NDC) AND (NPT_TYPE = FDB.dbo.RNP2.NPT_TYPE)))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[19] 2[22] 3) )"
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
         Begin Table = "v_ClaimsMSB"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 365
               Right = 257
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RNP2 (FDB.dbo)"
            Begin Extent = 
               Top = 6
               Left = 317
               Bottom = 141
               Right = 498
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
      Begin ColumnWidths = 21
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimsFDBMSB'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ClaimsFDBMSB'
GO
