USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_CompareNonMC_orig]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareNonMC_orig](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[ncpdp] [varchar](20) NULL,
	[fedid] [varchar](12) NULL
) ON [PRIMARY]
GO
