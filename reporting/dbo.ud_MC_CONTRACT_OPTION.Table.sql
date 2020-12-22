USE [reporting]
GO
/****** Object:  Table [dbo].[ud_MC_CONTRACT_OPTION]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_MC_CONTRACT_OPTION](
	[MCCOD_ID] [int] NULL,
	[OPT_ID] [int] NULL,
	[CONTRACT_ID] [int] NULL,
	[SUB_OPT] [char](10) NULL,
	[OPT_START_DT] [datetime] NULL,
	[OPT_END_DT] [datetime] NULL
) ON [PRIMARY]
GO
