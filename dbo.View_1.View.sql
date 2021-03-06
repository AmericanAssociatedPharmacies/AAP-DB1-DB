USE [WebTest]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        a.PMId, a.CollectionId, c.IsActive, c.IsControlEntity, 'S' AS [Location Type], d.ColumnName, 
                         (CASE WHEN o.html LIKE 'radio' THEN (CASE WHEN AnswerText = 'Yes' THEN 'Y' WHEN AnswerText = 'No' THEN 'N' WHEN AnswerText IS NULL OR
                         AnswerText = '' THEN [dbo].[fnSurveyGetAnswerByQuestion](q.id, a.Pmid, q.SurveyId, c.id, 'caremark') ELSE AnswerText END) ELSE AnswerInput END) 
                         AS Answer
FROM            dbo.SurveyQuestion AS q LEFT OUTER JOIN
                         dbo.SurveyOption AS o ON q.Id = o.QuestionId LEFT OUTER JOIN
                         dbo.SurveyDocument AS d ON d.QuestionId = o.QuestionId LEFT OUTER JOIN
                         dbo.SurveyAnswer AS a ON a.OptionId = o.Id AND a.PMId IS NOT NULL LEFT OUTER JOIN
                         dbo.SurveyControlEntity AS c ON a.PMId = c.PMId AND c.IsControlEntity = 1 AND c.Title IN ('Board Member', 'Managing Employee', 'Pharmacist in Charge', 
                         'Other Employee', 'Officer', 'Owner', 'Entity', 'Agent')
WHERE        (q.SurveyId IN (17, 27)) AND (d.Section = 'OwnershipControl') AND (q.IsActive = 1) AND (o.IsActive = 1) AND (a.PMId IN (100211))
GROUP BY a.PMId, a.CollectionId, d.ColumnName, q.Id, a.PMId, q.SurveyId, o.Html, a.AnswerText, a.AnswerInput, c.Id, c.PMId, c.IsActive, c.IsControlEntity
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[11] 4[47] 2[25] 3) )"
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
         Begin Table = "q"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 292
               Bottom = 135
               Right = 478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 516
               Bottom = 135
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 747
               Bottom = 135
               Right = 943
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 981
               Bottom = 135
               Right = 1261
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
         Column = 4260
         Alias = 2880
         Table = 2880
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
