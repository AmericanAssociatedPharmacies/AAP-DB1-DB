USE [AAP]
GO
/****** Object:  View [dbo].[v_AAP_Monitor]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AAP_Monitor]
AS
WITH unq_primary AS (SELECT DISTINCT PrimaryKey, SysUser, TableName
                                                  FROM         dbo.Audit), unq_users AS
    (SELECT DISTINCT PrimaryKey, SysUser
      FROM          dbo.Audit AS Audit_4), unq_tables AS
    (SELECT DISTINCT PrimaryKey, SysUser, TableName
      FROM          dbo.Audit AS Audit_3), unq_primary_today AS
    (SELECT DISTINCT PrimaryKey, SysUser, TableName
      FROM          dbo.Audit AS Audit_2
      WHERE      (CAST(CONVERT(varchar, AuditDate, 101) AS DateTime) = CAST(CONVERT(varchar, GETDATE(), 101) AS DateTime))), 
unq_primary_yesterday AS
    (SELECT DISTINCT PrimaryKey, SysUser, TableName
      FROM          dbo.Audit AS Audit_1
      WHERE      (CAST(CONVERT(varchar, AuditDate, 101) AS DateTime) = CAST(CONVERT(varchar, GETDATE(), 101) AS DateTime)))
    SELECT DISTINCT 
                            TOP (100) PERCENT a.AuditID, a.SysUser, a.TableName, CASE operation WHEN 'i' THEN 'ADD' ELSE 'UPDATE' END AS operation, a.AuditDate, 
                            aap.CorpName, aap.StoreName, aap.AAPID, aap.DEA, aap.PreviousAcctNo
     FROM         dbo.Audit AS a INNER JOIN
                            dbo.AAPAccount AS aap ON a.PrimaryKey = aap.AccountID
     WHERE     (CAST(CONVERT(varchar, a.AuditDate, 101) AS DateTime) BETWEEN CAST(CONVERT(varchar, GETDATE() - 14, 101) AS DateTime) AND 
                            CAST(CONVERT(varchar, GETDATE(), 101) AS DateTime))
     GROUP BY a.AuditID, a.SysUser, a.TableName, a.Operation, a.AuditDate, aap.CorpName, aap.StoreName, aap.AAPID, aap.DEA, aap.PreviousAcctNo
     ORDER BY a.AuditDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[37] 2[18] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 186
               Right = 360
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "aap"
            Begin Extent = 
               Top = 31
               Left = 477
               Bottom = 146
               Right = 738
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
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2400
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AAP_Monitor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_AAP_Monitor'
GO
