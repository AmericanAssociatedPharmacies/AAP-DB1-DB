USE [API]
GO
/****** Object:  Table [dbo].[tmp_MO_GEN_Non_PVA_test]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_GEN_Non_PVA_test](
	[apiaccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[September_gen] [numeric](38, 2) NULL,
	[October_gen] [numeric](38, 2) NULL,
	[November_gen] [numeric](38, 2) NULL,
	[December_gen] [numeric](38, 2) NULL,
	[January_gen] [numeric](38, 2) NULL,
	[February_gen] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
