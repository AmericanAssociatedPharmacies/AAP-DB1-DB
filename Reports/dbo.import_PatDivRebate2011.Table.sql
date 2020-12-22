USE [Reports]
GO
/****** Object:  Table [dbo].[import_PatDivRebate2011]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PatDivRebate2011](
	[PMID] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[Total Patr Div] [money] NULL,
	[Pay in Apr] [money] NULL,
	[Pay in Jul] [money] NULL
) ON [PRIMARY]
GO
