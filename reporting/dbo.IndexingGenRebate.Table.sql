USE [reporting]
GO
/****** Object:  Table [dbo].[IndexingGenRebate]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexingGenRebate](
	[GRID] [int] NULL,
	[FILEID] [int] NULL,
	[DC_NUM] [int] NULL,
	[WHOLESALER_ACCT] [int] NULL,
	[UD_ACCT] [varchar](5) NULL,
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
ALTER TABLE [dbo].[IndexingGenRebate] ADD  CONSTRAINT [DF_IndexingGenRebate_PAYBACK_PERCENT]  DEFAULT ((0.500)) FOR [PAYBACK_PERCENT]
GO
