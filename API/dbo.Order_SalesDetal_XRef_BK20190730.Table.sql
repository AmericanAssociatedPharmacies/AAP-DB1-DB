USE [API]
GO
/****** Object:  Table [dbo].[Order_SalesDetal_XRef_BK20190730]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_SalesDetal_XRef_BK20190730](
	[SalesDetailID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
