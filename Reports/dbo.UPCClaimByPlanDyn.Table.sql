USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimByPlanDyn]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimByPlanDyn](
	[Planname] [nvarchar](200) NULL,
	[Curr YTD - TotalClaims] [int] NULL,
	[Curr YTD - Total$] [float] NULL,
	[Curr YTD - TotalLoss] [float] NULL,
	[Curr YTD - AvgLossPerClaim] [float] NULL,
	[Prev YTD - TotalClaims] [int] NULL,
	[Prev YTD - Total$] [float] NULL,
	[Prev YTD - TotalLoss] [float] NULL,
	[Prev YTD - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
