USE [API]
GO
/****** Object:  Table [dbo].[tmp_API_Sales_ByWeek]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Sales_ByWeek](
	[WHAccountID] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[AccountName] [varchar](65) NULL,
	[Brand] [numeric](38, 2) NULL,
	[Generic] [numeric](38, 2) NULL,
	[OTC] [numeric](38, 2) NULL,
	[Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
