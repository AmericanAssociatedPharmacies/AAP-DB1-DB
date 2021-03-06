USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_Qtr_Comm_jmw]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Qtr_Comm_jmw](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API Warehouse#] [varchar](20) NULL,
	[AAP Eff] [varchar](10) NULL,
	[AAP Quit] [varchar](10) NULL,
	[Description] [varchar](100) NULL,
	[Affiliate] [varchar](200) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[Whse Acct Date Opened] [varchar](10) NULL,
	[Status] [varchar](20) NULL,
	[Wholesaler] [varchar](10) NULL,
	[API Q3 Brand Sales] [float] NULL,
	[API Q3 Generic Sales] [float] NULL,
	[API Q3 OTC Sales] [float] NULL,
	[API Q3 Total Sales] [float] NULL,
	[CAH Q3 Total Sales] [float] NULL,
	[ML Q3 Total Sales] [float] NULL
) ON [PRIMARY]
GO
