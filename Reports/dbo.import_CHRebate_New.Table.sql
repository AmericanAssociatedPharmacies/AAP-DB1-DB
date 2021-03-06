USE [Reports]
GO
/****** Object:  Table [dbo].[import_CHRebate_New]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHRebate_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Marker] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[MSI Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL,
	[Sort Code] [nvarchar](255) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[AdjustedGenericSource] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[PriceProtection] [money] NULL,
	[PriceProtectionRebate] [money] NULL,
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
	[COGEligibleSales] [money] NULL,
	[RowUpdatedDate] [datetime] NULL,
	[COGRebateAdjustment] [money] NULL,
 CONSTRAINT [CPK_import_CHRebate_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[import_CHRebate_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
