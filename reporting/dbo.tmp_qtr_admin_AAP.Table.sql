USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_qtr_admin_AAP]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_admin_AAP](
	[acct_no] [varchar](5) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2009] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
