USE [reporting]
GO
/****** Object:  View [dbo].[v_ws_membervolume]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_ws_membervolume]
AS
SELECT     dbo.udVolume.FY_END, dbo.udVolume.ACCT_NO, dbo.udVolume.VENDOR_ID, dbo.udVolume.VENDOR, dbo.udVolume.FACTOR, 
                      dbo.udVolume.REPORTS, dbo.udVolume.JANUARY, dbo.udVolume.FEBRUARY, dbo.udVolume.MARCH, dbo.udVolume.APRIL, dbo.udVolume.MAY, 
                      dbo.udVolume.JUNE, dbo.udVolume.JULY, dbo.udVolume.AUGUST, dbo.udVolume.SEPTEMBER, dbo.udVolume.OCTOBER, dbo.udVolume.NOVEMBER, 
                      dbo.udVolume.DECEMBER, dbo.udVolume.V_PER, dbo.udVolume.MONTOT, dbo.udb_active_members.STORE, dbo.udb_active_members.CITY, 
                      dbo.udb_active_members.STATE, dbo.udb_active_members.NSTERRITORY, dbo.udb_active_members.EFFECTIVE, dbo.membertype.type
FROM         dbo.membertype RIGHT OUTER JOIN
                      dbo.udb_active_members ON dbo.membertype.acct_no = dbo.udb_active_members.ACCT_NO LEFT OUTER JOIN
                      dbo.udVolume ON dbo.udb_active_members.ACCT_NO = dbo.udVolume.ACCT_NO
WHERE     (dbo.udVolume.REPORTS = 'V') AND (dbo.udVolume.FY_END = 2007) OR
                      (dbo.udVolume.REPORTS = 'V') AND (dbo.udVolume.FY_END = 2008) OR
                      (dbo.udVolume.REPORTS = 'V') AND (dbo.udVolume.FY_END = 2009)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[16] 2[24] 3) )"
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
         Begin Table = "membertype"
            Begin Extent = 
               Top = 13
               Left = 544
               Bottom = 184
               Right = 738
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udb_active_members"
            Begin Extent = 
               Top = 8
               Left = 267
               Bottom = 275
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udVolume"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ws_membervolume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_ws_membervolume'
GO
