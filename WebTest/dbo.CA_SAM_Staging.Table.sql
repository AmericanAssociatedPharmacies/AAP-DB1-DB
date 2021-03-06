USE [WebTest]
GO
/****** Object:  Table [dbo].[CA_SAM_Staging]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_SAM_Staging](
	[Classification] [nvarchar](64) NULL,
	[Name] [nvarchar](max) NULL,
	[Prefix] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[Suffix] [nvarchar](64) NULL,
	[Address1] [nvarchar](256) NULL,
	[Address2] [nvarchar](256) NULL,
	[Address3] [nvarchar](256) NULL,
	[Address4] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[StateOrProvince] [nvarchar](128) NULL,
	[Country] [nvarchar](64) NULL,
	[ZipCode] [nvarchar](64) NULL,
	[DUNS] [nvarchar](64) NULL,
	[ExclusionProgram] [nvarchar](64) NULL,
	[ExcludingAgency] [nvarchar](64) NULL,
	[CTCode] [nvarchar](64) NULL,
	[ExclusionType] [nvarchar](64) NULL,
	[AdditionalComments] [nvarchar](max) NULL,
	[ActiveDate] [nvarchar](64) NULL,
	[TerminationDate] [nvarchar](64) NULL,
	[RecordStatus] [nvarchar](64) NULL,
	[CrossReference] [nvarchar](max) NULL,
	[SAMNumber] [nvarchar](64) NULL,
	[CAGE] [varchar](256) NULL,
	[NPI] [nvarchar](64) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
