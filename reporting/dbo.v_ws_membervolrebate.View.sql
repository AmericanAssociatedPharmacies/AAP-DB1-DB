USE [reporting]
GO
/****** Object:  View [dbo].[v_ws_membervolrebate]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ws_membervolrebate]
AS
SELECT     dbo.udVolume.FY_END, dbo.udVolume.ACCT_NO, dbo.udVolume.VENDOR_ID, dbo.udVolume.VENDOR, dbo.udVolume.FACTOR, 
                      dbo.udVolume.REPORTS, dbo.udVolume.JANUARY, dbo.udVolume.FEBRUARY, dbo.udVolume.MARCH, dbo.udVolume.APRIL, dbo.udVolume.MAY, 
                      dbo.udVolume.JUNE, dbo.udVolume.JULY, dbo.udVolume.AUGUST, dbo.udVolume.SEPTEMBER, dbo.udVolume.OCTOBER, dbo.udVolume.NOVEMBER, 
                      dbo.udVolume.DECEMBER, dbo.udVolume.V_PER, dbo.udVolume.MONTOT, dbo.udb_active_members.STORE, dbo.udb_active_members.CITY, 
                      dbo.udb_active_members.STATE, dbo.udb_active_members.NSTERRITORY, dbo.udb_active_members.EFFECTIVE, dbo.vvcopy.VENDORPAIR
FROM         dbo.vvcopy INNER JOIN
                      dbo.udVolume ON dbo.vvcopy.VENDOR_ID = dbo.udVolume.VENDOR_ID LEFT OUTER JOIN
                      dbo.udb_active_members ON dbo.udVolume.ACCT_NO = dbo.udb_active_members.ACCT_NO
WHERE     (dbo.udVolume.FY_END > 2006)
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
         Begin Table = "udb_active_members"
            Begin Extent = 
               Top = 11
               Left = 125
               Bottom = 126
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udVolume"
            Begin Extent = 
               Top = 6
               Left = 418
               Bottom = 207
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vvcopy"
            Begin Extent = 
               Top = 6
               Left = 638
               Bottom = 243
               Right = 842
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ws_membervolrebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ws_membervolrebate'
GO
