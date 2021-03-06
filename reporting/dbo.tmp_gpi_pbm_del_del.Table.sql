USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_gpi_pbm_del_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gpi_pbm_del_del](
	[count] [int] NULL,
	[avg_price_per_unit] [numeric](38, 6) NULL,
	[min_price_per_unit] [numeric](18, 4) NULL,
	[gpi] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
