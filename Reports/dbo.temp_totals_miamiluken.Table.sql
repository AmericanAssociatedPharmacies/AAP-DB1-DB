USE [Reports]
GO
/****** Object:  Table [dbo].[temp_totals_miamiluken]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_totals_miamiluken](
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
