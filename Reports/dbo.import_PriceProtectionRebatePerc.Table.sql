USE [Reports]
GO
/****** Object:  Table [dbo].[import_PriceProtectionRebatePerc]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PriceProtectionRebatePerc](
	[Date] [datetime] NULL,
	[UnKnown] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[SubAffiliation] [varchar](255) NULL,
	[CustomerUnique] [varchar](255) NULL,
	[L01AfltnName] [varchar](255) NULL,
	[DC] [float] NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[CorporateItemNumber] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[OldSell] [money] NULL,
	[NewSell] [money] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[PercChange] [float] NULL,
	[Previous3MonthsHistoricalUsage] [float] NULL,
	[AverageMonthlyUsage] [float] NULL,
	[UnitSellDlr] [money] NULL,
	[Usage] [float] NULL,
	[Returns] [float] NULL,
	[TotalUsage] [float] NULL,
	[PriorMonthUsage] [float] NULL,
	[AvailableFromLastMonth] [float] NULL,
	[OverageLastMonth] [float] NULL,
	[TotalOwed] [float] NULL,
	[UsageForCalculation] [float] NULL,
	[PriceProtectionDue] [money] NULL,
	[Comments] [varchar](255) NULL,
	[RebatePerc] [float] NULL,
	[FinalPriceProtectionDue] [money] NULL
) ON [PRIMARY]
GO
