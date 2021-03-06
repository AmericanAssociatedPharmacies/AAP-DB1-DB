USE [reporting]
GO
/****** Object:  Table [dbo].[AAPProductDetail_April2016]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPProductDetail_April2016](
	[Corporate Item Number] [float] NULL,
	[Corporate Description] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Strength] [nvarchar](255) NULL,
	[Size Txt] [nvarchar](255) NULL,
	[ExtPrice] [money] NULL,
	[Ship Qty] [float] NULL,
	[Price] [money] NULL
) ON [PRIMARY]
GO
