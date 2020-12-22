USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_API_PM_APIAccounts_Add]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_PM_APIAccounts_Add](
	[AccountNo] [varchar](20) NULL,
	[PMID] [int] NULL,
	[DEA] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](32) NULL
) ON [PRIMARY]
GO
