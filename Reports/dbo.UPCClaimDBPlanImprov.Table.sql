USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimDBPlanImprov]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimDBPlanImprov](
	[PlanName] [nvarchar](200) NULL,
	[YTD Q2 2015 - Total Claims] [int] NULL,
	[YTD Q2 2015 - Total GPI] [int] NULL,
	[YTD Q2 2015 - # Improvements] [int] NULL,
	[YTD Q2 2015 - SuccessRate] [float] NULL,
	[YTD Q2 2014 - Total Claims] [int] NULL,
	[YTD Q2 2014 - Total GPI] [int] NULL,
	[YTD Q2 2014 - # Improvements] [int] NULL,
	[YTD Q2 2014 - SuccessRate] [float] NULL,
	[Q2 2015 - AvgResponseTime] [float] NULL,
	[Q1 2015 - AvgResponseTime] [float] NULL,
	[YTD Q2 2015 - AvgResponseTime] [float] NULL,
	[YTD Q2 2014 - AvgResponseTime] [float] NULL
) ON [PRIMARY]
GO
