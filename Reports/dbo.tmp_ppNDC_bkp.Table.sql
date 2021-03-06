USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ppNDC_bkp]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ppNDC_bkp](
	[Change Type] [nvarchar](255) NULL,
	[General Description] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[UM] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[NDC] [nvarchar](100) NULL,
	[CIN] [float] NULL,
	[DP] [float] NULL,
	[Old Price] [numeric](18, 6) NULL,
	[New Price] [numeric](18, 6) NULL,
	[WAC] [numeric](18, 6) NULL,
	[F12] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Reason Code] [nvarchar](255) NULL,
	[Effect Dte] [datetime] NULL,
	[UOM] [nvarchar](255) NULL,
	[Usage] [float] NULL,
	[GCN] [nvarchar](255) NULL,
	[Size] [nvarchar](50) NULL,
	[Old PPU] [numeric](18, 6) NULL,
	[New PPU] [numeric](18, 6) NULL,
	[Loaddate] [smalldatetime] NULL,
	[WS] [int] NULL,
	[20Percent] [nvarchar](50) NULL
) ON [PRIMARY]
GO
