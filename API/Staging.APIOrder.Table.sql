USE [API]
GO
/****** Object:  Table [Staging].[APIOrder]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIOrder](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](30) NOT NULL,
	[API_Item_Number] [varchar](30) NOT NULL,
	[Quantity] [numeric](18, 2) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ItemDesc] [varchar](500) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_APIOrder] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APIOrder] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
