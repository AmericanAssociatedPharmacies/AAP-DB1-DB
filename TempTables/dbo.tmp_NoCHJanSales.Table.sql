USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_NoCHJanSales]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NoCHJanSales](
	[aap#] [varchar](255) NULL,
	[jantotalpvasales] [numeric](18, 2) NULL,
	[Total] [float] NULL,
	[cardinalno] [varchar](31) NULL
) ON [PRIMARY]
GO
