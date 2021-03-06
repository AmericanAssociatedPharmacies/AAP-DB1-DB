USE [reporting]
GO
/****** Object:  Table [dbo].[AAPGenerics112910]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPGenerics112910](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Color] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[CIN] [nvarchar](255) NULL,
	[DP] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[GCN] [nvarchar](255) NULL,
	[GCN_SEQNO] [nvarchar](255) NULL
) ON [PRIMARY]
GO
