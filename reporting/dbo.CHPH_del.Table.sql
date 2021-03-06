USE [reporting]
GO
/****** Object:  Table [dbo].[CHPH_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_del](
	[DC] [int] NULL,
	[CUSTOMERNAME] [varchar](63) NULL,
	[CUSTOMER#] [varchar](31) NULL,
	[ITEM#] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEMTYPE] [varchar](15) NULL,
	[ITEMDESCR] [varchar](127) NULL,
	[GENERICNAME] [varchar](127) NULL,
	[TRADENAME] [varchar](127) NULL,
	[INVDATE] [datetime] NULL,
	[INVOICE#] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDERQTY] [numeric](18, 0) NULL,
	[SHIPQTY] [numeric](18, 0) NULL,
	[UNITCOST] [float] NULL,
	[EXTCOST] [float] NULL,
	[CORPAWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDORNAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACTFLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERICCODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORTCODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL
) ON [PRIMARY]
GO
