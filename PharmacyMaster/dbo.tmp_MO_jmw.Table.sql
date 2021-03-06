USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_MO_jmw]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_jmw](
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
	[Status] [varchar](20) NULL,
	[Wholesaler] [varchar](10) NULL,
	[API Sept 10 Generic Sales] [float] NULL,
	[API Sept 10 Brand Sales] [float] NULL,
	[API Sept 10 OTC Sales] [float] NULL,
	[API Sept 10 Total Sales] [float] NULL,
	[CAH Sept 10 Total Sales] [float] NULL,
	[ML Sept 10 Total Sales] [float] NULL
) ON [PRIMARY]
GO
