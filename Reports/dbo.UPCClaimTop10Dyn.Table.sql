USE [Reports]
GO
/****** Object:  Table [dbo].[UPCClaimTop10Dyn]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPCClaimTop10Dyn](
	[r] [bigint] NULL,
	[Q3 - NDC] [nvarchar](4000) NULL,
	[Q3 - DrugName] [varchar](25) NULL,
	[Q3 - TotalClaims] [int] NULL,
	[Q3 - TotalLoss] [float] NULL,
	[Q3 - AvgLossPerClaim] [float] NULL,
	[r2] [bigint] NULL,
	[Q2 - NDC] [nvarchar](4000) NULL,
	[Q2 - DrugName] [varchar](25) NULL,
	[Q2 - TotalClaims] [int] NULL,
	[Q2 - TotalLoss] [float] NULL,
	[Q2 - AvgLossPerClaim] [float] NULL
) ON [PRIMARY]
GO
