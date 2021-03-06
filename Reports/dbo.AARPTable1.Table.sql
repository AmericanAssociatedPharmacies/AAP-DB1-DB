USE [Reports]
GO
/****** Object:  Table [dbo].[AARPTable1]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AARPTable1](
	[Drug] [nvarchar](255) NULL,
	[Qty HyVee] [float] NULL,
	[Price HyVee] [float] NULL,
	[Qty Hannaford] [float] NULL,
	[Price Hannaford] [float] NULL,
	[Qty Stop & Shop] [float] NULL,
	[Price Stop & Shop] [float] NULL,
	[Qty Target] [float] NULL,
	[Price Target] [float] NULL,
	[Qty Kroger] [float] NULL,
	[Price Kroger] [float] NULL,
	[Qty Publix] [float] NULL,
	[Price Publix] [float] NULL,
	[Qty H.E.B.] [float] NULL,
	[Price H.E.B.] [float] NULL,
	[Qty Wegmanns] [float] NULL,
	[Price Wegmanns] [float] NULL,
	[Qty Safeway] [float] NULL,
	[Price Safeway] [float] NULL,
	[Qty Walgreens] [float] NULL,
	[Price Walgreens] [float] NULL
) ON [PRIMARY]
GO
