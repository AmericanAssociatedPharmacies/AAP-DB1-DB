USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AprAdjUpdateSales]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AprAdjUpdateSales](
	[PMID] [nvarchar](255) NULL,
	[FirstOfCA#] [nvarchar](255) NULL,
	[FirstOfName] [nvarchar](255) NULL,
	[SumOfSales - COG Applied] [money] NULL,
	[SumOfNet Sales] [money] NULL,
	[SumOfRx Branded Sales] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[SumOfExcluded] [money] NULL,
	[SumOfOTC Sales] [money] NULL,
	[SumOfOther] [money] NULL,
	[Generic Source] [money] NULL
) ON [PRIMARY]
GO
