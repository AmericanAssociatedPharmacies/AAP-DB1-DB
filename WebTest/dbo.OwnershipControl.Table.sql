USE [WebTest]
GO
/****** Object:  Table [dbo].[OwnershipControl]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControl](
	[PMID] [int] NULL,
	[CID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Title] [nvarchar](max) NULL,
	[Effective Date] [nvarchar](max) NULL,
	[% Ownership] [float] NULL,
	[Pharmacist's License] [nvarchar](max) NULL,
	[Expiration Date] [nvarchar](max) NULL,
	[Entity] [nvarchar](max) NULL,
	[Entity's DBA] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL,
	[SSN] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Reserved21] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Reserved23] [nvarchar](max) NULL,
	[Other Ownership] [nvarchar](max) NULL,
	[Relation] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
