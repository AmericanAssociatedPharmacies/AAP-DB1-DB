USE [WebTest]
GO
/****** Object:  Table [dbo].[CVSOutputStatus]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSOutputStatus](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[Phone] [varchar](50) NULL,
	[NCPDP] [varchar](20) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[territory] [varchar](4) NULL,
	[TM_Name] [varchar](71) NULL,
	[TM_Contact] [varchar](25) NULL,
	[MCEffectivedate] [varchar](30) NULL,
	[MCQuitdate] [varchar](30) NULL,
	[isMCnotNPP] [int] NOT NULL,
	[Need Credentialing] [varchar](3) NOT NULL,
	[Status] [varchar](1) NOT NULL,
	[StatusUpdateOn] [datetime] NULL,
	[UDorNewAffiliate] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
