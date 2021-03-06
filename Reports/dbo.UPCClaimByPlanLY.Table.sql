USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimByPlanLY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimByPlanLY](
	[Planname] [nvarchar](200) NULL,
	[Q3 - TotalClaims] [int] NULL,
	[Q3 - Total$] [float] NULL,
	[Q3 - TotalLoss] [float] NULL,
	[Q3 - AvgLossPerClaim] [float] NULL,
	[Q2 - TotalClaims] [int] NULL,
	[Q2 - Total$] [float] NULL,
	[Q2 - TotalLoss] [float] NULL,
	[Q2 - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
