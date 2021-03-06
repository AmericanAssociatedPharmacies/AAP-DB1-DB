USE [reporting]
GO
/****** Object:  Table [dbo].[ud_wholesaler_store]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_wholesaler_store](
	[WS_ID] [int] NULL,
	[VENDOR_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[ACCT_TYPE] [char](10) NULL,
	[ACCT_NUM] [int] NULL,
	[DC_NUM] [int] NULL,
	[UD_ACCT] [char](4) NULL
) ON [PRIMARY]
GO
