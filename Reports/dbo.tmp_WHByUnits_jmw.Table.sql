USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_WHByUnits_jmw]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WHByUnits_jmw](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[API Acct Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[API Status] [varchar](20) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](200) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[GRx Units 09-10] [int] NULL,
	[GRx $ 09-10] [float] NULL,
	[BRx Units 09-10] [int] NULL,
	[BRx $ 09-10] [float] NULL,
	[OTC Units 09-10] [int] NULL,
	[OTC $ 09-10] [float] NULL,
	[GRx Units 10-10] [int] NULL,
	[GRx $ 10-10] [float] NULL,
	[BRx Units 10-10] [int] NULL,
	[BRx $ 10-10] [float] NULL,
	[OTC Units 10-10] [int] NULL,
	[OTC $ 10-10] [float] NULL,
	[GRx Units 11-10] [int] NULL,
	[GRx $ 11-10] [float] NULL,
	[BRx Units 11-10] [int] NULL,
	[BRx $ 11-10] [float] NULL,
	[OTC Units 11-10] [int] NULL,
	[OTC $ 11-10] [float] NULL
) ON [PRIMARY]
GO
