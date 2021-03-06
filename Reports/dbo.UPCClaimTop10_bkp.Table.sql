USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimTop10_bkp]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimTop10_bkp](
	[r] [bigint] NULL,
	[Q3 - GPI] [varchar](14) NULL,
	[Q3 - GPIDesc] [varchar](60) NULL,
	[Q3 - TotalClaims] [int] NULL,
	[Q3 - TotalLoss] [float] NULL,
	[Q3 - AvgLossPerClaim] [float] NULL,
	[r2] [bigint] NULL,
	[Q2 - GPI] [varchar](14) NULL,
	[Q2 - GPIDesc] [varchar](60) NULL,
	[Q2 - TotalClaims] [int] NULL,
	[Q2 - TotalLoss] [float] NULL,
	[Q2 - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
