USE [Reports]
GO
/****** Object:  Table [dbo].[ca_priceprotection_ForTest110916]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ca_priceprotection_ForTest110916](
	[Date] [datetime] NULL,
	[RebateReportMonth] [datetime] NULL,
	[L01AfltnName] [varchar](255) NULL,
	[DCNumber] [float] NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[CorpItemNumber] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[Size] [varchar](255) NULL,
	[ProtectedSelPrice] [money] NULL,
	[NewSellPrice] [money] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[Prev3MonthUsage] [float] NULL,
	[AvgMonthlyUsage] [float] NULL,
	[UnitSellDlr] [money] NULL,
	[ActualUsageToDate] [float] NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[State] [varchar](255) NULL,
	[SubAffiliation] [varchar](255) NULL,
	[CustomerUnique] [varchar](255) NULL,
	[Usage] [float] NULL,
	[Returns] [float] NULL,
	[PriorMonthUsage] [float] NULL,
	[Available] [float] NULL,
	[OverageLastMonth] [float] NULL,
	[TotalOwed] [float] NULL,
	[UsageForCalculation] [float] NULL,
	[Comment] [varchar](255) NULL,
	[RebatePerc] [float] NULL,
	[FinalPriceProtectionDue] [money] NULL
) ON [PRIMARY]
GO
