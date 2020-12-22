USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_delete_tr_volumesnap]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr_volumesnap](
	[acct_no] [varchar](4) NULL,
	[vendor_id] [int] NULL,
	[october] [numeric](14, 2) NULL,
	[november] [numeric](14, 2) NULL,
	[december] [numeric](14, 2) NULL,
	[january] [numeric](14, 2) NULL,
	[february] [numeric](14, 2) NULL,
	[march] [numeric](14, 2) NULL,
	[april] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
