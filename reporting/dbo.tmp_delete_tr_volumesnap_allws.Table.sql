USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_delete_tr_volumesnap_allws]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr_volumesnap_allws](
	[acct_no] [varchar](4) NULL,
	[vendor_id] [int] NULL,
	[aug08] [numeric](14, 2) NULL,
	[sep08] [numeric](14, 2) NULL,
	[oct08] [numeric](14, 2) NULL,
	[nov08] [numeric](14, 2) NULL,
	[dec08] [numeric](14, 2) NULL,
	[jan09] [numeric](14, 2) NULL,
	[feb09] [numeric](14, 2) NULL,
	[feb08] [numeric](38, 2) NULL,
	[dec07] [numeric](38, 2) NULL,
	[nov07] [numeric](38, 2) NULL,
	[oct07] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
