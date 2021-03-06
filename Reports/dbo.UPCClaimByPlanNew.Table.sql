USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimByPlanNew]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimByPlanNew](
	[Planname] [nvarchar](200) NULL,
	[YTD Q2 2013 - TotalClaims] [int] NULL,
	[YTD Q2 2013 - Total$] [float] NULL,
	[YTD Q2 2013 - TotalLoss] [float] NULL,
	[YTD Q2 2013 - AvgLossPerClaim] [float] NULL,
	[YTD Q2 2012 - TotalClaims] [int] NULL,
	[YTD Q2 2012 - Total$] [float] NULL,
	[YTD Q2 2012 - TotalLoss] [float] NULL,
	[YTD Q2 2012 - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
