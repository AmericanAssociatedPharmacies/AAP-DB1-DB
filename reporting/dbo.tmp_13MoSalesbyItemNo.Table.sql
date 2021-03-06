USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_13MoSalesbyItemNo]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_13MoSalesbyItemNo](
	[REPORTINGMONTH] [numeric](13, 0) NOT NULL,
	[ITEMNO] [varchar](35) NOT NULL,
	[IDPGRP] [char](5) NOT NULL,
	[QTY] [numeric](31, 3) NULL,
	[EXTPRICE] [numeric](31, 4) NULL,
	[PRICEAFTERPAYTERMDISCOUNT] [numeric](31, 4) NULL,
	[PRICEAFTERREBATE] [numeric](31, 4) NULL
) ON [PRIMARY]
GO
