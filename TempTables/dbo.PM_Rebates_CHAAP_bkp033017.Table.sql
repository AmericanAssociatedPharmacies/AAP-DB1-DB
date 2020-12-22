USE [TempTables]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp033017]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp033017](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL
) ON [PRIMARY]
GO
