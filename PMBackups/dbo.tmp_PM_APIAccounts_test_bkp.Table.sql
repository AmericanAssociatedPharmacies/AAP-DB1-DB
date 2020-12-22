USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_APIAccounts_test_bkp]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_APIAccounts_test_bkp](
	[APIAccountNo] [varchar](20) NOT NULL,
	[PMID] [int] NULL,
	[DEA] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](32) NULL
) ON [PRIMARY]
GO
