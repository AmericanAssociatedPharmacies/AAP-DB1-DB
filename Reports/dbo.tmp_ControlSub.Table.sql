USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ControlSub]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ControlSub](
	[CustNbr] [nvarchar](255) NULL,
	[CustName] [nvarchar](255) NULL,
	[Addr] [nvarchar](255) NULL,
	[StZip] [nvarchar](255) NULL,
	[GnrcUnts] [float] NULL,
	[BrndUnts] [float] NULL,
	[CntrlUntsCII] [float] NULL,
	[CntrlUnts3-5] [float] NULL,
	[CntrlUntsTlt] [float] NULL,
	[NonCntrlUnts] [float] NULL,
	[Hydros] [float] NULL,
	[Oxys] [float] NULL,
	[Oxy 30s] [float] NULL,
	[All ALP] [float] NULL,
	[ALP 2MG] [float] NULL,
	[%Cll-CV] [float] NULL,
	[%Cll] [float] NULL,
	[GXtoBXRato] [float] NULL
) ON [PRIMARY]
GO
