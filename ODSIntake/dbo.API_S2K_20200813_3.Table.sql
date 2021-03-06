USE [ODSIntake]
GO
/****** Object:  Table [dbo].[API_S2K_20200813_3]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_S2K_20200813_3](
	[INVNBR] [numeric](9, 0) NOT NULL,
	[INVLINE] [numeric](4, 0) NOT NULL,
	[CUSTNBR] [char](7) NOT NULL,
	[CUST] [char](30) NOT NULL,
	[ITEMNO] [char](20) NOT NULL,
	[ITEM] [char](30) NOT NULL,
	[NDC] [char](13) NOT NULL,
	[QTY] [numeric](9, 2) NOT NULL,
	[ITEMAMT] [numeric](20, 6) NOT NULL,
	[ITEMGRP] [varchar](3) NOT NULL,
	[ACCTGRP] [varchar](3) NOT NULL,
	[SLSMAN] [numeric](5, 0) NOT NULL,
	[INVDATE] [numeric](8, 0) NOT NULL,
	[LINEAMT] [numeric](20, 6) NOT NULL,
	[EXTSALES] [numeric](20, 6) NOT NULL,
	[SALESORD] [numeric](9, 0) NOT NULL,
	[IDTYPP] [char](1) NOT NULL,
	[REBATE] [numeric](15, 4) NOT NULL,
	[IDPAGR] [numeric](4, 0) NOT NULL,
	[DISCOUNTPERCENTAGE] [numeric](16, 4) NULL
) ON [PRIMARY]
GO
