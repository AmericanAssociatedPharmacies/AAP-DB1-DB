USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_delete2]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete2](
	[PMID] [numeric](29, 0) NULL,
	[date] [varchar](9) NOT NULL,
	[date_period_start] [varchar](9) NOT NULL,
	[date_period_end] [varchar](9) NOT NULL,
	[rebate_type] [varchar](2) NOT NULL,
	[ExtendedSales] [money] NULL,
	[SourceSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [int] NULL,
	[Pay to store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[EffectivePct] [float] NULL,
	[HRTA] [float] NULL
) ON [PRIMARY]
GO
