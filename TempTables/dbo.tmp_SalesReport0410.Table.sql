USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_SalesReport0410]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SalesReport0410](
	[pmid] [nvarchar](255) NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[account name] [nvarchar](255) NULL,
	[Corpname] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contact] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[SourceSales] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[territory] [varchar](4) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
