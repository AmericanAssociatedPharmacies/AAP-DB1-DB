USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_CHALL_and_APIv1]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*all PMIDs + challpva joined to api*/
CREATE VIEW [dbo].[v_GlobalReport_CHALL_and_APIv1]
AS
SELECT     ch.p_pmid, ch.pmid, ch.date, ch.[Gen Src], ch.[Gen Exc], ch.[Gen Total], ch.[CH Brx], ch.[CH Oth], ch.[CH Total], a.pmid AS a_pmid, a.date AS a_date, 
                      a.API_BR, a.API_GEN, a.API_OTC, a.API_BR + a.API_GEN + a.API_OTC AS API_Total
FROM         dbo.v_GlobalReport_CHall AS ch LEFT OUTER JOIN
                      API.dbo.v_API_ByMonth_LineAmount2010 AS a ON ch.p_pmid = a.pmid AND ch.date = a.date
UNION
SELECT     - 1 AS p_pmid, - 1 AS pmid, a.date, ch.[Gen Src], ch.[Gen Exc], ch.[Gen Total], ch.[CH Brx], ch.[CH Oth], ch.[CH Total], a.pmid AS a_pmid, 
                      a.date AS a_date, a.API_BR, a.API_GEN, a.API_OTC, a.API_BR + a.API_GEN + a.API_OTC AS API_Total
FROM         API.dbo.v_API_ByMonth_LineAmount2010 AS a LEFT OUTER JOIN
                      dbo.v_GlobalReport_CHall AS ch ON a.pmid = ch.p_pmid AND a.date = ch.date
WHERE     (ch.p_pmid IS NULL)
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_GlobalReport_CHALL_and_APIv1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_GlobalReport_CHALL_and_APIv1'
GO
