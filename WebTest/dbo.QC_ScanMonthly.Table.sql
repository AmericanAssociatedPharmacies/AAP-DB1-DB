USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_ScanMonthly]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_ScanMonthly](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScanFileId] [int] NULL,
	[NCPDP] [nvarchar](8) NULL,
	[NPI] [nvarchar](11) NULL,
	[PharmacyName] [nvarchar](51) NULL,
	[CorporateName] [nvarchar](51) NULL,
	[PatientID] [nvarchar](14) NULL,
	[PatientLastName] [nvarchar](36) NULL,
	[PatientFirstName] [nvarchar](26) NULL,
	[DOB] [nvarchar](20) NULL,
	[Phone] [nvarchar](11) NULL,
	[PlanName] [nvarchar](33) NULL,
	[CMSContractID] [nvarchar](60) NULL,
	[DateIdentifiedAdherence] [smalldatetime] NULL,
	[DiabetesMedication] [bit] NULL,
	[DiabetesPDC] [nvarchar](50) NULL,
	[HypertensionMedication] [bit] NULL,
	[HypertensionPDC] [nvarchar](50) NULL,
	[CholesterolMedication] [bit] NULL,
	[CholesterolPDC] [nvarchar](50) NULL,
	[HRMOppIntervent] [bit] NULL,
	[NumberHRM2PlusFillsDrug1] [int] NULL,
	[NumberHRM2PlusFillsDrug2] [int] NULL,
	[DiabetesOpportunity] [bit] NULL,
	[TotalNumberPatients] [int] NULL,
	[Weightage] [nvarchar](50) NULL,
	[TOTAL_PAT_NDC_CLMS] [nvarchar](50) NULL,
	[TOTAL_PAT_NABP_CLMS] [nvarchar](50) NULL,
	[HRM_NDC] [nvarchar](50) NULL,
 CONSTRAINT [PK_QC_ScanMonthly] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
