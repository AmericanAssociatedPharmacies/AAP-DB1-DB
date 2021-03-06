USE [Reports]
GO
/****** Object:  Table [dbo].[totals_MiamiLuken]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[totals_MiamiLuken](
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
