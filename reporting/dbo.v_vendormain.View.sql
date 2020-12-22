USE [reporting]
GO
/****** Object:  View [dbo].[v_vendormain]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_vendormain]
AS
SELECT     dbo.udVolume.FY_END, dbo.v_vendorrebate.vendorname, dbo.udVolume.ACCT_NO, dbo.udVolume.VENDOR_ID, dbo.udVolume.FACTOR, 
                      dbo.udVolume.REPORTS, dbo.udVolume.JANUARY, dbo.udVolume.FEBRUARY, dbo.udVolume.MARCH, dbo.udVolume.APRIL, dbo.udVolume.MAY, 
                      dbo.udVolume.JUNE, dbo.udVolume.JULY, dbo.udVolume.AUGUST, dbo.udVolume.SEPTEMBER, dbo.udVolume.OCTOBER, dbo.udVolume.NOVEMBER, 
                      dbo.udVolume.DECEMBER, dbo.udVolume.MONTOT, dbo.v_vendorrebate.status, dbo.v_vendorrebate.vendorpair, dbo.v_vendorrebate.diffname, 
                      dbo.v_vendorrebate.year, dbo.v_vendorrebate.totalpercentrebate
FROM         dbo.v_vendorrebate LEFT OUTER JOIN
                      dbo.udVolume ON dbo.v_vendorrebate.oldvendorid = dbo.udVolume.VENDOR_ID
WHERE     (dbo.v_vendorrebate.status = 1) AND (dbo.udVolume.FY_END > 2005)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[10] 2[20] 3) )"
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
         Begin Table = "v_vendorrebate"
            Begin Extent = 
               Top = 21
               Left = 330
               Bottom = 187
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udVolume"
            Begin Extent = 
               Top = 21
               Left = 56
               Bottom = 403
               Right = 254
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_vendormain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_vendormain'
GO
