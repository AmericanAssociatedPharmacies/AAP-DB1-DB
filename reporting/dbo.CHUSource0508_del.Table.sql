USE [reporting]
GO
/****** Object:  Table [dbo].[CHUSource0508_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUSource0508_del](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[SellPrice] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NULL,
	[DP] [varchar](15) NULL,
	[UnitPrice] [float] NULL
) ON [PRIMARY]
GO
