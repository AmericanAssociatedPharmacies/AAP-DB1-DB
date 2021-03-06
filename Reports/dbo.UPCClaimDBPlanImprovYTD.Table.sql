USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimDBPlanImprovYTD]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimDBPlanImprovYTD](
	[PlanName] [nvarchar](200) NULL,
	[CurrYTD - Total Claims] [int] NULL,
	[CurrYTD - Total GPI] [int] NULL,
	[CurrYTD - # Improvements] [int] NULL,
	[CurrYTD - SuccessRate] [float] NULL,
	[PrevYTD - Total Claims] [int] NULL,
	[PrevYTD - Total GPI] [int] NULL,
	[PrevYTD - # Improvements] [int] NULL,
	[PrevYTD - SuccessRate] [float] NULL,
	[CurrQtr - AvgResponseTime] [float] NULL,
	[PrevQtr - AvgResponseTime] [float] NULL,
	[CurrYTD - AvgResponseTime] [float] NULL,
	[PrevYTD - AvgResponseTime] [float] NULL
) ON [PRIMARY]
GO
