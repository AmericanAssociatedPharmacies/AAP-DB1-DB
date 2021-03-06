USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_App_Reports_Wholesaler]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_App_Reports_Wholesaler]
AS
SELECT     CH.PMID, CH.CHParentCode AS [CA PARENT CODE], CH.Division + ' - ' + dbo.PM_CHDivisions.DivName AS Division, 
                      CH.CHAccountNoPrimary AS [PRIMARY CA ACCT#], CH.CHAccountNo2 AS [2ND CARDINAL CUST], CH.CHAccountNo3 AS [3RD CARDINAL CUST], 
                      CH.POSAcct AS [POS ACCT], CH.ScanTossAcct AS [SCAN TOSS ACCT], CH.CSOSAcct AS [CSOS ACCT], CH.AAPContractDate AS [AAP CONTRACT DATE], 
                      CH.TerminationDate AS [PVA TERMINATION DATE], CH.MultipleStoreCode AS [MULTIPLE STORE CODE], CH.CurrEstMoSales AS [CURR EST MO SALES],
                       CH.CurrGroupTotal AS [CURR GROUP TOTAL], CH.EstVolAtLoad AS [EST VOL AT LOAD], CH.LastReviewDate AS [LAST REVIEW DATE], 
                      CH.CurrAPICOG AS [MATRIX COG], CH.CurrCHCOG AS [CURR CA COG], Pay.PayTermsDesc AS [PAY TERMS DESC], 
                      CH.PayTermsCode AS [PAY TERMS CODE], CH.NotesCOGDifferences AS [NOTES COG DIFF], CH.Notes AS [GENERAL NOTES], CH.WAPD, CH.DSO, 
                      CH.LastUpdate AS [LAST UPDATE], CH.WAPD2ndAcct AS [WAPD 2ND ACCT], CH.DSO2ndAcct AS [DSO 2ND ACCT], 
                      CH.NotesOnTerms AS [NOTES ON TERMS], CH.ChangePending AS [NOTES ON CHANGE PENDING], CAST((CASE WHEN CH.Marker IS NULL 
                      THEN '0' ELSE CH.Marker END) AS bit) AS Marker, CAST((CASE WHEN CH.IsMCAOnFile IS NULL THEN '0' ELSE CH.IsMCAOnFile END) AS bit) 
                      AS [IS MCA ON FILE], CAST((CASE WHEN CH.IsMultipleStore IS NULL THEN '0' ELSE CH.IsMultipleStore END) AS bit) AS [IS MULTIPLE STORE], 
                      CAST((CASE WHEN CH.IsPendingChanges IS NULL THEN '0' ELSE CH.IsPendingChanges END) AS bit) AS [IS PENDING CHANGES], 
                      CAST((CASE WHEN CH.IsOptionalPayTerms IS NULL THEN '0' ELSE CH.IsOptionalPayTerms END) AS bit) AS [IS OPTIONAL PAY TERMS], 
                      CAST((CASE WHEN CH.IsExcptToMatrix IS NULL THEN '0' ELSE CH.IsExcptToMatrix END) AS bit) AS [IS EXCEPTION TO MATRIX], 
                      CAST((CASE WHEN CH.IsFrontLoadNoReb IS NULL THEN '0' ELSE CH.IsFrontLoadNoReb END) AS bit) AS [FRONT LOAD-NO REB], 
                      CAST((CASE WHEN CH.IsSublogicChange IS NULL THEN '0' ELSE CH.IsSublogicChange END) AS bit) AS [SUBLOGIC CHANGE]
FROM         dbo.pm_chaccounts_adj AS CH INNER JOIN
                      dbo.PM_CHDivisions ON CH.Division = dbo.PM_CHDivisions.DivNo INNER JOIN
                      dbo.PM_CHPayTerms AS Pay ON Pay.PayTerms = CH.PayTermsDesc
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CH"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 114
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PM_CHDivisions"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 114
               Right = 618
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pay"
            Begin Extent = 
               Top = 6
               Left = 656
               Bottom = 99
               Right = 808
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
      Begin ColumnWidths = 40
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_App_Reports_Wholesaler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_App_Reports_Wholesaler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_App_Reports_Wholesaler'
GO
