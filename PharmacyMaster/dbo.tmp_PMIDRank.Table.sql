USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_PMIDRank]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PMIDRank](
	[Rank] [bigint] NULL,
	[PMID] [int] NOT NULL
) ON [PRIMARY]
GO
