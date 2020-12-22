USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_qtr_admin]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_admin](
	[acct_no] [varchar](5) NULL,
	[Q4_2007] [numeric](16, 2) NULL,
	[Q4_2008] [numeric](16, 2) NULL,
	[QQ_PCT_CHG] [numeric](36, 19) NULL
) ON [PRIMARY]
GO
