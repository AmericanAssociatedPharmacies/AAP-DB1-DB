USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_match_CAAccount]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_match_CAAccount](
	[Contract] [varchar](15) NULL,
	[DivisionName] [varchar](255) NULL,
	[Division] [float] NULL,
	[CAAccountNo] [float] NULL,
	[AccountName] [varchar](255) NULL,
	[Address1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[BuyPlanPerc] [float] NULL,
	[AR2000TermsCode] [varchar](255) NULL,
	[AR2000TermsCodeDesc] [varchar](255) NULL,
	[ContractGroupNo] [float] NULL,
	[ActualWAPD90Days] [float] NULL,
	[MMPDSO90Days] [float] NULL,
	[ContractGroupEffDate] [datetime] NULL
) ON [PRIMARY]
GO
