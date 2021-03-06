USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimByPlan_bkp]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimByPlan_bkp](
	[Planname] [nvarchar](200) NULL,
	[2013 YTD - TotalClaims] [int] NULL,
	[2013 YTD - Total$] [float] NULL,
	[2013 YTD - TotalLoss] [float] NULL,
	[2013 YTD - AvgLossPerClaim] [float] NULL,
	[2012 YTD - TotalClaims] [int] NULL,
	[2012 YTD - Total$] [float] NULL,
	[2012 YTD - TotalLoss] [float] NULL,
	[2012 YTD - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
