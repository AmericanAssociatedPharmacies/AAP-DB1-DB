USE [reporting]
GO
/****** Object:  Table [dbo].[GMPrice]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMPrice](
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
ALTER TABLE [dbo].[GMPrice] ADD  CONSTRAINT [GMDF_CAHPrice_Wholesaler]  DEFAULT ((1)) FOR [Wholesaler]
GO
