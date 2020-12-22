USE [reporting]
GO
/****** Object:  View [dbo].[PDOD_vw_extendedDetail]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PDOD_vw_extendedDetail]
AS
SELECT     d.acct_no, t.store, t.city, t.state, t.nsterritory AS terr, t.effective, t.quitdate, t.eligible, d.vendor_id, d.vendor, d.volume AS nwvolume, 
                      d.rebate AS nwrebate, d.WSVolume, d.WSAdminFees, d.GenRebate, d.CRFactor, d.CR90, CAST(0.0 AS numeric(38, 2)) AS contributionpercentage, 
                      CAST(0.0 AS numeric(38, 2)) AS PDFactor, CAST(0.0 AS numeric(38, 2)) AS PD90
FROM         dbo.PDOD_Detail AS d INNER JOIN
                      dbo.PDOD_Totals AS t ON d.acct_no = t.acct_no
UNION
SELECT     acct_no, store, city, state, nsterritory AS terr, effective, quitdate, eligible, CAST(900 AS integer) AS vendor_id, 'UD Profit Distribution' AS vendor, 
                      CAST(0.0 AS numeric(38, 2)) AS nwvolume, CAST(0.0 AS numeric(38, 2)) AS nwrebate, CAST(0.0 AS numeric(38, 2)) AS wsvolume, 
                      CAST(0.0 AS numeric(38, 2)) AS wsadminfees, CAST(0.0 AS numeric(38, 2)) AS genrebate, CAST(0.0 AS numeric(38, 2)) AS crfactor, 
                      CAST(0.0 AS numeric(38, 2)) AS cr90, ContributionPercentage, ProfitDistributionFactor AS PDFactor, ProfitDistribution90 AS PD90
FROM         dbo.PDOD_Totals AS t

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
         Configuration = "(H (4[30] 2[40] 3) )"
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
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 5
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PDOD_vw_extendedDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PDOD_vw_extendedDetail'
GO
