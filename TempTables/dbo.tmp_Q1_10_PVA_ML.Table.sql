USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_PVA_ML]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_PVA_ML](
	[PMID] [varchar](255) NULL,
	[TM#] [varchar](255) NULL,
	[AAP#] [varchar](255) NULL,
	[API#] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[JanSales] [numeric](18, 2) NULL,
	[JanUDSales] [numeric](18, 2) NULL,
	[JanTotalPVASales] [numeric](18, 2) NULL,
	[FebAPIContract] [numeric](18, 2) NULL,
	[FebAAPContract] [numeric](18, 2) NULL,
	[FebUDContract] [numeric](18, 2) NULL,
	[FebTotalPVASales] [numeric](18, 2) NULL,
	[MarAPIContract] [numeric](18, 2) NULL,
	[MarAAPContract] [numeric](18, 2) NULL,
	[MARUDContract] [numeric](18, 2) NULL,
	[MarTotalPVASales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
