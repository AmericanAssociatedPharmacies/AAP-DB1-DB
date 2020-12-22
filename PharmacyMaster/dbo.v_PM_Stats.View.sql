USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_Stats]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_PM_Stats]

as
--v_stats selected Pharmacy Master statistics BG 6/9/10
--begin
select
convert(varchar, GETDATE(), 101)
as date,

count(distinct pm.pmid) 
as PM_Count_All,

(select count(distinct v1.pmid) from v_PM_AllWithAffiliates_Filtered v1) 
as PM_Count_Filtered,

(select count(pmid) from v_PM_Active)
as PM_Count_Active_v,

(select count(pmid) from pm_pharmacy where aapaccountno is not null and aapquitdate is null) 
as AAP,

(select count(p.pmid) from pm_pharmacy p
	left outer join pm_managedcare pm
	on p.pmid = pm.pmid where pm.pmid is not null and pm.chaincode is not null) 
as MCare,
--note: relies on chain code being removed when quitdate entered. todo: check quit date

(select count(distinct v1.pmid) from v_PM_AllWithAffiliates_Filtered v1
	where apiaccountno is not null) 
as API_not_closed,

(select count(distinct v1.pmid) from v_PM_AllWithAffiliates_Filtered v1
	where aapaccountno is null and udaccountno is not null 
		and udquitdate is null and dea is not null) 
as UD_not_AAP,
--note NULL DEAs for corporate offices. todo: better way to segregate

(select count(pmid) from v_PM_AllWithAffiliates_Filtered where aapaccountno is not null and aapquitdate is null and apiaccountno is not null) 
as AAP_and_API,

(select count(pmid) from v_PM_AllWithAffiliates_Filtered where aapaccountno is not null and aapquitdate is null and apiaccountno is null) 
as AAP_not_API

from 
pm_pharmacy pm
--/end v_stats


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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "pm"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 239
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
      Begin ColumnWidths = 12
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_Stats'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_Stats'
GO
