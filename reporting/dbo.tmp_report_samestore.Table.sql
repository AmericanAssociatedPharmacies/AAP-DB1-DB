USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_report_samestore]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_samestore](
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[fytd09ss] [numeric](38, 2) NULL,
	[fytd08ss] [numeric](38, 2) NULL,
	[stores_purchasing_fytd09] [int] NULL,
	[fytd09all] [numeric](38, 2) NULL,
	[stores_purchasing_fytd08] [int] NULL,
	[fytd08all] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
