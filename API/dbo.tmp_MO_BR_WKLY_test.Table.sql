USE [API]
GO
/****** Object:  Table [dbo].[tmp_MO_BR_WKLY_test]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_BR_WKLY_test](
	[apiaccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[September_br] [numeric](38, 2) NULL,
	[October_br] [numeric](38, 2) NULL,
	[November_br] [numeric](38, 2) NULL,
	[December_br] [numeric](38, 2) NULL,
	[January_br] [numeric](38, 2) NULL,
	[February_br] [numeric](38, 2) NULL,
	[Pay Terms] [varchar](28) NULL
) ON [PRIMARY]
GO
