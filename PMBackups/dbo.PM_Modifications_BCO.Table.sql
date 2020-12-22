USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Modifications_BCO]    Script Date: 12/22/2020 4:47:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Modifications_BCO](
	[PMID] [int] NOT NULL,
	[ModDate] [datetime] NOT NULL,
	[ModType] [varchar](10) NULL,
	[Reason] [varchar](100) NULL
) ON [PRIMARY]
GO
