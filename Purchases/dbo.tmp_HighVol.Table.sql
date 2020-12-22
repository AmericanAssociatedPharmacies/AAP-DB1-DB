USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_HighVol]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_HighVol](
	[NDC] [varchar](15) NULL,
	[TotalQty] [numeric](38, 0) NULL,
	[VolumeAmt] [float] NULL
) ON [PRIMARY]
GO
