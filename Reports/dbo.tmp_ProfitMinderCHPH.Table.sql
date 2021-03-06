USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ProfitMinderCHPH]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ProfitMinderCHPH](
	[PMID] [int] NULL,
	[Whse_Inv_ID] [varchar](15) NULL,
	[VendorID] [varchar](2) NOT NULL,
	[UD_ACCT_NUM] [varchar](20) NULL,
	[INVOICE_NUM] [varchar](15) NULL,
	[INVOICE_DT] [datetime] NULL,
	[INVOICE_TYPE] [varchar](15) NULL,
	[NDC] [varchar](15) NULL,
	[SHIP QTY] [numeric](18, 0) NULL,
	[UNIT_COST_AMT] [numeric](18, 2) NULL,
	[WAC] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
