USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_Comm_OneOff_jmw]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Comm_OneOff_jmw](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API Warehouse#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](100) NULL,
	[Affiliate] [varchar](200) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[Whse Acct Date Opened] [datetime] NULL,
	[API Status] [varchar](20) NULL,
	[Wholesaler] [varchar](10) NULL,
	[API Jan 16 Brand Sales] [float] NULL,
	[API Jan 16 Generic Sales] [float] NULL,
	[API Jan 16 OTC Sales] [float] NULL,
	[API Jan 16 Total Sales] [float] NULL,
	[CAH Jan 16 Sales] [float] NULL,
	[ML Jan 16 Sales] [float] NULL
) ON [PRIMARY]
GO
