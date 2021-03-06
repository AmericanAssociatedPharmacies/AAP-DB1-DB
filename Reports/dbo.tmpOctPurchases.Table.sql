USE [Reports]
GO
/****** Object:  Table [dbo].[tmpOctPurchases]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpOctPurchases](
	[Date] [nvarchar](255) NULL,
	[RebateReportMonth] [nvarchar](255) NULL,
	[L01AfltnName] [nvarchar](255) NULL,
	[DCNumber] [money] NULL,
	[CustomerNumber] [nvarchar](255) NULL,
	[CustomerName] [nvarchar](255) NULL,
	[CorpItemNumber] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[ProtectedSelPrice] [money] NULL,
	[NewSellPrice] [money] NULL,
	[ProtectionStartDate] [nvarchar](255) NULL,
	[ProtectionEndDate] [nvarchar](255) NULL,
	[Prev3MonthUsage] [money] NULL,
	[AvgMonthlyUsage] [money] NULL,
	[UnitSellDlr] [money] NULL,
	[ActualUsageToDate] [money] NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[State] [nvarchar](255) NULL,
	[SubAffiliation] [nvarchar](255) NULL,
	[CustomerUnique] [nvarchar](255) NULL,
	[Usage] [money] NULL,
	[Returns] [money] NULL,
	[PriorMonthUsage] [money] NULL,
	[Available] [money] NULL,
	[OverageLastMonth] [money] NULL,
	[TotalOwed] [money] NULL,
	[UsageForCalculation] [money] NULL,
	[Comment] [nvarchar](255) NULL,
	[RebatePerc] [nvarchar](255) NULL,
	[FinalPriceProtectionDue] [nvarchar](255) NULL
) ON [PRIMARY]
GO
