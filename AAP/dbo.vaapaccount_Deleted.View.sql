USE [AAP]
GO
/****** Object:  View [dbo].[vaapaccount_Deleted]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vaapaccount_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[AccountID] ' THEN LastValue ELSE '' END) AS [AccountID], 
 Max(Case ColumnName WHEN '[CorpName] ' THEN LastValue ELSE '' END) AS [CorpName], 
 Max(Case ColumnName WHEN '[StoreName] ' THEN LastValue ELSE '' END) AS [StoreName], 
 Max(Case ColumnName WHEN '[AAPID] ' THEN LastValue ELSE '' END) AS [AAPID], 
 Max(Case ColumnName WHEN '[ParentAAPID] ' THEN LastValue ELSE '' END) AS [ParentAAPID], 
 Max(Case ColumnName WHEN '[Addr1] ' THEN LastValue ELSE '' END) AS [Addr1], 
 Max(Case ColumnName WHEN '[Addr2] ' THEN LastValue ELSE '' END) AS [Addr2], 
 Max(Case ColumnName WHEN '[City] ' THEN LastValue ELSE '' END) AS [City], 
 Max(Case ColumnName WHEN '[State] ' THEN LastValue ELSE '' END) AS [State], 
 Max(Case ColumnName WHEN '[Zip] ' THEN LastValue ELSE '' END) AS [Zip], 
 Max(Case ColumnName WHEN '[AreaCode] ' THEN LastValue ELSE '' END) AS [AreaCode], 
 Max(Case ColumnName WHEN '[Phone] ' THEN LastValue ELSE '' END) AS [Phone], 
 Max(Case ColumnName WHEN '[FaxAreaCode] ' THEN LastValue ELSE '' END) AS [FaxAreaCode], 
 Max(Case ColumnName WHEN '[Fax] ' THEN LastValue ELSE '' END) AS [Fax], 
 Max(Case ColumnName WHEN '[NSTerritory] ' THEN LastValue ELSE '' END) AS [NSTerritory], 
 Max(Case ColumnName WHEN '[FeePaid] ' THEN LastValue ELSE '' END) AS [FeePaid], 
 Max(Case ColumnName WHEN '[NppMbr] ' THEN LastValue ELSE '' END) AS [NppMbr], 
 Max(Case ColumnName WHEN '[DEA] ' THEN LastValue ELSE '' END) AS [DEA], 
 Max(Case ColumnName WHEN '[DEAEXP] ' THEN LastValue ELSE '' END) AS [DEAEXP], 
 Max(Case ColumnName WHEN '[NCPDP] ' THEN LastValue ELSE '' END) AS [NCPDP], 
 Max(Case ColumnName WHEN '[NPI] ' THEN LastValue ELSE '' END) AS [NPI], 
 Max(Case ColumnName WHEN '[ArgusAgree] ' THEN LastValue ELSE '' END) AS [ArgusAgree], 
 Max(Case ColumnName WHEN '[CompetitiveAcct] ' THEN LastValue ELSE '' END) AS [CompetitiveAcct], 
 Max(Case ColumnName WHEN '[Email] ' THEN LastValue ELSE '' END) AS [Email], 
 Max(Case ColumnName WHEN '[GroupDesignation] ' THEN LastValue ELSE '' END) AS [GroupDesignation], 
 Max(Case ColumnName WHEN '[IsMember] ' THEN LastValue ELSE '' END) AS [IsMember], 
 Max(Case ColumnName WHEN '[IsAffiliateGroup] ' THEN LastValue ELSE '' END) AS [IsAffiliateGroup], 
 Max(Case ColumnName WHEN '[IsBuyingGroup] ' THEN LastValue ELSE '' END) AS [IsBuyingGroup], 
 Max(Case ColumnName WHEN '[IsNPP] ' THEN LastValue ELSE '' END) AS [IsNPP], 
 Max(Case ColumnName WHEN '[IsWarehouse] ' THEN LastValue ELSE '' END) AS [IsWarehouse], 
 Max(Case ColumnName WHEN '[IsPVA] ' THEN LastValue ELSE '' END) AS [IsPVA], 
 Max(Case ColumnName WHEN '[IsPOS] ' THEN LastValue ELSE '' END) AS [IsPOS], 
 Max(Case ColumnName WHEN '[AffiliateGroupName] ' THEN LastValue ELSE '' END) AS [AffiliateGroupName], 
 Max(Case ColumnName WHEN '[County] ' THEN LastValue ELSE '' END) AS [County], 
 Max(Case ColumnName WHEN '[OwnerFirst] ' THEN LastValue ELSE '' END) AS [OwnerFirst], 
 Max(Case ColumnName WHEN '[OwnerLast] ' THEN LastValue ELSE '' END) AS [OwnerLast], 
 Max(Case ColumnName WHEN '[Effective] ' THEN LastValue ELSE '' END) AS [Effective], 
 Max(Case ColumnName WHEN '[AvgWholesaleVolume] ' THEN LastValue ELSE '' END) AS [AvgWholesaleVolume], 
 Max(Case ColumnName WHEN '[EffectiveAAP] ' THEN LastValue ELSE '' END) AS [EffectiveAAP], 
 Max(Case ColumnName WHEN '[IsStartUpStore] ' THEN LastValue ELSE '' END) AS [IsStartUpStore], 
 Max(Case ColumnName WHEN '[IsPharmacy] ' THEN LastValue ELSE '' END) AS [IsPharmacy], 
 Max(Case ColumnName WHEN '[ChainCode] ' THEN LastValue ELSE '' END) AS [ChainCode], 
 Max(Case ColumnName WHEN '[FedID] ' THEN LastValue ELSE '' END) AS [FedID], 
 Max(Case ColumnName WHEN '[AAPPreviousGroup] ' THEN LastValue ELSE '' END) AS [AAPPreviousGroup], 
 Max(Case ColumnName WHEN '[SwitchedFrom] ' THEN LastValue ELSE '' END) AS [SwitchedFrom], 
 Max(Case ColumnName WHEN '[QuitDate] ' THEN LastValue ELSE '' END) AS [QuitDate], 
 Max(Case ColumnName WHEN '[PreviousAcctNo] ' THEN LastValue ELSE '' END) AS [PreviousAcctNo], 
 Max(Case ColumnName WHEN '[APIPreviousAcctNo] ' THEN LastValue ELSE '' END) AS [APIPreviousAcctNo], 
 Max(Case ColumnName WHEN '[APIWarehouseAcctNo] ' THEN LastValue ELSE '' END) AS [APIWarehouseAcctNo], 
 Max(Case ColumnName WHEN '[Bulletin] ' THEN LastValue ELSE '' END) AS [Bulletin], 
 Max(Case ColumnName WHEN '[StateLicNo] ' THEN LastValue ELSE '' END) AS [StateLicNo], 
 Max(Case ColumnName WHEN '[StateMedicaidNo] ' THEN LastValue ELSE '' END) AS [StateMedicaidNo], 
 Max(Case ColumnName WHEN '[StateLicExpDate] ' THEN LastValue ELSE '' END) AS [StateLicExpDate], 
 Max(Case ColumnName WHEN '[Payee_id] ' THEN LastValue ELSE '' END) AS [Payee_id], 
 Max(Case ColumnName WHEN '[EmergencyPhone] ' THEN LastValue ELSE '' END) AS [EmergencyPhone], 
 Max(Case ColumnName WHEN '[Hours] ' THEN LastValue ELSE '' END) AS [Hours], 
 Max(Case ColumnName WHEN '[HolidayHours] ' THEN LastValue ELSE '' END) AS [HolidayHours], 
 Max(Case ColumnName WHEN '[GenLiabCarrier] ' THEN LastValue ELSE '' END) AS [GenLiabCarrier], 
 Max(Case ColumnName WHEN '[GenLiabPolicyNumber] ' THEN LastValue ELSE '' END) AS [GenLiabPolicyNumber], 
 Max(Case ColumnName WHEN '[GenLiabilityLimit1] ' THEN LastValue ELSE '' END) AS [GenLiabilityLimit1], 
 Max(Case ColumnName WHEN '[GenLiabilityLimit2] ' THEN LastValue ELSE '' END) AS [GenLiabilityLimit2], 
 Max(Case ColumnName WHEN '[GenInsExpDate] ' THEN LastValue ELSE '' END) AS [GenInsExpDate], 
 Max(Case ColumnName WHEN '[ProfLiabCarrier] ' THEN LastValue ELSE '' END) AS [ProfLiabCarrier], 
 Max(Case ColumnName WHEN '[ProfLiabInsExpDate] ' THEN LastValue ELSE '' END) AS [ProfLiabInsExpDate], 
 Max(Case ColumnName WHEN '[ProfPolicyNumber] ' THEN LastValue ELSE '' END) AS [ProfPolicyNumber], 
 Max(Case ColumnName WHEN '[ProfLiabLimit1] ' THEN LastValue ELSE '' END) AS [ProfLiabLimit1], 
 Max(Case ColumnName WHEN '[ProfLiabLimit2] ' THEN LastValue ELSE '' END) AS [ProfLiabLimit2], 
 Max(Case ColumnName WHEN '[DeliveryService] ' THEN LastValue ELSE '' END) AS [DeliveryService], 
 Max(Case ColumnName WHEN '[EmergencyServices] ' THEN LastValue ELSE '' END) AS [EmergencyServices], 
 Max(Case ColumnName WHEN '[AnsweringServiceOrMachine] ' THEN LastValue ELSE '' END) AS [AnsweringServiceOrMachine], 
 Max(Case ColumnName WHEN '[AlternativeLanguages] ' THEN LastValue ELSE '' END) AS [AlternativeLanguages], 
 Max(Case ColumnName WHEN '[SpecialtyServices] ' THEN LastValue ELSE '' END) AS [SpecialtyServices], 
 Max(Case ColumnName WHEN '[ComputerSoftware] ' THEN LastValue ELSE '' END) AS [ComputerSoftware], 
 Max(Case ColumnName WHEN '[Obra90] ' THEN LastValue ELSE '' END) AS [Obra90], 
 Max(Case ColumnName WHEN '[CounselingArea] ' THEN LastValue ELSE '' END) AS [CounselingArea], 
 Max(Case ColumnName WHEN '[PatientMR] ' THEN LastValue ELSE '' END) AS [PatientMR], 
 Max(Case ColumnName WHEN '[DrugInformation] ' THEN LastValue ELSE '' END) AS [DrugInformation], 
 Max(Case ColumnName WHEN '[FraudFelonyConviction] ' THEN LastValue ELSE '' END) AS [FraudFelonyConviction], 
 Max(Case ColumnName WHEN '[FraudFelonyExplanation] ' THEN LastValue ELSE '' END) AS [FraudFelonyExplanation], 
 Max(Case ColumnName WHEN '[RxLicenseSuspendedOrRevoked] ' THEN LastValue ELSE '' END) AS [RxLicenseSuspendedOrRevoked], 
 Max(Case ColumnName WHEN '[SuspensionRevokationExplanation] ' THEN LastValue ELSE '' END) AS [SuspensionRevokationExplanation], 
 Max(Case ColumnName WHEN '[UnrestrictedLicense] ' THEN LastValue ELSE '' END) AS [UnrestrictedLicense], 
 Max(Case ColumnName WHEN '[UnrestrictedLicenseExplanation] ' THEN LastValue ELSE '' END) AS [UnrestrictedLicenseExplanation], 
 Max(Case ColumnName WHEN '[InvestigatedByMedicareMedicaid] ' THEN LastValue ELSE '' END) AS [InvestigatedByMedicareMedicaid], 
 Max(Case ColumnName WHEN '[UAICoverage] ' THEN LastValue ELSE '' END) AS [UAICoverage], 
 Max(Case ColumnName WHEN '[Judgements] ' THEN LastValue ELSE '' END) AS [Judgements], 
 Max(Case ColumnName WHEN '[CompliesWithADAAct] ' THEN LastValue ELSE '' END) AS [CompliesWithADAAct], 
 Max(Case ColumnName WHEN '[AverageWaitTime] ' THEN LastValue ELSE '' END) AS [AverageWaitTime], 
 Max(Case ColumnName WHEN '[MedicationErrorsDocumented] ' THEN LastValue ELSE '' END) AS [MedicationErrorsDocumented], 
 Max(Case ColumnName WHEN '[ErrorCount12Months] ' THEN LastValue ELSE '' END) AS [ErrorCount12Months], 
 Max(Case ColumnName WHEN '[HasResolutionPolicy] ' THEN LastValue ELSE '' END) AS [HasResolutionPolicy], 
 Max(Case ColumnName WHEN '[doesCompoundPrescriptions] ' THEN LastValue ELSE '' END) AS [doesCompoundPrescriptions], 
 Max(Case ColumnName WHEN '[UnitDosing] ' THEN LastValue ELSE '' END) AS [UnitDosing], 
 Max(Case ColumnName WHEN '[ProvidesDME] ' THEN LastValue ELSE '' END) AS [ProvidesDME], 
 Max(Case ColumnName WHEN '[ProvidesIV] ' THEN LastValue ELSE '' END) AS [ProvidesIV], 
 Max(Case ColumnName WHEN '[CertifiedDiseaseMgmt] ' THEN LastValue ELSE '' END) AS [CertifiedDiseaseMgmt], 
 Max(Case ColumnName WHEN '[CDMExplanation] ' THEN LastValue ELSE '' END) AS [CDMExplanation], 
 Max(Case ColumnName WHEN '[GroupPresentations] ' THEN LastValue ELSE '' END) AS [GroupPresentations], 
 Max(Case ColumnName WHEN '[ContinuingEducationRequired] ' THEN LastValue ELSE '' END) AS [ContinuingEducationRequired], 
 Max(Case ColumnName WHEN '[StoreSizeClassification] ' THEN LastValue ELSE '' END) AS [StoreSizeClassification], 
 Max(Case ColumnName WHEN '[CopyReleaseInfo] ' THEN LastValue ELSE '' END) AS [CopyReleaseInfo], 
 Max(Case ColumnName WHEN '[DBA] ' THEN LastValue ELSE '' END) AS [DBA], 
 Max(Case ColumnName WHEN '[Website] ' THEN LastValue ELSE '' END) AS [Website], 
 Max(Case ColumnName WHEN '[Resigned] ' THEN LastValue ELSE '' END) AS [Resigned], 
 Max(Case ColumnName WHEN '[ContactFirst] ' THEN LastValue ELSE '' END) AS [ContactFirst], 
 Max(Case ColumnName WHEN '[ContactLast] ' THEN LastValue ELSE '' END) AS [ContactLast], 
 Max(Case ColumnName WHEN '[ContactTitle] ' THEN LastValue ELSE '' END) AS [ContactTitle], 
 Max(Case ColumnName WHEN '[WhyResigned] ' THEN LastValue ELSE '' END) AS [WhyResigned]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.aapaccount') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.aapaccount') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.aapaccount') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
