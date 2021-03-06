USE [WebDev]
GO
/****** Object:  Table [dbo].[OwnershipControlImport]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControlImport](
	[Location Type] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Effective Date] [nvarchar](255) NULL,
	[% Ownership] [nvarchar](255) NULL,
	[Pharmacist's License] [nvarchar](255) NULL,
	[Expiration Date] [nvarchar](255) NULL,
	[Entity] [nvarchar](255) NULL,
	[Entity's DBA] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Middle Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[SSN] [nvarchar](255) NULL,
	[FEIN] [nvarchar](255) NULL,
	[DOB] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Reserved21] [nvarchar](255) NULL,
	[Criminal Offense] [nvarchar](255) NULL,
	[Reserved23] [nvarchar](255) NULL,
	[Other Ownership] [nvarchar](255) NULL,
	[Relation] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
