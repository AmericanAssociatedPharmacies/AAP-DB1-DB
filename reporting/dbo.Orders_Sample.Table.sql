USE [reporting]
GO
/****** Object:  Table [dbo].[Orders_Sample]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Sample](
	[order_id] [int] NULL,
	[order_date] [date] NULL,
	[customer_name] [varchar](250) NULL,
	[city] [varchar](100) NULL,
	[order_amount] [money] NULL
) ON [PRIMARY]
GO
