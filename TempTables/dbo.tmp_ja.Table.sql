USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_ja]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ja](
	[ACCT_NO] [varchar](5) NULL,
	[dea] [varchar](50) NULL,
	[pmid] [int] NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
