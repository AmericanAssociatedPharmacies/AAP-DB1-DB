USE [reporting]
GO
/****** Object:  View [dbo].[udb_membercontact]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[udb_membercontact]
AS
SELECT     dbo.udb_store_member.STORE, dbo.udb_store_member.DEA, dbo.udb_store_member.EFFECTIVE, dbo.udb_contact.STATE, 
                      dbo.udb_contact.VOICE_AREA, dbo.udb_contact.VOICE_LOCAL, dbo.udb_store_member.EMAILADDRESS, dbo.udb_store_member.NABP, 
                      dbo.udb_authuser.USER_ID, dbo.udb_authuser.PERMS, dbo.udb_authuser.PASSWORD
FROM         dbo.udb_store_member LEFT OUTER JOIN
                      dbo.udb_authuser ON dbo.udb_store_member.NABP = dbo.udb_authuser.USER_ID LEFT OUTER JOIN
                      dbo.udb_contact ON dbo.udb_store_member.STORE_ID = dbo.udb_contact.XREF_ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[16] 2[25] 3) )"
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
         Begin Table = "udb_store_member"
            Begin Extent = 
               Top = 6
               Left = 31
               Bottom = 331
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 81
         End
         Begin Table = "udb_authuser"
            Begin Extent = 
               Top = 166
               Left = 400
               Bottom = 266
               Right = 552
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "udb_contact"
            Begin Extent = 
               Top = 5
               Left = 388
               Bottom = 130
               Right = 571
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'udb_membercontact'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'udb_membercontact'
GO
