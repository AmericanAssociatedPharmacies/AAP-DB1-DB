USE [API]
GO
/****** Object:  Table [dbo].[APISalesDetail_NovExactDups_20201203]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_NovExactDups_20201203](
	[RN] [bigint] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL
) ON [PRIMARY]
GO
