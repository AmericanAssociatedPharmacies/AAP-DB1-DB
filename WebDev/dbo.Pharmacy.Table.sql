USE [WebDev]
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL,
	[Delivery Charges2] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
