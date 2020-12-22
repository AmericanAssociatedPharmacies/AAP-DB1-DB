USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_trendReportGR1_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendReportGR1_del](
	[acct_no] [char](4) NULL,
	[month] [datetime] NULL,
	[rxvol] [numeric](38, 2) NULL,
	[genvol] [numeric](38, 2) NULL,
	[submitted_rebate] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
