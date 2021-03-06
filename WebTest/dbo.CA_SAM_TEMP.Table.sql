USE [WebTest]
GO
/****** Object:  Table [dbo].[CA_SAM_TEMP]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_SAM_TEMP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
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
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CAGE] [nvarchar](256) NULL,
	[NPI] [nvarchar](64) NULL,
 CONSTRAINT [PK_CA_SAM_TEMP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CA_SAM_TEMP] ADD  CONSTRAINT [DF_CA_SAM_TEMP_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_SAM_TEMP] ADD  CONSTRAINT [DF_CA_SAM_TEMP_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
