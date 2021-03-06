USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_GR1_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR1_del](
	[GRID] [int] NULL,
	[FILEID] [int] NULL,
	[DC_NUM] [int] NULL,
	[WHOLESALER_ACCT] [int] NULL,
	[UD_ACCT] [char](4) NULL,
	[VENDOR_ID] [int] NULL,
	[APPLY_DT] [datetime] NULL,
	[ADJUSTMENT_DT] [datetime] NULL,
	[REBATE_PERCENT] [numeric](3, 3) NULL,
	[GEN_VOL_AMT] [numeric](11, 2) NULL,
	[RX_VOL_AMT] [numeric](11, 2) NULL,
	[SUBMITTED_REBATE_AMT] [numeric](12, 2) NULL,
	[PAYBACK_PERCENT] [numeric](4, 3) NULL
) ON [PRIMARY]
GO
