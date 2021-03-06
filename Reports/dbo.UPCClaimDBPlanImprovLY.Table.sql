USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimDBPlanImprovLY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimDBPlanImprovLY](
	[Q2 - PlanName] [nvarchar](200) NULL,
	[Q2 - Total Claims] [int] NULL,
	[Q2 - Total GPI] [int] NULL,
	[Q2 - # Improvements] [int] NULL,
	[Q2 - SuccessRate] [float] NULL,
	[Q1 - Total Claims] [int] NULL,
	[Q1 - Total GPI] [int] NULL,
	[Q1 - # Improvements] [int] NULL,
	[Q1 - SuccessRate] [float] NULL
) ON [PRIMARY]
GO
