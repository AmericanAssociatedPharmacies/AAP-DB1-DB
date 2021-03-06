USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_test2]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test2](
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[AAP Eff. Date] [datetime] NULL,
	[AAP Quit Date] [datetime] NULL,
	[API#] [varchar](20) NULL,
	[ChainCode] [varchar](20) NULL,
	[Account Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[TM] [varchar](10) NULL,
	[DEA] [varchar](20) NULL,
	[Affiliate] [varchar](200) NULL,
	[BC] [varchar](10) NULL,
	[Period] [varchar](10) NULL,
	[CH Gen Src] [float] NULL,
	[CH Gen Exc] [float] NULL,
	[CH Gen Total] [float] NULL,
	[CH Brand] [float] NULL,
	[CH Other] [float] NULL,
	[CH Total RX] [money] NULL,
	[CH Excluded from Total RX] [money] NULL,
	[CH NonRX - OTC&HH] [money] NULL,
	[CH Source Compliance] [decimal](18, 4) NULL,
	[CH Bashas] [float] NULL,
	[CH Total] [float] NULL,
	[API Gen] [float] NULL,
	[API Br] [float] NULL,
	[API OTC] [float] NULL,
	[API Total] [float] NULL,
	[ML Total] [float] NULL,
	[Anda Total] [float] NULL,
	[All Total] [float] NULL
) ON [PRIMARY]
GO
