USE [reporting]
GO
/****** Object:  Table [dbo].[ud_MC_OPTION]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_MC_OPTION](
	[OPT_ID] [int] NULL,
	[OPT_DESCRIPTION] [varchar](65) NULL,
	[ABBREVIATION] [char](8) NULL,
	[SUB_OPTIONS] [varchar](30) NULL,
	[ACTIVE] [smallint] NULL
) ON [PRIMARY]
GO
