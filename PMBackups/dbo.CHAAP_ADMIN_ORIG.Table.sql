USE [PMBackups]
GO
/****** Object:  Table [dbo].[CHAAP_ADMIN_ORIG]    Script Date: 12/22/2020 4:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_ADMIN_ORIG](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENExcl] [float] NULL,
	[GENTotal] [float] NULL,
	[Brand] [float] NULL,
	[Extended] [float] NULL,
	[VolAdminFee] [float] NULL
) ON [PRIMARY]
GO
