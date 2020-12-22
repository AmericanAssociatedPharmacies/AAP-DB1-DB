USE [TempTables]
GO
/****** Object:  Table [dbo].[RLGLtemp_price1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_price1](
	[NDC] [nvarchar](50) NULL,
	[yr] [int] NULL,
	[mo] [int] NULL,
	[CHMaxUnit] [numeric](38, 4) NULL,
	[APIMaxPriceUnit] [numeric](38, 4) NULL,
	[APIMaxNetUnit] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
