USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_customer_list]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_customer_list](
	[ACCOUNT] [varchar](128) NULL,
	[NCPDP] [varchar](32) NULL,
	[UDACCTNO] [varchar](32) NULL,
	[DEA] [varchar](15) NULL,
	[NPI_NUMBER] [varchar](32) NULL,
	[AAPID] [varchar](32) NULL,
	[api_id] [varchar](32) NULL,
	[ADDRESS1] [varchar](64) NULL,
	[CITY] [varchar](32) NULL,
	[STATE] [varchar](32) NULL,
	[POSTALCODE] [varchar](24) NULL,
	[STATUS] [varchar](64) NULL,
	[SUBTYPE] [varchar](64) NULL,
	[BUSINESSDESCRIPTION] [varchar](2000) NULL,
	[MAINPHONE] [varchar](32) NULL,
	[FAX] [varchar](32) NULL,
	[TERRITORY] [varchar](32) NULL,
	[RXNETWORK] [varchar](32) NULL,
	[RXCOMPUTER] [varchar](32) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFYDATE] [datetime] NULL,
	[ACCOUNTID] [char](12) NOT NULL,
	[TYPE] [varchar](64) NULL
) ON [PRIMARY]
GO
