USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_anda_parmed_AAP]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_anda_parmed_AAP](
	[acct_no] [varchar](5) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[vendor] [varchar](64) NULL,
	[vendor_id] [int] NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[Qtr_Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
