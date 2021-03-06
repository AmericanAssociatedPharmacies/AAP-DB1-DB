USE [reporting]
GO
/****** Object:  Table [dbo].[WSPriceAll_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSPriceAll_del](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WSPriceAll_del] ADD  CONSTRAINT [DF_CAHPriceAll_Wholesaler]  DEFAULT ((1)) FOR [Wholesaler]
GO
