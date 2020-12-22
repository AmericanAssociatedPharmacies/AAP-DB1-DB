USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_compare_wac]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_compare_wac](
	[gcn] [numeric](5, 0) NULL,
	[tmp_UnitPrice] [numeric](38, 14) NULL,
	[tmp_TotalWAC] [numeric](28, 4) NULL,
	[CARDPrice] [numeric](18, 4) NULL,
	[CARDTotalWAC] [numeric](29, 4) NULL
) ON [PRIMARY]
GO
