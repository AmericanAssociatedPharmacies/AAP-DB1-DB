USE [AAP]
GO
/****** Object:  Table [dbo].[tmp_AAP_Volume_GBO]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAP_Volume_GBO](
	[storename] [varchar](65) NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[city] [varchar](25) NULL,
	[state] [varchar](2) NULL,
	[effectiveaap] [datetime] NULL,
	[CH AAP December] [float] NULL,
	[CH UD Total October] [float] NULL,
	[CH UD GEN October] [numeric](38, 2) NULL,
	[CH UD Brand October] [numeric](38, 2) NULL,
	[CH API November] [numeric](18, 2) NULL,
	[API Total Sales December] [numeric](18, 2) NULL,
	[API GEN Sales December] [numeric](18, 2) NULL,
	[API BRAND Sales December] [numeric](18, 2) NULL,
	[API OTC Sales December] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
