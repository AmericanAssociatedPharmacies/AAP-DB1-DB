USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_COGS_report]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COGS_report](
	[ship to number] [float] NULL,
	[UDacct] [varchar](4) NULL,
	[COGS0608] [float] NULL,
	[COGS1208] [float] NULL
) ON [PRIMARY]
GO
