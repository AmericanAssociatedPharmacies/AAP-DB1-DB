USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_jmw_wac_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_wac_del](
	[gcn] [numeric](5, 0) NULL,
	[RxCount] [int] NULL,
	[QtyDisp] [int] NULL,
	[TotalAWP] [numeric](38, 4) NULL,
	[PatientPaid] [numeric](38, 4) NULL,
	[TotalPaid] [numeric](38, 4) NULL,
	[CARDPrice] [numeric](18, 4) NULL,
	[TotalWAC] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
