USE [WebDev]
GO
/****** Object:  Table [dbo].[PharmacyInfoImport]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyInfoImport](
	[Action] [nvarchar](255) NULL,
	[Location Type] [nvarchar](255) NULL,
	[Effective Date] [nvarchar](255) NULL,
	[Legal Name] [nvarchar](255) NULL,
	[DBA] [nvarchar](255) NULL,
	[FEIN] [nvarchar](255) NULL,
	[Store Number] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Mailing Address] [nvarchar](255) NULL,
	[Mailing Address 2] [nvarchar](255) NULL,
	[Mailing City] [nvarchar](255) NULL,
	[Mailing State] [nvarchar](255) NULL,
	[Mailing Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Toll Free ] [nvarchar](255) NULL,
	[TTY/TDD                         ] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[URL] [nvarchar](255) NULL,
	[Authorized Contact] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Contact Phone] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[NCPDP1] [nvarchar](255) NULL,
	[Multiple NCPDP] [nvarchar](255) NULL,
	[NCPDP2] [nvarchar](255) NULL,
	[NCPDP3] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Expiration] [nvarchar](255) NULL,
	[State License] [nvarchar](255) NULL,
	[State License Expiration] [nvarchar](255) NULL,
	[Policy Insurer] [nvarchar](255) NULL,
	[Policy Number] [nvarchar](255) NULL,
	[Policy Expiration] [nvarchar](255) NULL,
	[Policy Limits] [nvarchar](255) NULL,
	[Medicaid ID1] [nvarchar](255) NULL,
	[Medicaid State1] [nvarchar](255) NULL,
	[Medicaid ID2] [nvarchar](255) NULL,
	[Medicaid State2] [nvarchar](255) NULL,
	[Medicaid ID3] [nvarchar](255) NULL,
	[Medicaid State3] [nvarchar](255) NULL,
	[24 Hrs] [nvarchar](255) NULL,
	[7 Days] [nvarchar](255) NULL,
	[Emergency] [nvarchar](255) NULL,
	[Emergency Phone] [nvarchar](255) NULL,
	[Drive Thru ] [nvarchar](255) NULL,
	[Delivery ] [nvarchar](255) NULL,
	[Delivery Charges] [nvarchar](255) NULL,
	[Clinic] [nvarchar](255) NULL,
	[Pressure] [nvarchar](255) NULL,
	[Written Consultation] [nvarchar](255) NULL,
	[Med Consultation] [nvarchar](255) NULL,
	[Compliance ] [nvarchar](255) NULL,
	[Disease] [nvarchar](255) NULL,
	[Infusion] [nvarchar](255) NULL,
	[Vision] [nvarchar](255) NULL,
	[Tobacco] [nvarchar](255) NULL,
	[Monday] [nvarchar](255) NULL,
	[Tuesday] [nvarchar](255) NULL,
	[Wednesday] [nvarchar](255) NULL,
	[Thursday] [nvarchar](255) NULL,
	[Friday] [nvarchar](255) NULL,
	[Saturday] [nvarchar](255) NULL,
	[Sunday] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[Printed] [nvarchar](255) NULL,
	[ASL] [nvarchar](255) NULL,
	[Braille] [nvarchar](255) NULL,
	[Translation] [nvarchar](255) NULL,
	[Dispense 340B] [nvarchar](255) NULL,
	[340B Owned] [nvarchar](255) NULL,
	[340B Contracted] [nvarchar](255) NULL,
	[Accessible] [nvarchar](255) NULL,
	[Distance] [nvarchar](255) NULL,
	[ADA] [nvarchar](255) NULL,
	[DME] [nvarchar](255) NULL,
	[DME Type] [nvarchar](255) NULL,
	[DMEPOS] [nvarchar](255) NULL,
	[VIPPS] [nvarchar](255) NULL,
	[Retail] [nvarchar](255) NULL,
	[Pharm Type] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[PCAB] [nvarchar](255) NULL,
	[ISMP] [nvarchar](255) NULL,
	[Errors] [nvarchar](255) NULL,
	[MedB] [nvarchar](255) NULL,
	[Assignment] [nvarchar](255) NULL,
	[MedD] [nvarchar](255) NULL,
	[Electronic Coordination] [nvarchar](255) NULL,
	[Long Term Care] [nvarchar](255) NULL,
	[Home Infusion] [nvarchar](255) NULL,
	[Update NCPDP] [nvarchar](255) NULL,
	[Ownership Type] [nvarchar](255) NULL,
	[Ownership Change] [nvarchar](255) NULL,
	[Owner Pharmacist] [nvarchar](255) NULL,
	[Good Standing] [nvarchar](255) NULL,
	[Denied] [nvarchar](255) NULL,
	[Criminal Offense] [nvarchar](255) NULL,
	[Excluded] [nvarchar](255) NULL
) ON [PRIMARY]
GO
