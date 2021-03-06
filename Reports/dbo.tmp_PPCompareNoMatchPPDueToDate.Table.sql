USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCompareNoMatchPPDueToDate]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCompareNoMatchPPDueToDate](
	[Customer_No] [varchar](50) NULL,
	[Customer_Name] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
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
	[AAPPriceProtectionDueToDate] [money] NULL,
	[CAPriceProtectionDueToDate] [money] NULL,
	[IsMultiplePriceChange] [varchar](10) NULL,
	[AuditOK] [varchar](10) NULL,
	[AuditFailReason] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
