USE [reporting]
GO
/****** Object:  Table [dbo].[CP_DirectDeposit]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_DirectDeposit](
	[DIR_DEP_ID] [int] NULL,
	[NCPDP] [varchar](7) NULL,
	[DEP_AMT] [numeric](12, 2) NULL,
	[TRAN_DT] [datetime] NULL,
	[XMIT_FLG] [smallint] NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
