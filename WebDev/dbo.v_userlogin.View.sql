USE [WebDev]
GO
/****** Object:  View [dbo].[v_userlogin]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_userlogin]
AS
SELECT     dbo.userlogin.loginid, dbo.userlogin.login, dbo.userlogin.password, dbo.userlogin.firstname, dbo.userlogin.lastname, dbo.userlogin.email, 
                      dbo.userlogin.roleid, dbo.userlogin.nslogin, dbo.userlogin.nspwd, dbo.userlogin.defaultpmid, 
--dbo.userlogin.createdon, dbo.userlogin.createdby, 
--dbo.userlogin.updatedon, dbo.userlogin.updatedby, 
						dbo.userlogin.active, dbo.userrole.rolename, 
						dbo.userlogin.perms,dbo.userlogin.source,
                      PharmacyMaster.dbo.v_PM_AllWithAffiliates.AccountName, PharmacyMaster.dbo.v_PM_AllWithAffiliates.City, 
                      PharmacyMaster.dbo.v_PM_AllWithAffiliates.State, PharmacyMaster.dbo.v_PM_AllWithAffiliates.NCPDP
FROM         dbo.userlogin LEFT OUTER JOIN
                      PharmacyMaster.dbo.v_PM_AllWithAffiliates ON dbo.userlogin.defaultpmid = PharmacyMaster.dbo.v_PM_AllWithAffiliates.PMID LEFT OUTER JOIN
                      dbo.userrole ON dbo.userlogin.roleid = dbo.userrole.roleid
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[15] 2[14] 3) )"
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
         Begin Table = "userlogin"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 271
               Right = 195
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "userrole"
            Begin Extent = 
               Top = 30
               Left = 352
               Bottom = 115
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v_PM_AllWithAffiliates (PharmacyMaster.dbo)"
            Begin Extent = 
               Top = 141
               Left = 348
               Bottom = 413
               Right = 551
            End
            DisplayFlags = 280
            TopColumn = 29
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
         Width = 3465
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
         Alias = 1410
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_userlogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_userlogin'
GO
