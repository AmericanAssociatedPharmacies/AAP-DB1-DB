USE [Reports]
GO
/****** Object:  Table [dbo].[Import_Rebates_CAHDirect_backup_20191218]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_Rebates_CAHDirect_backup_20191218](
	[PMID] [int] NULL,
	[GenericRebate] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[GroupRebatePmts] [money] NULL,
	[PriceProtectionRebate] [money] NULL,
	[ST] [nvarchar](255) NULL,
	[SortCode] [nvarchar](255) NULL,
	[PaymentMethod] [nvarchar](255) NULL,
	[Date] [datetime] NULL,
	[PriceProtectionAdj] [money] NULL,
	[GenericRebateAdj] [money] NULL,
	[COGRebate] [money] NULL
) ON [PRIMARY]
GO
