USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_PeachTreePP]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PeachTreePP](
	[Period] [varchar](6) NOT NULL,
	[ID] [int] NOT NULL,
	[NCPDP] [varchar](20) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[PMID] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Eligibility] [int] NULL,
	[Affiliate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
