USE [WebTest]
GO
/****** Object:  Table [dbo].[Attestation]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attestation](
	[PMID] [int] NOT NULL,
	[AttestationForYear] [int] NOT NULL,
	[HasFlag] [varchar](1) NOT NULL,
	[Licenses suspended] [nvarchar](500) NULL,
	[Operate on Clear status] [nvarchar](500) NULL,
	[Licenses suspended in past] [nvarchar](500) NULL,
	[Disciplinary action] [nvarchar](500) NULL,
	[Pharmacist not covered Insurance] [nvarchar](500) NULL,
	[Pharmacists unrestricted license] [nvarchar](500) NULL,
	[PharmacyNotExcluded] [nvarchar](500) NULL,
	[PersonnelNotExcluded] [nvarchar](500) NULL,
	[Review Personnel on OIG GSA] [nvarchar](500) NULL,
	[Disclosure of disciplinary actions] [nvarchar](500) NULL,
	[RecordRetention10yr] [nvarchar](500) NULL,
	[FWATraining] [nvarchar](500) NULL,
	[LogPersonnelFWATraining] [nvarchar](500) NULL,
	[PharmacyMaintainsLicensesInsurance] [nvarchar](500) NULL,
	[PersonnelMaintainsLicensesCertifications] [nvarchar](500) NULL,
	[StandardsOfConductInWriting] [nvarchar](500) NULL,
	[Conflict of Interest Policy] [nvarchar](500) NULL,
	[DesignatedComplianceOfficer] [nvarchar](500) NULL,
	[ProceduresToDetectFWA] [nvarchar](500) NULL,
	[OBRA 90 rules compliance] [nvarchar](500) NULL,
	[NCPDP] [nvarchar](500) NULL,
	[Pharmacy Name] [nvarchar](500) NULL,
	[NPI] [nvarchar](500) NULL,
	[Person Attesting] [nvarchar](500) NULL,
	[Compliance Officer name] [nvarchar](500) NULL,
	[Attestation Date] [nvarchar](500) NULL,
 CONSTRAINT [PK_Attestation] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[AttestationForYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
