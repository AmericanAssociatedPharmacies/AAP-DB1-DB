USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_lindab_match]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_lindab_match](
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[Name] [varchar](65) NULL,
	[PM_DEA] [varchar](50) NULL,
	[GroupName] [varchar](255) NULL,
	[SubGroup] [varchar](255) NULL,
	[FPNGroupNo] [float] NULL,
	[FPNNo] [float] NULL,
	[AccountName] [varchar](255) NULL,
	[Deleted] [bit] NULL,
	[PharmacyName] [varchar](255) NULL,
	[Addr] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[St] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[NPI] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[DEA] [varchar](255) NULL
) ON [PRIMARY]
GO
