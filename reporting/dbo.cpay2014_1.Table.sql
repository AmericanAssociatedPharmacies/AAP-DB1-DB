USE [reporting]
GO
/****** Object:  Table [dbo].[cpay2014_1]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpay2014_1](
	[NCPDP] [varchar](7) NULL,
	[AMT] [numeric](12, 2) NULL,
	[DT] [datetime] NULL,
	[PAYEE_ID] [int] NULL,
	[TYPE] [char](1) NULL
) ON [PRIMARY]
GO
