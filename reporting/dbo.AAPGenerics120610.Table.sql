USE [reporting]
GO
/****** Object:  Table [dbo].[AAPGenerics120610]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPGenerics120610](
	[Description] [varchar](255) NULL,
	[Size] [varchar](255) NULL,
	[Supplier] [varchar](255) NULL,
	[AWP] [smallmoney] NULL,
	[Top100Price] [float] NULL,
	[PricePerUnit] [float] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](255) NULL,
	[Color] [varchar](255) NULL,
	[NDC] [varchar](30) NULL,
	[CIN] [varchar](10) NULL,
	[DP] [varchar](10) NULL,
	[GPI] [varchar](255) NULL,
	[GCN] [varchar](255) NULL,
	[GCN_SEQNO] [varchar](255) NULL
) ON [PRIMARY]
GO
