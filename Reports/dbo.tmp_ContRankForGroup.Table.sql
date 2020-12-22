USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ContRankForGroup]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ContRankForGroup](
	[PMID] [int] NOT NULL,
	[ContForRank] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
