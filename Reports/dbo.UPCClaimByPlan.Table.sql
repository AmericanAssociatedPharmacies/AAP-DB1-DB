USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimByPlan]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimByPlan](
	[Planname] [nvarchar](200) NULL,
	[YTD Q3 2015 - TotalClaims] [int] NULL,
	[YTD Q3 2015 - Total$] [float] NULL,
	[YTD Q3 2015 - TotalLoss] [float] NULL,
	[YTD Q3 2015 - AvgLossPerClaim] [float] NULL,
	[YTD Q3 2014 - TotalClaims] [int] NULL,
	[YTD Q3 2014 - Total$] [float] NULL,
	[YTD Q3 2014 - TotalLoss] [float] NULL,
	[YTD Q3 2014 - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
