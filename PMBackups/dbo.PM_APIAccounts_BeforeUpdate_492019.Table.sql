USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_APIAccounts_BeforeUpdate_492019]    Script Date: 12/22/2020 4:47:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_APIAccounts_BeforeUpdate_492019](
	[APIAccountNo] [varchar](20) NOT NULL,
	[PMID] [int] NULL,
	[DEA] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](32) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
