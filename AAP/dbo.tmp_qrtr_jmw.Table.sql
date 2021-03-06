USE [AAP]
GO
/****** Object:  Table [dbo].[tmp_qrtr_jmw]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qrtr_jmw](
	[DEA] [varchar](50) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPID] [bigint] NULL,
	[AccountDescription] [varchar](150) NULL,
	[UD_PVA] [numeric](38, 2) NULL,
	[API_PVA] [numeric](38, 2) NULL,
	[WH_Purchases] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
