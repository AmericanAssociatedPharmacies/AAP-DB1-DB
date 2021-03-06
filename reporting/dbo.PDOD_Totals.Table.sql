USE [reporting]
GO
/****** Object:  Table [dbo].[PDOD_Totals]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDOD_Totals](
	[acct_no] [nvarchar](4) NULL,
	[store] [nvarchar](35) NULL,
	[city] [nvarchar](20) NULL,
	[state] [nvarchar](2) NULL,
	[nsterritory] [nvarchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[eligible] [smallint] NULL,
	[NonWSRebate] [float] NULL,
	[CRFactor] [float] NULL,
	[CR90] [float] NULL,
	[NonWSVolume] [float] NULL,
	[GenRebate] [float] NULL,
	[WSAdminFees] [float] NULL,
	[ContributionPercentage] [float] NULL,
	[ProfitDistributionFactor] [float] NULL,
	[ProfitDistribution90] [float] NULL,
	[WSRXSales] [money] NULL,
	[WSGenericSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[NewCustomerDiscount] [money] NULL,
	[ConversionDiscount] [money] NULL,
	[AutoSubstitution] [money] NULL,
	[CurrentCustomerDiscount] [money] NULL
) ON [PRIMARY]
GO
