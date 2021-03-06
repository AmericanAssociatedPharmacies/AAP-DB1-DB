USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD_RollUp_ML]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD_RollUp_ML](
	[pmid] [int] NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[TotJanSales] [numeric](38, 2) NULL,
	[TotFebSales] [numeric](38, 2) NULL,
	[TotMarSales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
