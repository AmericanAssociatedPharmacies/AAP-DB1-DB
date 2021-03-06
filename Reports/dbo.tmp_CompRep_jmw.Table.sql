USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CompRep_jmw]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompRep_jmw](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](25) NULL,
	[API Acct Eff] [varchar](25) NULL,
	[AAP Quit] [varchar](25) NULL,
	[API Status] [varchar](20) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](200) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[MC Chain Code] [varchar](20) NULL,
	[PVA] [varchar](20) NULL,
	[CAH 08-20] [float] NULL,
	[CAH 09-20] [float] NULL,
	[CAH 10-20] [float] NULL,
	[CAH 11-20] [float] NULL,
	[CAH Total Sales ] [numeric](18, 2) NULL,
	[ML 08-20] [float] NULL,
	[ML 09-20] [float] NULL,
	[ML 10-20] [float] NULL,
	[ML 11-20] [float] NULL,
	[ML Total Sales] [numeric](18, 2) NULL,
	[API 08-20] [float] NULL,
	[API 09-20] [float] NULL,
	[API 10-20] [float] NULL,
	[API 11-20] [float] NULL,
	[API Total Sales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
