USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_TotalsML]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_TotalsML](
	[Date] [datetime] NULL,
	[TotalSales] [float] NULL,
	[TotalRxSales] [float] NULL,
	[TotalGenericSales] [float] NULL,
	[TotalAdminRebate] [float] NULL,
	[TotalGenericRebate] [float] NULL,
	[TotalRebateTotal] [float] NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
