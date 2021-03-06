USE [reporting]
GO
/****** Object:  Table [dbo].[report_NCDV_101613]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_NCDV_101613](
	[pharm id] [nvarchar](50) NULL,
	[number_of_rows] [int] NULL,
	[total_paid] [numeric](38, 3) NULL,
	[fee_paid] [numeric](38, 3) NULL,
	[cost_paid] [numeric](38, 3) NULL,
	[plan_amount] [numeric](38, 3) NULL,
	[min_rx_date] [datetime] NULL,
	[max_rx_date] [datetime] NULL
) ON [PRIMARY]
GO
