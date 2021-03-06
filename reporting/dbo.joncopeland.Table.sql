USE [reporting]
GO
/****** Object:  Table [dbo].[joncopeland]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[joncopeland](
	[Pharmacy Master Record] [int] NULL,
	[UD_ACCT_NO] [varchar](20) NULL,
	[AAP_ACCT_NO] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[TAX ID] [varchar](12) NULL,
	[API_ACCOUNT_NO] [varchar](20) NULL,
	[NAME] [varchar](65) NULL,
	[ADDR1] [varchar](80) NULL,
	[ADDR2] [varchar](80) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [varchar](2) NULL,
	[ZIP] [varchar](10) NULL,
	[EFFECTIVE NOT PREVIOUS API] [datetime] NULL,
	[UD START DATE] [datetime] NULL,
	[UD QUIT DATE] [datetime] NULL,
	[CARDINAL ADMIN FEES] [numeric](14, 2) NULL,
	[MIAMI LUKEN ADMIN FEES] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
