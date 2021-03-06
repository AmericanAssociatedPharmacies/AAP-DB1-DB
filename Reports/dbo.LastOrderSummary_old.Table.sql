USE [Reports]
GO
/****** Object:  Table [dbo].[LastOrderSummary_old]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastOrderSummary_old](
	[AccountName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[API#] [varchar](20) NULL,
	[Status] [varchar](32) NULL,
	[AppRecvd] [int] NULL,
	[APIActivated] [int] NULL,
	[LastOrder] [date] NULL,
	[DaysLastOrder] [int] NULL,
	[MaxUnits] [int] NULL,
	[AvgUnits] [int] NULL,
	[LastUnits] [int] NULL,
	[YearToDateUnits] [int] NULL,
	[#GRXOrders] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LastOrderSummary_old] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
