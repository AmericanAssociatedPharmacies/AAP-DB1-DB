USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_ARCHIVE]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_ARCHIVE](
	[PMID] [numeric](29, 0) NULL,
	[date] [datetime] NULL,
	[date_period_start] [datetime] NULL,
	[date_period_end] [datetime] NULL,
	[rebate_type] [varchar](2) NULL,
	[ExtendedSales] [money] NULL,
	[SourceSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [numeric](19, 4) NULL,
	[Pay to store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[EffectivePct] [float] NULL,
	[HRTA] [float] NULL,
	[AAPVolumeAdminFeeAffiliate] [money] NULL,
	[AAPGenericAdminFeePipco] [money] NULL
) ON [PRIMARY]
GO
