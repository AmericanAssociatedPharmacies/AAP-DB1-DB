USE [WebDev]
GO
/****** Object:  Table [dbo].[CGAttestations]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CGAttestations](
	[CGAttestationID] [int] IDENTITY(1,1) NOT NULL,
	[PharmacyNotExcluded] [bit] NOT NULL,
	[PersonnelNotExcluded] [bit] NOT NULL,
	[RecordRetention10yr] [bit] NOT NULL,
	[FWATraining] [bit] NOT NULL,
	[LogPersonnelFWATraining] [bit] NOT NULL,
	[PharmacyMaintainsLicensesInsurance] [bit] NOT NULL,
	[PersonnelMaintainsLicensesCertifications] [bit] NOT NULL,
	[StandardsOfConductInWriting] [bit] NOT NULL,
	[DesignatedComplianceOfficer] [bit] NOT NULL,
	[ProceduresToDetectFWA] [bit] NOT NULL,
	[NCPDP] [nvarchar](50) NOT NULL,
	[NPI] [nvarchar](20) NOT NULL,
	[Attestor] [nvarchar](255) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ComplianceOfficer] [nvarchar](255) NOT NULL,
	[PharmacyName] [nvarchar](255) NOT NULL,
	[pmid] [int] NOT NULL,
	[email] [nvarchar](255) NULL,
 CONSTRAINT [PK_CGAttestations] PRIMARY KEY CLUSTERED 
(
	[CGAttestationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
