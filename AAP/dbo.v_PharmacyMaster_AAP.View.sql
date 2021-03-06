USE [AAP]
GO
/****** Object:  View [dbo].[v_PharmacyMaster_AAP]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PharmacyMaster_AAP]
AS

SELECT  [AccountID] ,[CorpName] ,[StoreName] ,[AAPID] ,[ParentAAPID] ,

       am.apiaccountNo as [API AccountNo],am.udaccountno as [UD AccountNo],am.udparentno as [UD Parent AccountNo],
      aap.[Addr1] ,aap.[Addr2] ,aap.[City]  ,aap.[State]  ,aap.[Zip]  ,aap.[AreaCode] ,aap.[Phone] ,aap.[FaxAreaCode]
      ,aap.[Fax]  ,[NSTerritory] ,[FeePaid] ,[NppMbr] ,aap.[DEA] ,aap.[DEAEXP] ,[NCPDP]  ,[NPI] ,[ArgusAgree] ,[CompetitiveAcct] ,aap.[Email]  ,[GroupDesignation]
      ,[IsMember] ,[IsAffiliateGroup] ,[IsBuyingGroup]  ,[IsNPP] ,[IsWarehouse] ,[IsPVA]  ,[IsPOS] ,[AffiliateGroupName] ,[County] ,[OwnerFirst]
      ,[OwnerLast] ,[Effective] ,[AvgWholesaleVolume] ,[EffectiveAAP] ,[IsStartUpStore]  ,[IsPharmacy]  ,[ChainCode] ,aap.[FedID] ,[AAPPreviousGroup]
      ,[SwitchedFrom] ,[QuitDate] ,[PreviousAcctNo] ,[APIPreviousAcctNo] ,[APIWarehouseAcctNo]  ,[Bulletin]  ,[TS] ,aap.[StateLicNo] ,[StateMedicaidNo]
      ,aap.[StateLicExpDate] ,[Payee_id] ,[EmergencyPhone] ,[Hours] ,[HolidayHours] ,[GenLiabCarrier] ,[GenLiabPolicyNumber] ,[GenLiabilityLimit1]
      ,[GenLiabilityLimit2] ,[GenInsExpDate] ,[ProfLiabCarrier]  ,[ProfLiabInsExpDate] ,[ProfPolicyNumber] ,[ProfLiabLimit1] ,[ProfLiabLimit2]
      ,[DeliveryService],[EmergencyServices] ,[AnsweringServiceOrMachine] ,[AlternativeLanguages] ,[SpecialtyServices] ,[ComputerSoftware]
      ,[Obra90]  ,[CounselingArea] ,[PatientMR] ,[DrugInformation] ,[FraudFelonyConviction] ,[FraudFelonyExplanation] ,[RxLicenseSuspendedOrRevoked]
      ,[SuspensionRevokationExplanation]  ,[UnrestrictedLicense]  ,[UnrestrictedLicenseExplanation] ,[InvestigatedByMedicareMedicaid]  ,[UAICoverage]
      ,[Judgements]  ,[CompliesWithADAAct] ,[AverageWaitTime] ,[MedicationErrorsDocumented] ,[ErrorCount12Months] ,[HasResolutionPolicy]
      ,[doesCompoundPrescriptions] ,[UnitDosing] ,[ProvidesDME],[ProvidesIV] ,[CertifiedDiseaseMgmt]  ,[CDMExplanation]  ,[GroupPresentations]
      ,[ContinuingEducationRequired]  ,[StoreSizeClassification]  ,[CopyReleaseInfo]  ,[DBA]  ,[Website] ,[Resigned]  ,aap.[ContactFirst]
      ,aap.[ContactLast] ,[ContactTitle] ,[WhyResigned]  ,[Created] ,[Modified] ,[RowVersion]
  FROM [AAP].[dbo].PharmacyMaster am
join (SELECT * FROM [AAP].dbo.[AAPAccount] )aap
ON am.aapaccountno = aap.aapid
GO
