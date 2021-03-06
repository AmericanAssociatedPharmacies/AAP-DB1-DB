USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCompare_bkp]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCompare_bkp](
	[Customer_No] [varchar](31) NULL,
	[Customer_Name] [varchar](63) NULL,
	[NDC] [varchar](15) NULL,
	[AAPOldPrice] [numeric](38, 6) NULL,
	[CAOldPrice] [money] NULL,
	[AAPNewPrice] [numeric](38, 6) NULL,
	[CANewPrice] [money] NULL,
	[AAPEffectDate] [datetime] NULL,
	[CAEffectDate] [datetime] NULL,
	[AAPPrev3MonthUsage] [float] NULL,
	[CAPrev3MonthUsage] [float] NULL,
	[AAPAvgMonthUsage] [float] NULL,
	[CAAvgMonthUsage] [float] NULL,
	[AAPActualUsageToDate] [numeric](38, 0) NULL,
	[CAActualUsageToDate] [float] NULL,
	[AAPPriceProtectionDueToDate] [float] NULL,
	[CAPriceProtectionDueToDate] [money] NULL,
	[IsMultiplePriceChange] [varchar](10) NULL,
	[AuditOK] [varchar](10) NULL
) ON [PRIMARY]
GO
