USE [WebDev]
GO
/****** Object:  Table [dbo].[AGAuditTopPlanweb]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGAuditTopPlanweb](
	[PharmID] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[BillCode] [nvarchar](50) NULL,
	[PlanName] [nvarchar](50) NULL,
	[ClaimCount] [int] NULL,
	[Generic] [numeric](18, 2) NULL,
	[ControlledSub] [numeric](18, 2) NULL,
	[DAW1] [numeric](18, 2) NULL,
	[AvgDaySup] [numeric](18, 2) NULL,
	[AvgPaidPer] [numeric](18, 2) NULL,
	[Refills] [numeric](18, 2) NULL,
	[Reversals] [numeric](18, 2) NULL,
	[Compound] [numeric](18, 2) NULL,
	[DAW2] [numeric](18, 2) NULL,
	[DAWMSB] [numeric](18, 4) NULL,
	[DAWSSB] [numeric](18, 4) NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]
GO
