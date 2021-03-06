USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_delete_CPTA]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_CPTA](
	[PAYEE_ID] [int] NULL,
	[NCPDP] [varchar](7) NULL,
	[NCPDP_PAYEE] [char](7) NULL,
	[DT] [datetime] NULL,
	[AMT] [numeric](12, 2) NULL,
	[FTP_ACCT] [char](32) NULL,
	[TYPE] [char](32) NULL,
	[XMIT_FLG] [smallint] NULL
) ON [PRIMARY]
GO
