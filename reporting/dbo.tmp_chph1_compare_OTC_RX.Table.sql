USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_chph1_compare_OTC_RX]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph1_compare_OTC_RX](
	[ID] [int] NOT NULL,
	[STORE] [varchar](31) NULL,
	[OTC_Only] [float] NULL,
	[OTC_RX] [float] NULL,
	[OTC_RX_Percentage] [float] NULL
) ON [PRIMARY]
GO
