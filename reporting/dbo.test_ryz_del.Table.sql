USE [reporting]
GO
/****** Object:  Table [dbo].[test_ryz_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ryz_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](9) NULL,
	[Min Inv. Date] [datetime] NULL,
	[Max Inv.Date ] [datetime] NULL,
	[NDC 59011033430 Qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
