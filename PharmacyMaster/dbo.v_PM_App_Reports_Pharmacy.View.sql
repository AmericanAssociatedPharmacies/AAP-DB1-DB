USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_App_Reports_Pharmacy]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_App_Reports_Pharmacy]
AS
SELECT DISTINCT 
                      p.PMID, p.PMParentID, p.AAPAccountNo, p.AAPEffectiveDate, p.AAPParentNo, p.AAPPreviousGroup, p.AAPQuitDate, p.AAPStatus, p.AccountDescription, 
                      p.AccountName, p.AllowDupDEA, p.APIAccountNo, p.APIMemberNo, p.APIStatus, p.AvgWholesaleVolume, p.BusinessClass, p.CAHStatus, p.CardinalDC, 
                      p.ComputerSoftware, p.ContractDate, p.CorporateName, p.CustPayTermsAPI, p.DateOpened, p.DBA, p.DEA, p.DEAEXP, p.Email, p.EmergencyPhone, 
                      p.FedID, p.HolidayHours, p.Hours, p.NCPDP, p.NPI, p.NumReactivated, p.OrigStartDate, p.OwnerName, p.Payee_id, p.PrimaryCAAccountNo, p.QPS, 
                      p.Resigned, p.Source, p.Status, T.Territory + ' - ' + T.FirstName + '  ' + T.LastName AS Territory, p.UDAccountNo, p.UDNonPharmacy, p.UDParentNo, 
                      p.UDQuitDate, p.UDStatus, p.Website, p.Wholesaler, p.WholesalerAccountNo, p.WhyResigned, p.StoreHours_MondayFridayAM, 
                      p.StoreHours_MondayFridayPM, p.StoreHours_SaturdayAM, p.StoreHours_SaturdayPM, p.StoreHours_SundayAM, p.AuthorizedVoter, 
                      p.MembershipOwner, p.StoreHours_SundayPM, p.ACHEmail AS FinancialEmail, p.Created, p.Modified, p.RowVersion, a.Phone, a.Fax, 
                      c.StateLicExpDate, c.StateLicNo, c.StateMedicaidNo, dbo.PM_App_Reports_GetAffiliateName(p.PMID) AS Affiliate, p.CategoryID, 
                      dbo.PM_App_Reports_GetGroupName(p.PMID) AS GroupName, dbo.PM_App_Reports_GetVendor(p.PMID) AS VendorName, 
                      CAST((CASE WHEN p.CompetitiveAcct IS NULL THEN '0' ELSE p.CompetitiveAcct END) AS bit) AS CompetitiveAcct, 
                      CAST((CASE WHEN p.IsStartUpStore IS NULL THEN '0' ELSE p.IsStartUpStore END) AS bit) AS IsStartUpStore, 
                      CAST((CASE WHEN p.IsBuyingGroup IS NULL THEN '0' ELSE p.IsBuyingGroup END) AS bit) AS IsBuyingGroup, CAST((CASE WHEN p.IsPva IS NULL 
                      THEN '0' ELSE p.IsPva END) AS bit) AS IsPVA, CAST((CASE WHEN p.FeePaid IS NULL THEN '0' ELSE p.FeePaid END) AS bit) AS FeePaid, 
                      CAST((CASE WHEN p.IsManagedCare IS NULL THEN '0' ELSE p.IsManagedCare END) AS bit) AS IsManagedCare, 
                      CAST((CASE WHEN p.IsWarehouse IS NULL THEN '0' ELSE p.IsWarehouse END) AS bit) AS IsWarehouse, CAST((CASE WHEN p.IsNPP IS NULL 
                      THEN '0' ELSE p.IsNPP END) AS bit) AS IsNPP, CAST((CASE WHEN p.IsPos IS NULL THEN '0' ELSE p.IsPos END) AS bit) AS IsPOS, p.GroupNo, 
                      dbo.PM_MembershipTypes.Description AS MembershipType, dbo.PM_OrganizationTypes.Description AS OrganizationType
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                      dbo.PM_OrganizationTypes ON p.OrganizationType = dbo.PM_OrganizationTypes.ID LEFT OUTER JOIN
                      dbo.PM_MembershipTypes ON p.MembershipType = dbo.PM_MembershipTypes.ID LEFT OUTER JOIN
                          (SELECT DISTINCT PMID, Phone, Fax
                            FROM          dbo.PM_AddressMaster
                            WHERE      (Address_Type_Id = 1)) AS a ON p.PMID = a.PMID LEFT OUTER JOIN
                      dbo.PM_Territory AS T ON T.Territory = p.Territory LEFT OUTER JOIN
                          (SELECT DISTINCT StateLicExpDate, StateLicNo, StateMedicaidNo, PMID
                            FROM          dbo.PM_Cred) AS c ON p.PMID = c.PMID LEFT OUTER JOIN
                      dbo.PM_VendorAccts AS VA ON VA.PMID = p.PMID LEFT OUTER JOIN
                      dbo.PM_Vendors AS V ON V.VendorID = VA.VendorID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[15] 4[13] 2[32] 3) )"
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
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 32
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 99
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 690
               Bottom = 114
               Right = 851
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 300
               Bottom = 114
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PM_OrganizationTypes"
            Begin Extent = 
               Top = 6
               Left = 889
               Bottom = 84
               Right = 1041
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PM_MembershipTypes"
            Begin Extent = 
               Top = 84
               Left = 889
               Bottom = 162
               Right = 1041
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PM_Vendors"
            Begin Extent = 
               Top = 102
               Left = 490
               Bottom = 210
               Right = 642
            End
            DisplayFlags = 280
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_App_Reports_Pharmacy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 83
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
         Column = 3330
         Alias = 2745
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_App_Reports_Pharmacy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_PM_App_Reports_Pharmacy'
GO
