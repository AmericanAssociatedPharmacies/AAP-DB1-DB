USE [reporting]
GO
/****** Object:  Table [dbo].[Payee]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payee](
	[PAYEE_ID] [int] NULL,
	[ACCOUNT_ID] [char](12) NULL,
	[NABP] [char](7) NULL,
	[STATUS] [char](1) NULL,
	[STORE_NAME] [varchar](50) NULL,
	[STORE_STREET] [varchar](50) NULL,
	[STORE_POBOX] [varchar](25) NULL,
	[STORE_CITY] [varchar](25) NULL,
	[STORE_STATE] [varchar](2) NULL,
	[STORE_ZIP] [varchar](10) NULL,
	[STORE_PHONE] [varchar](14) NULL,
	[STORE_FAX] [varchar](14) NULL,
	[CHECK_NAME] [varchar](50) NULL,
	[CHECK_STREET] [varchar](50) NULL,
	[CHECK_POBOX] [varchar](25) NULL,
	[CHECK_CITY] [varchar](25) NULL,
	[CHECK_STATE] [varchar](2) NULL,
	[CHECK_ZIP] [varchar](10) NULL,
	[CHECK_PHONE] [varchar](14) NULL,
	[CHECK_FAX] [varchar](14) NULL,
	[EFF_DT] [datetime] NULL,
	[QUIT_DT] [datetime] NULL,
	[NPP_PHARM] [smallint] NULL,
	[SUBCON_PHARM] [smallint] NULL,
	[NON_UD] [smallint] NULL,
	[EMAIL] [varchar](120) NULL,
	[DEA] [varchar](10) NULL,
	[ACTIVE_PAYEE] [int] NULL,
	[SENDER_ID] [varchar](15) NULL,
	[RECEIVER_ID] [varchar](15) NULL,
	[FED_TAX_ID] [varchar](12) NULL,
	[FTP_ACCT] [varchar](32) NULL,
	[NPI] [varchar](10) NULL,
	[EMAIL_NOTIFY] [smallint] NULL
) ON [PRIMARY]
GO
