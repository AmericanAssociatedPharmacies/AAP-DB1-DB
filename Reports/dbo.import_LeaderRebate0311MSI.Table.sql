USE [Reports]
GO
/****** Object:  Table [dbo].[import_LeaderRebate0311MSI]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_LeaderRebate0311MSI](
	[DC] [float] NULL,
	[Cust #] [float] NULL,
	[PMID] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[MSI] [nvarchar](255) NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Mar 11 $] [money] NULL,
	[Mar Affiliation] [nvarchar](255) NULL,
	[LeaderNET] [nvarchar](255) NULL,
	[Recon] [nvarchar](255) NULL,
	[RoadMap] [float] NULL,
	[RCS] [nvarchar](255) NULL,
	[CIM] [float] NULL,
	[LSM] [float] NULL,
	[SCC HHC] [nvarchar](255) NULL,
	[SCC Diabetes] [nvarchar](255) NULL,
	[SCC IMZ] [float] NULL,
	[PAE] [nvarchar](255) NULL,
	[Mar Rebate $] [money] NULL,
	[Feb 11 $] [money] NULL,
	[Feb Affiliation] [nvarchar](255) NULL,
	[LeaderNET1] [nvarchar](255) NULL,
	[Recon1] [nvarchar](255) NULL,
	[RoadMap1] [nvarchar](255) NULL,
	[RCS1] [nvarchar](255) NULL,
	[CIM1] [float] NULL,
	[LSM1] [float] NULL,
	[SCC HHC1] [nvarchar](255) NULL,
	[SCC Diabetes1] [nvarchar](255) NULL,
	[SCC IMZ1] [nvarchar](255) NULL,
	[PAE1] [float] NULL,
	[Feb Rebate $] [money] NULL,
	[Jan 11 $] [money] NULL,
	[Jan Affiliation] [nvarchar](255) NULL,
	[LeaderNET2] [nvarchar](255) NULL,
	[Recon2] [nvarchar](255) NULL,
	[RoadMap2] [nvarchar](255) NULL,
	[RCS2] [nvarchar](255) NULL,
	[CIM2] [float] NULL,
	[LSM2] [float] NULL,
	[SCC HHC2] [nvarchar](255) NULL,
	[SCC Diabetes2] [nvarchar](255) NULL,
	[SCC IMZ2] [nvarchar](255) NULL,
	[PAE2] [float] NULL,
	[Jan Rebate $] [money] NULL,
	[TOTAL REBATE] [money] NULL
) ON [PRIMARY]
GO
