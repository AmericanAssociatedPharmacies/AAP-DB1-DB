USE [Purchases]
GO
/****** Object:  Table [dbo].[CHTop100All]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHTop100All](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL
) ON [PRIMARY]
GO
