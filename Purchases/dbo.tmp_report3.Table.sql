USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_report3]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report3](
	[inputNDC] [varchar](11) NULL,
	[total_ship_qty] [numeric](38, 0) NULL,
	[total_ext_cost] [float] NULL,
	[total_corp_awp] [float] NULL,
	[total_wac] [float] NULL,
	[NDC] [varchar](11) NULL,
	[NDCtype] [varchar](5) NULL,
	[GCN_SEQNO] [numeric](6, 0) NULL,
	[GCN] [numeric](5, 0) NULL,
	[type] [varchar](3) NULL,
	[label] [varchar](60) NULL,
	[Standard_TC] [varchar](50) NULL,
	[strength] [varchar](10) NULL,
	[PkgDesc] [varchar](10) NULL,
	[DrugForm] [varchar](12) NULL,
	[PkgSize] [numeric](11, 3) NULL,
	[MFG] [varchar](15) NULL,
	[DEA] [varchar](1) NULL,
	[obsolete_date] [datetime] NULL,
	[RxOTC] [varchar](3) NULL,
	[repack] [varchar](6) NULL,
	[fdb_awp_unit] [float] NULL,
	[fdb_awp_pkg] [float] NULL,
	[fdb_wac_unit] [float] NULL,
	[fdb_wac_pkg] [float] NULL
) ON [PRIMARY]
GO
