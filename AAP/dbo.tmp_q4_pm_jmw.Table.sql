USE [AAP]
GO
/****** Object:  Table [dbo].[tmp_q4_pm_jmw]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_q4_pm_jmw](
	[acct_no] [varchar](5) NULL,
	[october] [numeric](38, 2) NULL,
	[november] [numeric](38, 2) NULL,
	[december] [numeric](38, 2) NULL,
	[total] [numeric](38, 2) NULL,
	[Territory] [varchar](5) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](10) NULL,
	[Effective] [varchar](12) NULL
) ON [PRIMARY]
GO
