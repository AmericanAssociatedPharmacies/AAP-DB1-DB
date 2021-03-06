USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_AppendixAList]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AppendixAList](
	[mfg] [nvarchar](100) NULL,
	[andc] [nvarchar](15) NULL,
	[aname] [nvarchar](100) NULL,
	[ndc] [varchar](11) NULL,
	[gcn_seqno] [numeric](6, 0) NULL,
	[gcn] [numeric](5, 0) NULL,
	[GPI] [varchar](14) NULL,
	[CIN] [varchar](15) NULL,
	[type] [varchar](3) NULL,
	[name] [varchar](60) NULL,
	[strength] [varchar](60) NULL,
	[psize] [numeric](11, 3) NULL,
	[DEA] [varchar](1) NULL,
	[HCFA] [char](1) NULL,
	[USUnit] [float] NULL,
	[USPkg] [money] NULL,
	[Top100pkg] [money] NULL,
	[awp_unit] [float] NULL,
	[awp_pkg] [float] NULL,
	[wac_unit] [float] NULL,
	[wac_pkg] [float] NULL,
	[ful] [float] NULL
) ON [PRIMARY]
GO
