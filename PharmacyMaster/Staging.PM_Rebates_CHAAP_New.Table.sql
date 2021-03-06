USE [PharmacyMaster]
GO
/****** Object:  Table [Staging].[PM_Rebates_CHAAP_New]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_Rebates_CHAAP_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[COGRebate%] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [varbinary](8) NOT NULL,
 CONSTRAINT [CPK_Staging_PM_Rebates_CHAAP_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[PM_Rebates_CHAAP_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
