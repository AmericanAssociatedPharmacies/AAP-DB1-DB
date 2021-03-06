USE [API]
GO
/****** Object:  Table [dbo].[delete_test1]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_test1](
	[PCLAIM_KEY] [int] NULL,
	[RX_NUM] [char](7) NULL,
	[FILL_DT] [datetime] NULL,
	[BILL_AMT] [numeric](8, 2) NULL,
	[PAID_AMT] [numeric](8, 2) NULL,
	[REJECT_AMT] [numeric](8, 2) NULL,
	[INGRED_BILL_AMT] [numeric](8, 2) NULL,
	[INGRED_PD_AMT] [numeric](8, 2) NULL,
	[COPAY_AMT] [numeric](8, 2) NULL,
	[CONTRACT_FEE_AMT] [numeric](8, 2) NULL,
	[PC_MISC_FEE_AMT] [numeric](8, 2) NULL,
	[REFILLS_QTY] [int] NULL,
	[CLAIM_TYPE] [char](2) NULL,
	[SUBMIT_CLARIF_CODE] [char](2) NULL,
	[GROUP_ID] [char](15) NULL,
	[PC_PAYEE_ID] [int] NULL,
	[NPI] [varchar](10) NULL,
	[NDC] [varchar](17) NULL,
	[PLAN_ID] [int] NULL,
	[R_FEED_ID] [int] NULL,
	[PLAN_CYCLE_DT] [datetime] NULL,
	[LINEITEM_ID] [int] NULL,
	[RECEIPT_ID] [int] NULL,
	[NABP] [varchar](7) NULL,
	[TO_STORE_AMT] [numeric](12, 2) NULL,
	[ADMIN_FEE_AMT] [numeric](12, 2) NULL,
	[MISC_FEE_AMT] [numeric](12, 2) NULL,
	[PAID_DT] [datetime] NULL,
	[CHECK_NUM] [int] NULL,
	[CLAIM_COUNT] [smallint] NULL,
	[ADJ_FLG] [smallint] NULL,
	[FEED_ID] [int] NULL,
	[XMIT_FLG] [smallint] NULL,
	[PROVIDER_OVERRIDE] [char](7) NULL,
	[PAYEE_ID] [int] NULL,
	[ADJ_REASON_CODE] [char](2) NULL,
	[ADJ_REF_ID] [varchar](32) NULL
) ON [PRIMARY]
GO
