USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_lindab_nomatch]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_lindab_nomatch](
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
