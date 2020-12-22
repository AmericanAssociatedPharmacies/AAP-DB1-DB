USE [reporting]
GO
/****** Object:  Table [dbo].[Destination - AAPGenerics102510]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination - AAPGenerics102510](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[AAP Top Generics Sell Price] [money] NULL,
	[AAP Top Generics Price Per Unit] [money] NULL,
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
