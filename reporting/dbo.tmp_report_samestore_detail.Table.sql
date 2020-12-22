USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_report_samestore_detail]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_samestore_detail](
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[fytd09ss] [numeric](38, 2) NULL,
	[fytd08ss] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
