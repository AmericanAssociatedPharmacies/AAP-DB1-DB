USE [reporting]
GO
/****** Object:  View [dbo].[v_vendorvolume]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_vendorvolume]
AS
SELECT     dbo.vendormaster.vendorname, dbo.vendormaster.status, dbo.vendormaster.oldvendorid, dbo.v_nvolumepair.FY_END, dbo.v_nvolumepair.ACCT_NO, 
                      dbo.v_nvolumepair.REPORTS, dbo.v_nvolumepair.JANUARY, dbo.v_nvolumepair.FEBRUARY, dbo.v_nvolumepair.MARCH, dbo.v_nvolumepair.APRIL, 
                      dbo.v_nvolumepair.MAY, dbo.v_nvolumepair.JUNE, dbo.v_nvolumepair.JULY, dbo.v_nvolumepair.AUGUST, dbo.v_nvolumepair.SEPTEMBER, 
                      dbo.v_nvolumepair.OCTOBER, dbo.v_nvolumepair.NOVEMBER, dbo.v_nvolumepair.DECEMBER, dbo.v_nvolumepair.MONTOT, 
                      dbo.vendormaster.vendorpair, dbo.udVolume.FY_END AS fy_end1, dbo.udVolume.ACCT_NO AS acct_no1, dbo.udVolume.REPORTS AS reports1, 
                      dbo.udVolume.JANUARY AS JANUARY1, dbo.udVolume.FEBRUARY AS FEBRUARY1, dbo.udVolume.MARCH AS MARCH1, 
                      dbo.udVolume.APRIL AS APRIL1, dbo.udVolume.MAY AS MAY1, dbo.udVolume.JUNE AS JUNE1, dbo.udVolume.JULY AS JULY1, 
                      dbo.udVolume.AUGUST AS AUGUST1, dbo.udVolume.SEPTEMBER AS SEPTEMBER1, dbo.udVolume.OCTOBER AS OCTOBER1, 
                      dbo.udVolume.NOVEMBER AS NOVEMBER1, dbo.udVolume.DECEMBER AS DECEMBER1, dbo.udVolume.MONTOT AS MONTOT1, 
                      dbo.udVolume.Filled
FROM         dbo.vendormaster INNER JOIN
                      dbo.v_nvolumepair ON dbo.vendormaster.oldvendorid = dbo.v_nvolumepair.VENDOR_ID INNER JOIN
                      dbo.udVolume ON dbo.v_nvolumepair.VENDORPAIR = dbo.udVolume.VENDOR_ID AND dbo.v_nvolumepair.ACCT_NO = dbo.udVolume.ACCT_NO AND 
                      dbo.v_nvolumepair.FY_END = dbo.udVolume.FY_END AND dbo.v_nvolumepair.FY_END > 2006 AND dbo.vendormaster.status = 1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[10] 2[46] 3) )"
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
         Begin Table = "vendormaster"
            Begin Extent = 
               Top = 13
               Left = 103
               Bottom = 418
               Right = 304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_nvolumepair"
            Begin Extent = 
               Top = 13
               Left = 393
               Bottom = 381
               Right = 576
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udVolume"
            Begin Extent = 
               Top = 22
               Left = 668
               Bottom = 411
               Right = 865
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
      Begin ColumnWidths = 9
         Width = 284
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
         Alias = 1800
         Table = 3960
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_vendorvolume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_vendorvolume'
GO
