USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_GlobalReport_volume_0710rev092010]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GlobalReport_volume_0710rev092010](
	[pmid] [int] NULL,
	[date] [datetime] NULL,
	[month] [varchar](7) NULL,
	[Gen Src] [float] NULL,
	[Gen Exc] [float] NULL,
	[Gen Total] [float] NULL,
	[CH Br] [float] NULL,
	[CH Oth] [float] NULL,
	[UD Adm] [float] NULL,
	[CH Total] [float] NULL,
	[API_BR] [numeric](38, 2) NULL,
	[API_GEN] [numeric](38, 2) NULL,
	[API_OTC] [numeric](38, 2) NULL,
	[API_Total] [numeric](38, 2) NULL,
	[ML_Total] [numeric](14, 2) NULL,
	[Anda_Total] [numeric](38, 2) NULL,
	[All_Total] [float] NULL
) ON [PRIMARY]
GO
