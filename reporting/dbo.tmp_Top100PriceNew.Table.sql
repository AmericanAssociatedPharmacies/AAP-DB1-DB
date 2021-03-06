USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_Top100PriceNew]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Top100PriceNew](
	[CIN] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[ PSB Sell ] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[UOM] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 6) NULL,
	[GPI] [nvarchar](50) NULL,
	[GCN] [nvarchar](50) NULL,
	[GCNSEQ] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL
) ON [PRIMARY]
GO
