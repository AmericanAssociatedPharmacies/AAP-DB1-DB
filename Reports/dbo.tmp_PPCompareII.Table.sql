USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCompareII]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCompareII](
	[DATE] [varchar](10) NOT NULL,
	[Customer_No] [varchar](31) NULL,
	[Customer_Name] [varchar](63) NULL,
	[NDC] [varchar](15) NULL,
	[AAPEffectDate] [datetime] NULL,
	[AAPOldPrice] [numeric](38, 6) NULL,
	[AAPNewPrice] [numeric](38, 6) NULL,
	[AAPPrev3MonthUsage] [float] NULL,
	[AAPAvgMonthUsage] [float] NULL,
	[AAPActualUsageToDate] [numeric](38, 0) NULL,
	[AAPPriceProtectionDueToDate] [money] NULL,
	[CAPriceProtectionDueToDate] [money] NULL,
	[IsMultiplePriceChange] [varchar](10) NULL,
	[AuditOK] [varchar](10) NULL,
	[AuditFailReason] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
