USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_qtr_sales_detail]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_sales_detail](
	[Quarter] [varchar](2) NOT NULL,
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[Q_FY_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
