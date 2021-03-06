USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_StoreInfo]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_StoreInfo]
AS
SELECT     PM.PMID, PM.AAPAccountNo AS [AAP STORE#], PM.AAPParentNo AS [AAP PARENT STORE#], PM.APIAccountNo AS API#, 
                      PM.AccountName AS [ACCT DBA], PM.AAPEffectiveDate AS [AAP EFFECTIVE DATE], PM.AccountDescription AS [ACCOUNT DESCRIPTION], 
                      PM.CompetitiveAcct AS [COMPETITIVE ACCOUNT], PM.IsStartUpStore AS [STARTUP STORE], PM.FeePaid AS [FEE PAID], 
                      PM.IsBuyingGroup AS [ELECTED BUYING GROUP], PM.IsManagedCare AS [ELECTED MANAGED CARE], PM.IsPos AS [ELECTED POS], 
                      PM.IsNPP AS [ELECTED NON PARTICIPATING PHARMACY], PM.IsWarehouse AS [ELECTED WAREHOUSE], PM.IsPva AS [ELECTED PVA], 
                      PM.CorporateName AS CORP, PM.OwnerName, PM.Territory, PM.AAPQuitDate AS [AAP QUIT DATE], PM.WhyResigned AS [WHY RESIGNED], 
                      PM.EmergencyPhone AS [EMERGENCY PHONE], PM.Email AS [GENERAL EMAIL], PM.ACHEmail AS [FINANCIAL EMAIL], PM.Website, 
                      PM.ComputerSoftware AS SOFTWARE, PM.QPS, PM.Source, PM.UDQuitDate AS [UD QUITDATE], PM.StoreHours_MondayFridayAM, 
                      PM.StoreHours_MondayFridayPM, PM.StoreHours_SaturdayAM, PM.StoreHours_SaturdayPM, PM.StoreHours_SundayAM, PM.StoreHours_SundayPM, 
                      PM.NCPDP, PM.NPI, PM.FedID, PM.DEA, PM.DEAEXP AS [DEA EXPIRE], C.StateLicNo AS [ST LIC#], C.StateLicExpDate AS [ST EXP], 
                      C.StateMedicaidNo AS [ST MEDICAID ID], PM.AuthorizedVoter AS [AUTHORIZED VOTER], PM.MembershipOwner AS [MEMBERSHIP OWNER]
FROM         dbo.PM_Pharmacy AS PM LEFT OUTER JOIN
                      dbo.PM_Cred AS C ON C.PMID = PM.PMID
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
         Begin Table = "PM"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 78
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 699
               Bottom = 121
               Right = 944
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
      Begin ColumnWidths = 46
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StoreInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Column = 1440
         Alias = 3900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StoreInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_StoreInfo'
GO
