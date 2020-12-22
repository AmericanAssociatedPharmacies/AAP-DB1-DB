USE [reporting]
GO
/****** Object:  Table [dbo].[volumehybrid2]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[volumehybrid2](
	[VOLUMEHYBRID_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEA] [varchar](50) NULL,
	[CARDVOLUME_M1] [numeric](14, 2) NULL,
	[CARDVOLUME_M2] [numeric](14, 2) NULL,
	[CARDVOLUME_M3] [numeric](14, 2) NULL,
	[ANDAVOLUME_M1] [numeric](14, 2) NULL,
	[ANDAVOLUME_M2] [numeric](14, 2) NULL,
	[ANDAVOLUME_M3] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M1] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M2] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M3] [numeric](14, 2) NULL,
	[CARDVOLUME_AVG] [numeric](14, 2) NULL,
	[ANDAVOLUME_SUM] [numeric](14, 0) NULL,
	[PARMEDVOLUME_SUM] [numeric](14, 2) NULL,
	[GENERICCOMPLIANCE] [float] NULL
) ON [PRIMARY]
GO
