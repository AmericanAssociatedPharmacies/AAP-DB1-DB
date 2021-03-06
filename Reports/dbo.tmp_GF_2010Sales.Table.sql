USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_GF_2010Sales]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GF_2010Sales](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](10) NULL,
	[API Acct Eff] [varchar](10) NULL,
	[API Status] [varchar](100) NULL,
	[AAP Quit] [varchar](10) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](200) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[CAH Feb AAP Total Sales] [float] NULL,
	[CAH Mar AAP Total Sales] [float] NULL,
	[CAH Apr AAP Total Sales] [float] NULL,
	[CAH May AAP Total Sales] [float] NULL,
	[CAH Jun AAP Total Sales] [float] NULL,
	[CAH Jul AAP Total Sales] [float] NULL,
	[CAH Aug AAP Total Sales] [float] NULL,
	[CAH Sep AAP Total Sales] [float] NULL,
	[CAH Oct AAP Total Sales] [float] NULL,
	[CAH Nov AAP Total Sales] [float] NULL,
	[2010 Total PVA Sales] [float] NULL,
	[API Jan 10 Total Whse] [float] NULL,
	[API Feb 10 Total Whse] [float] NULL,
	[API Mar 10 Total Whse] [float] NULL,
	[API Apr 10 Total Whse] [float] NULL,
	[API May 10 Total Whse] [float] NULL,
	[API Jun 10 Total Whse] [float] NULL,
	[API Jul 10 Total Whse] [float] NULL,
	[API Aug 10 Total Whse] [float] NULL,
	[API Sep 10 Total Whse] [float] NULL,
	[API Oct 10 Total Whse] [float] NULL,
	[API Nov 10 Total Whse] [float] NULL,
	[API Dec 10 Total Whse] [float] NULL,
	[2010 Total API Whse Sales] [float] NULL
) ON [PRIMARY]
GO
