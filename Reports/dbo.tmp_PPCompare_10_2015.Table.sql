USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCompare_10_2015]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCompare_10_2015](
	[Customer_No] [varchar](31) NULL,
	[Customer_Name] [varchar](63) NULL,
	[NDC] [varchar](15) NULL,
	[AAPOldPrice] [money] NULL,
	[CAOldPrice] [money] NULL,
	[AAPNewPrice] [money] NULL,
	[CANewPrice] [money] NULL,
	[AAPUnitCost] [money] NULL,
	[CAUnitCost] [money] NULL,
	[AAPEffectDate] [datetime] NULL,
	[CAEffectDate] [datetime] NULL,
	[AAPPrev3MonthUsage] [float] NULL,
	[CAPrev3MonthUsage] [float] NULL,
	[AAPAvgMonthUsage] [float] NULL,
	[CAAvgMonthUsage] [float] NULL,
	[AAPActualUsageToDate] [float] NULL,
	[CAActualUsageToDate] [float] NULL,
	[AAPPriceProtectionDueToDate] [money] NULL,
	[CAPriceProtectionDueToDate] [money] NULL,
	[IsMultiplePriceChange] [varchar](10) NULL,
	[AuditOK] [varchar](10) NULL,
	[AuditFailReason] [varchar](max) NULL,
	[CAPriorMonthUsage] [float] NULL,
	[AAPPriorMonthUsage] [float] NULL,
	[CAUsageForCalculation] [float] NULL,
	[CAComment] [varchar](max) NULL,
	[AAPComment] [varchar](max) NULL,
	[AAPUsageForCalculation] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
