USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_delete_backup_PM_Rebates_CHAAP]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_backup_PM_Rebates_CHAAP](
	[PMID] [numeric](29, 0) NULL,
	[date] [datetime] NULL,
	[date_period_start] [datetime] NULL,
	[date_period_end] [datetime] NULL,
	[rebate_type] [varchar](2) NULL,
	[ExtendedSales] [money] NULL,
	[SourceSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [numeric](19, 4) NULL,
	[Pay to store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[EffectivePct] [float] NULL,
	[HRTA] [float] NULL
) ON [PRIMARY]
GO
