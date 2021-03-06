USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_credentialing]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_credentialing]
AS
SELECT     C.PMID, C.Obra90 AS [OBRA 90 COMPLIANCE], C.CounselingArea AS [COUNSELING AREA], C.PatientMR AS [PATIENT MR], 
                      C.DrugInformation AS [DRUG INFORMATION], C.MedicationErrorsDocumented AS [MEDICATION ERRORS DOCUMENTED], 
                      C.HasResolutionPolicy AS [HAS RESOLUTION POLICY], C.DeliveryService AS [DELIVER SERVICE], 
                      C.doesCompoundPrescriptions AS [DOES COMPOUND PRESCRIPTIONS], C.ProvidesIV AS [PROVIDES IV], 
                      C.FraudFelonyConviction AS [FRAUD OR FELONY CONVICTION], C.RxLicenseSuspendedOrRevoked AS [RX LICENSE SUSPENDED OR REVOKED], 
                      C.SuspensionRevokationExplanation AS [EXPLANATION RX LICENSE SUSPENDED OR REVOKED], 
                      C.UnrestrictedLicense AS [UNRESTRICTED LICENSE], C.UnrestrictedLicenseExplanation AS [EXPLAIN NOT HAVING AN UNRESTRICTED LICENSE], 
                      C.InvestigatedByMedicareMedicaid AS [INVESTIGATED BY MEDICARE MEDICAID], C.Judgements AS [JUDGEMENTS/SETTLEMENTS OVER 10K], 
                      C.AlternativeLanguages AS [ALTERNATIVE LANGUAGES], C.SpecialtyServices AS [SPECIALTY SERVICES], C.ProfLiabCarrier AS [PROF LIAB CARRIER], 
                      C.ProfLiabLimit1 AS [PROF LIAB LIMIT1], C.ProfPolicyNumber AS [PROF POLICY NUMBER], C.ProfLiabInsExpDate AS [PROF LIAB INS EXP DATE], 
                      C.ProfLiabLimit2 AS [PROF LIAB LIMIT2], C.UAICoverage AS [UAI COVERAGE], C.GenLiabCarrier AS [GEN LIAB CARRIER], 
                      C.GenLiabilityLimit1 AS [GEN LIABILITY LIMIT1], C.GenLiabPolicyNumber AS [GEN LIAB POLICY NUMBER], C.GenInsExpDate AS [GEN INS EXP DATE], 
                      C.GenLiabilityLimit2 AS [GEN LIAB LIMIT2], P.PharFullName AS [PHARMACIST FULL NAME], P.PharTitle AS [PHARMACIST TITLE], 
                      P.PharState AS [PHARMACIST STATE], P.PharLicNo AS [PHARMACIST LICENSE NO], P.PharExpDate AS [PHARMACIST EXP DATE]
FROM         dbo.PM_Cred AS C LEFT OUTER JOIN
                      dbo.PM_Pharmacists AS P ON P.PMID = C.PMID AND P.PharPrime = 1
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
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 321
               Bottom = 121
               Right = 473
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_credentialing'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_credentialing'
GO
