USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_UD_Vol_rpt]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UD_Vol_rpt](
	[CHAccountNo] [varchar](50) NULL,
	[PMID] [int] NULL,
	[Aug 10 Gen Vol] [float] NULL,
	[Aug 10 Tot Vol] [float] NULL,
	[Sep 10 Gen Vol] [float] NULL,
	[Sep 10 Tot Vol] [float] NULL
) ON [PRIMARY]
GO
