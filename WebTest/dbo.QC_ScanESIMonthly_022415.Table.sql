USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_ScanESIMonthly_022415]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_ScanESIMonthly_022415](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScanFileId] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](8) NULL,
	[NPI] [nvarchar](11) NULL,
	[PharmacyName] [nvarchar](51) NULL,
	[CorporateName] [nvarchar](51) NULL,
	[ClientEsiId] [nvarchar](50) NULL,
	[PatientId] [nvarchar](14) NULL,
	[PatientLName] [nvarchar](36) NULL,
	[PatientFName] [nvarchar](26) NULL,
	[DOB] [nvarchar](20) NULL,
	[Phone] [nvarchar](11) NULL,
	[PlanName] [nvarchar](33) NULL,
	[CMSContractId] [nvarchar](60) NULL,
	[DateFirstFillDiabetes] [nvarchar](50) NULL,
	[DateFirstFillHypertension] [nvarchar](50) NULL,
	[DateFirstFillCholesterol] [nvarchar](50) NULL,
	[DiabetesOpportunity] [bit] NULL,
	[DiabetesPDC] [nvarchar](50) NULL,
	[HypertensionOpportunity] [bit] NULL,
	[HypertensionPDC] [nvarchar](50) NULL,
	[CholesterolOpportunity] [bit] NULL,
	[CholesterolPDC] [nvarchar](50) NULL,
	[HrmOpportunity] [bit] NULL,
	[Drug1Name] [nvarchar](50) NULL,
	[Drug1NumberHRM2Fills] [int] NULL,
	[Drug2Name] [nvarchar](50) NULL,
	[Drug2NumberHRM2Fills] [int] NULL,
	[Drug3Name] [nvarchar](50) NULL,
	[Drug3NumberHRM2Fills] [int] NULL,
	[Drug4Name] [nvarchar](50) NULL,
	[Drug4NumberHRM2Fills] [int] NULL,
	[Drug5Name] [nvarchar](50) NULL,
	[Drug5NumberHRM2Fills] [int] NULL,
	[Drug6Name] [nvarchar](50) NULL,
	[Drug6NumberHRM2Fills] [int] NULL,
	[DiabetesOpportunityTreatment] [bit] NULL,
	[IsValid] [bit] NULL,
	[filedate] [datetime] NULL,
	[EsiRawTxt] [nvarchar](max) NULL,
	[ParseErrors] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
