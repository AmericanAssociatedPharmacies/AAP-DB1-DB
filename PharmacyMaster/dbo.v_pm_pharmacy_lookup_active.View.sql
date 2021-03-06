USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_pm_pharmacy_lookup_active]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_pm_pharmacy_lookup_active]
AS
SELECT     p.PMID, p.PMParentID, p.AAPAccountNo, p.AAPEffectiveDate, p.AAPParentNo, p.AAPPreviousGroup, p.AAPQuitDate, p.AAPStatus, p.AccountDescription, 
                      p.AccountName, a.Addr1, a.Addr2, p.AllowDupDEA, p.APIAccountNo, p.APIMemberNo, p.APIStatus, p.AvgWholesaleVolume, p.BusinessClass, 
                      p.CAHStatus, p.CardinalDC, m.ChainCode, a.City, p.CompetitiveAcct, p.ComputerSoftware, a.ContactFullName, p.ContractDate, p.CorporateName, 
                      p.CustPayTermsAPI, p.DateOpened, p.DBA, p.DEA, p.DEAEXP, p.Email, p.EmergencyPhone, a.Fax, p.FedID, p.HolidayHours, p.Hours, p.IsStartUpStore, 
                      m.MCEffectiveDate, m.MCQuitDate, p.NCPDP, p.NPI, p.NumReactivated, p.OrigStartDate, p.OwnerName, p.Payee_id, a.Phone, p.PrimaryCAAccountNo, 
                      p.QPS, p.Rank, p.Resigned, p.Source, a.State, c.StateLicExpDate, c.StateLicNo, p.Status, p.Territory, p.UDAccountNo, p.UDNonPharmacy, 
                      p.UDParentNo, p.UDQuitDate, p.UDStatus, p.Website, p.Wholesaler, p.WholesalerAccountNo, p.WhyResigned, a.Zip
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                          (SELECT     PMID, Address AS Addr1, Address2 AS Addr2, ContactFullName, City, State, Zip, Phone, Fax
                            FROM          dbo.PM_AddressMaster
                            WHERE      (Address_Type_Id = 1)) AS a ON p.PMID = a.PMID LEFT OUTER JOIN
                          (SELECT     ChainCode, MCEffectiveDate, MCQuitDate, PMID
                            FROM          dbo.PM_ManagedCare) AS m ON p.PMID = m.PMID LEFT OUTER JOIN
                          (SELECT     StateLicExpDate, StateLicNo, PMID
                            FROM          dbo.PM_Cred) AS c ON p.PMID = c.PMID
WHERE     (p.UDQuitDate IS NULL) AND (p.APIStatus <> 'CLOSED') OR
                      (p.UDQuitDate IS NULL) AND (p.APIStatus <> 'CLOSED') AND (p.AAPAccountNo IS NOT NULL) AND (p.AAPQuitDate IS NULL)
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
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 121
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 126
               Left = 238
               Bottom = 226
               Right = 398
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
      Begin ColumnWidths = 9
         Width = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_pm_pharmacy_lookup_active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_pm_pharmacy_lookup_active'
GO
