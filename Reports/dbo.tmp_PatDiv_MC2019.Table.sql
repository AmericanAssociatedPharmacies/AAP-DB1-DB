USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDiv_MC2019]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDiv_MC2019](
	[PMID] [varchar](50) NULL,
	[MCEFFECTIVEDATE] [datetime] NULL,
	[MCTERMINATIONDATE] [datetime] NULL,
	[MCNETWORK] [varchar](50) NULL
) ON [PRIMARY]
GO
