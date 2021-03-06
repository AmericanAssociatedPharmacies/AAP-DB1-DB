USE [reporting]
GO
/****** Object:  Table [dbo].[CP_Check]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_Check](
	[CHECK_NUM] [int] NULL,
	[WK_CYCLE_END_DT] [datetime] NULL,
	[NCPDP] [varchar](7) NULL,
	[PAID_AMT] [numeric](12, 2) NULL,
	[PAID_DT] [datetime] NULL,
	[PRINT_FLG] [smallint] NULL,
	[XMIT_FLG] [smallint] NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
