USE [Reports]
GO
/****** Object:  Table [dbo].[import_PriceProtection_ORIG]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PriceProtection_ORIG](
	[Date] [varchar](10) NULL,
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
	[PercChange] [float] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[Prev3MonthUsage] [float] NULL,
	[AvgMonthlyUsage] [float] NULL,
	[UnitSellDlr] [money] NULL,
	[ActualUsageToDate] [float] NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[PerOfMax] [float] NULL,
	[MaxPriceProtection] [money] NULL,
	[IsValid] [varchar](1) NULL
) ON [PRIMARY]
GO
