USE [API]
GO
/****** Object:  Table [dbo].[Order_SalesDetal_XRef]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_SalesDetal_XRef](
	[SalesDetailID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Order_SalesDetal_XRef] PRIMARY KEY CLUSTERED 
(
	[SalesDetailID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order_SalesDetal_XRef] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
