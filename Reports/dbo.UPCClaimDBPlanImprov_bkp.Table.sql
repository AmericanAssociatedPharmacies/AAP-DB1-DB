USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimDBPlanImprov_bkp]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimDBPlanImprov_bkp](
	[PlanName] [nvarchar](200) NULL,
	[YTD Q2 2013 - Total Claims] [int] NULL,
	[YTD Q2 2013 - Total GPI] [int] NULL,
	[YTD Q2 2013 - # Improvements] [int] NULL,
	[YTD Q2 2013 - SuccessRate] [float] NULL,
	[YTD Q2 2012 - Total Claims] [int] NULL,
	[YTD Q2 2012 - Total GPI] [int] NULL,
	[YTD Q2 2012 - # Improvements] [int] NULL,
	[YTD Q2 2012 - SuccessRate] [float] NULL,
	[Q2 2013 - AvgResponseTime] [float] NULL,
	[Q1 2013 - AvgResponseTime] [float] NULL,
	[YTD Q2 2013 - AvgResponseTime] [float] NULL,
	[YTD Q2 2012 - AvgResponseTime] [float] NULL
) ON [PRIMARY]
GO
