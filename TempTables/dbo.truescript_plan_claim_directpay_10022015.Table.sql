USE [TempTables]
GO
/****** Object:  Table [dbo].[truescript_plan_claim_directpay_10022015]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[truescript_plan_claim_directpay_10022015](
	[PCLAIM_KEY] [int] NULL,
	[NABP] [char](7) NULL,
	[FEED_ID] [int] NULL,
	[PLAN_CYCLE_DT] [datetime] NULL,
	[PLAN_ID] [int] NULL,
	[RX_NUM] [char](20) NULL,
	[FILL_DT] [datetime] NULL,
	[BILL_AMT] [numeric](8, 2) NULL,
	[PAID_AMT] [numeric](8, 2) NULL,
	[REJECT_AMT] [numeric](8, 2) NULL,
	[INGRED_BILL_AMT] [numeric](8, 2) NULL,
	[INGRED_PD_AMT] [numeric](8, 2) NULL,
	[COPAY_AMT] [numeric](8, 2) NULL,
	[CONTRACT_FEE_AMT] [numeric](8, 2) NULL,
	[MISC_FEE_AMT] [numeric](8, 2) NULL,
	[REFILLS_QTY] [int] NULL,
	[CLAIM_TYPE] [varchar](63) NULL,
	[SUBMIT_CLARIF_CODE] [char](2) NULL,
	[GROUP_ID] [char](15) NULL,
	[PAYEE_ID] [int] NULL,
	[NPI] [varchar](10) NULL,
	[NDC] [varchar](17) NULL,
	[PAID_DT] [datetime] NULL,
	[ADJUSTMENT_AMT] [numeric](8, 2) NULL
) ON [PRIMARY]
GO
