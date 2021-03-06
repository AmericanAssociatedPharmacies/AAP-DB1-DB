USE [Reports]
GO
/****** Object:  Table [Archive].[LastOrderSummary]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[LastOrderSummary](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[YTDSales] [money] NULL,
	[TM] [varchar](2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_Archive_LastOrderSummary] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[LastOrderSummary] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
