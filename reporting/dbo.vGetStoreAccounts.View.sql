USE [reporting]
GO
/****** Object:  View [dbo].[vGetStoreAccounts]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vGetStoreAccounts]
AS
SELECT     WHYMODIFIED, CORPNAME, STORE, [GROUP], [NON-PHARMACY], ACCT_NO, ADDR1, ADDR2, CITY, COUNTY, STATE, ZIP, ATTEND, COUNCIL, 
                      [COUNCIL NAME], AREACODE, PHONE1, [EMERGENCY PHONE], FAXAREACODE, FAX, EMAILADDRESS, WEBADDRESS, CONTACT_F, CONTACT_L, 
                      [CONTACT PERSON'S TITLE], BoardOfDirectors, [OFFICERS/YEAR], [BOARD POSITION], NSTERRITORY, MDMTERRITORY, RESIGNED, ARCHIVE, 
                      FEE_PD, NPP_MBR, FOREIGN_GRP, FEDID, DEA, [STATE MED #], RURAL, [STATE LIC #], [ON CALL], [OBRA 90], [COUNSELING AREA], [PATIENT MR], 
                      [DRUG INFORMATION], [FRAUD?], FRD_FEL_EXPLAN, [RX LICENSE SUS/REV], SUS_REV_EXPLAN, [UNRESTRICTED LIC], UNRES_LIC_EXPLAN, 
                      [INV/SANC BY MEDICARE], JUDGEMENTS, [COMPLY WITH ADA ACT], [UAI COVERAGE], [PROF LIAB INS], [PROF LIAB CARRIER], [PROF POL #], 
                      [PROF LIAB LIMIT 1], [PROF LIAB LIMIT 2], [PROF LIAB INS COF], [GEN LIAB INS], [GEN LIAB INS CARRIER], [GEN LIAB INS POLICY #], 
                      [GEN LIAB LIMIT 1], [GEN LIAB LIMIT 2], [PHAR LIAB INS], [AVE WAIT TIME], [MEDICATION ERRORS DOCUMENTED], [RESOLUTION POLICY], 
                      [COMPOUND PRESCRIPTIONS], [UNIT DOSING], [DUR MED EQ SVC], [CERTIFIED DISEASE MGMT], [CDM EXPLANATION], [GROUP PRESENTATIONS], 
                      [CONTINUING EDUCATION], [ST BOARD INSP], [COPY RELEASE INFO], NABP, BULLETIN, [STORE SIZE CLASSIFICATION], [HOLIDAY HOURS], HOURS, 
                      [DELIVERY SERVICE], [EMERGENCY SERVICES], [ANS MACH/ANS SERVICE], [ALTERNATIVE LANGUAGES], [SPECIALTY SERVICES], 
                      [COMPUTER SOFTWARE], [OUTSIDE ID], [WHOLESALER NAME], [WHOLESALER ACCT#], DC_NBR, COMPETITIVEACCT, GPPFORM, GPPLETTER, 
                      [LEAST EXP GEN], [HEALTH PLAN CONTACTS], [UNITED ASSURANCE], [MEMO LIT SIGN], [INDOOR LIGHTED SIGN], [RX CARE PROGRAM], [PCS FORM], 
                      [GROUP DESIGNATION], IPCFORM, SWITCHEDFROM, [PRE-POST], [ARGUS AGREE], AFFILIATION, [BBC SECONDARY ACCT], GNP, MSR, PASSWORD, 
                      LOGIN, [AVERAGE VOLUME], PLUSCARE, STEP_UP, ADDCHG, CHAIN_CODE, PAYEE_ID, STORE_ID, LASTMODIFIED, QUITDATE, EFFECTIVE, DEAEXP, 
                      [ST LIC EXP DATE], [PROF LIAB INS EXP DATE], [GEN LIAB INS EXP DATE], GRPEFFDATE, NPI
FROM         [UNITEDDB-GENREBATE]..UNITED.STORE_MEMBER AS STORE_MEMBER_1
UNION ALL
SELECT     '' AS 'WHYMODIFIED', CorpName, StoreName AS 'STORE', GroupDesignation AS 'GROUP', '' AS 'NON-PHARMACY', CAST(AAPID AS VARCHAR(5)) 
                      AS 'ACCT_NO', Addr1, Addr2, City, '' AS 'COUNTY', State, Zip, '' AS 'ATTEND', '' AS 'COUNCIL', '' AS 'COUNCIL NAME', AreaCode, Phone AS 'PHONE1', 
                      '' AS 'EMERGENCY PHONE', FaxAreaCode, Fax, Email AS 'EMAILADDRESS', Website AS 'WEBADDRESS', ContactFirst AS 'CONTACT_F', 
                      ContactLast AS 'CONTACT_L', ContactTitle AS [CONTACT PERSON'S TITLE], '' AS 'BOARDOFDIRECTORS', '' AS 'OFFICERS/YEAR', 
                      '' AS 'BOARD POSITION', NSTerritory AS 'NSTERRITORY', '' AS 'MDMTERRITORY', Resigned, '' AS 'ARCHIVE', FeePaid AS 'FEE_PD', 
                      NppMbr AS 'NPP_MBR', '' AS 'FOREIGN_GRP', FedID, DEA, StateMedicaidNo AS 'STATE MED #', '' AS 'RURAL', StateLicNo AS 'STATE LIC #', 
                      '' AS 'ON CALL', CAST(Obra90 AS VARCHAR(6)) AS 'OBRA 90', CAST(CounselingArea AS VARCHAR(5)) AS 'COUNSELING AREA', 
                      CAST(PatientMR AS VARCHAR(5)) AS 'PATIENT MR', CAST(DrugInformation AS VARCHAR(5)) AS 'DRUG INFORMATION', 
                      CAST(FraudFelonyConviction AS VARCHAR(1)) AS 'FRAUD?', FraudFelonyExplanation AS 'FRD_FEL_EXPLAIN', 
                      CAST(RxLicenseSuspendedOrRevoked AS VARCHAR(5)) AS 'RX LICENSE SUS/REV', SuspensionRevokationExplanation AS 'SUS_REV_EXPLAIN', 
                      CAST(UnrestrictedLicense AS VARCHAR(5)) AS 'UNRESTRICTED LIC', UnrestrictedLicenseExplanation AS 'UNRES_LIC_EXPLAIN', 
                      CAST(InvestigatedByMedicareMedicaid AS VARCHAR(5)) AS 'INV/SANC BY MEDICARE', CAST(Judgements AS VARCHAR(5)) AS 'JUDGEMENTS', 
                      CAST(CompliesWithADAAct AS VARCHAR(5)) AS 'COMPLY WITH ADA ACT', UAICoverage AS 'UAI COVERAGE', ProfLiabCarrier AS 'PROF LIAB INS', 
                      ProfLiabCarrier AS 'PROF LIAB CARRIER', ProfPolicyNumber AS 'PROF POL #', ProfLiabLimit1 AS 'PROF LIAB LIMIT 1', 
                      ProfLiabLimit2 AS 'PROF LIAB LIMIT 2', '' AS 'PROF LIAB INS COF', '' AS 'GEN LIAB INS', GenLiabCarrier AS 'GEN LIAB INS CARRIER', 
                      GenLiabPolicyNumber AS 'GEN LIAB INS POLICY #', GenLiabilityLimit1 AS 'GEN LIAB LIMIT 1', GenLiabilityLimit2 AS 'GEN LIAB LIMIT 2', 
                      '' AS 'PHAR LIAB INS', AverageWaitTime AS 'AVE WAIT TIME', CAST(MedicationErrorsDocumented AS VARCHAR(5)) 
                      AS 'MEDICATION ERRORS DOCUMENTED', CAST(HasResolutionPolicy AS VARCHAR(5)) AS 'RESOLUTION POLICY', 
                      CAST(doesCompoundPrescriptions AS VARCHAR(5)) AS 'COMPOUND PRESCRIPTIONS', UnitDosing AS 'UNIT DOSING', '' AS 'DUR MED EQ SVC', 
                      CertifiedDiseaseMgmt AS 'CERTIFIED DISEASE MGMT', CDMExplanation AS 'CDM EXPLANATION', GroupPresentations AS 'GROUP PRESENTATIONS', 
                      CAST(ContinuingEducationRequired AS VARCHAR(5)) AS 'CONTINUING EDUCATION', '' AS 'ST BOARD INSP', CAST(CopyReleaseInfo AS VARCHAR(5)) 
                      AS 'COPY RELEASE INFO', NCPDP AS 'NABP', CAST(Bulletin AS VARCHAR(3)) AS 'BULLETIN', StoreSizeClassification AS 'STORE SIE CLASSIFICATION', 
                      HolidayHours AS 'HOLIDAY HOURS', Hours AS 'HOURS', CAST(DeliveryService AS VARCHAR(6)) AS 'DELIVERY SERVICE', 
                      CAST(EmergencyServices AS VARCHAR(6)) AS 'EMERGENCY SERVICES', CAST(AnsweringServiceOrMachine AS VARCHAR(6)) 
                      AS 'ANS MACH/ANS SERVICE', AlternativeLanguages AS 'ALTERNATIVE LANGUAGES', SpecialtyServices AS 'SPECIALTY SERVICES', 
                      ComputerSoftware AS 'COMPUTER SOFTWARE', '' AS 'OUTSIDE ID', '' AS 'WHOLESALER NAME', '' AS 'WHOLESALER ACCT#', '' AS 'DC_NBR', 
                      CompetitiveAcct AS 'COMPETITVEACCT', '' AS 'GPPFORM', '' AS 'GPPLETTER', '' AS 'LEAST EXP GEN', '' AS 'HEALTH PLAN CONTACTS', 
                      '' AS 'UNITED ASSURANCE', '' AS 'MEMO LIT SIGN', '' AS 'INDOOR LIGHTED SIGN', '' AS 'RX CARE PROGRAM', '' AS 'PCS FORM', 
                      GroupDesignation AS 'GROUP DESIGNATION', '' AS 'IPCFORM', SwitchedFrom AS 'SWITCHEDFROM', '' AS 'PRE-POST', 
                      ArgusAgree AS 'ARGUS AGREE', CAST(AffiliateGroupName AS VARCHAR(3)) AS 'AFFILIATION', '' AS 'BBC SECONDARY ACCT', '' AS 'GNP', '' AS 'MSR', 
                      '' AS 'PASSWORD', '' AS 'LOGIN', '' AS 'AVERAGE VOLUME', '' AS 'PLUSCARE', '' AS 'STEP_UP', '' AS 'ADDCHG', ChainCode AS 'CHAIN_CODE', 
                      Payee_id AS 'PAYEE_ID', '' AS 'STORE_ID', '' AS 'LASTMODIFIED', QuitDate AS 'QUITDATE', Effective AS 'EFFECTIVE', DEAEXP, 
                      StateLicExpDate AS 'ST LIC EXP DATE', ProfLiabInsExpDate AS 'PROF LIAB INS EXP DATE', GenInsExpDate AS 'GEN LIAB INS EXP DATE', 
                      '' AS 'GRPEFFDATE', NPI
FROM         AAP.dbo.AAPAccount
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
         Configuration = "(H (4[30] 2[40] 3) )"
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
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 5
         Column = 2640
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetStoreAccounts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vGetStoreAccounts'
GO
