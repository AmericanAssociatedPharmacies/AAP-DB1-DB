USE [API]
GO
/****** Object:  Table [dbo].[APIOrder_BK20190730]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIOrder_BK20190730](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](30) NOT NULL,
	[API_Item_Number] [varchar](30) NOT NULL,
	[Quantity] [numeric](18, 2) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ItemDesc] [varchar](500) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_APIOrder] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APIOrder_BK20190730] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
