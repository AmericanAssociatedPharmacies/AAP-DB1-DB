USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_Cred_test]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_Cred_test](
	[PK_Cred] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[StateLicNo] [varchar](30) NULL,
	[StateMedicaidNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo2] [varchar](15) NULL,
	[StateMedicaidNo2] [varchar](15) NULL,
	[StateLicExpDate2] [datetime] NULL,
	[GenLiabCarrier] [varchar](50) NULL,
	[GenLiabPolicyNumber] [varchar](20) NULL,
	[GenLiabilityLimit1] [int] NULL,
	[GenLiabilityLimit2] [int] NULL,
	[GenInsExpDate] [datetime] NULL,
	[ProfLiabCarrier] [varchar](50) NULL,
	[ProfLiabInsExpDate] [datetime] NULL,
	[ProfPolicyNumber] [varchar](20) NULL,
	[ProfLiabLimit1] [int] NULL,
	[ProfLiabLimit2] [int] NULL,
	[DeliveryService] [smallint] NULL,
	[EmergencyServices] [smallint] NULL,
	[AnsweringServiceOrMachine] [smallint] NULL,
	[AlternativeLanguages] [varchar](50) NULL,
	[SpecialtyServices] [varchar](50) NULL,
	[Obra90] [smallint] NULL,
	[CounselingArea] [smallint] NULL,
	[PatientMR] [smallint] NULL,
	[DrugInformation] [smallint] NULL,
	[FraudFelonyConviction] [smallint] NULL,
	[FraudFelonyExplanation] [varchar](150) NULL,
	[RxLicenseSuspendedOrRevoked] [smallint] NULL,
	[SuspensionRevokationExplanation] [varchar](150) NULL,
	[UnrestrictedLicense] [smallint] NULL,
	[UnrestrictedLicenseExplanation] [varchar](150) NULL,
	[InvestigatedByMedicareMedicaid] [smallint] NULL,
	[UAICoverage] [smallint] NULL,
	[Judgements] [smallint] NULL,
	[CompliesWithADAAct] [smallint] NULL,
	[AverageWaitTime] [int] NULL,
	[MedicationErrorsDocumented] [smallint] NULL,
	[ErrorCount12Months] [smallint] NULL,
	[HasResolutionPolicy] [smallint] NULL,
	[doesCompoundPrescriptions] [smallint] NULL,
	[UnitDosing] [smallint] NULL,
	[ProvidesDME] [smallint] NULL,
	[ProvidesIV] [smallint] NULL,
	[CertifiedDiseaseMgmt] [smallint] NULL,
	[CDMExplanation] [varchar](150) NULL,
	[GroupPresentations] [smallint] NULL,
	[ContinuingEducationRequired] [smallint] NULL,
	[StoreSizeClassification] [varchar](1) NULL,
	[CopyReleaseInfo] [smallint] NULL,
	[InvestigatedByMedicareMedicaidExplanation] [varchar](150) NULL,
	[JudgementsExplanation] [varchar](150) NULL,
 CONSTRAINT [PK_PM_Cred] PRIMARY KEY CLUSTERED 
(
	[PK_Cred] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tmp_PM_Cred_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_Cred_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tmp_PM_Cred_test] CHECK CONSTRAINT [FK_PM_Cred_PM_Pharmacy]
GO
