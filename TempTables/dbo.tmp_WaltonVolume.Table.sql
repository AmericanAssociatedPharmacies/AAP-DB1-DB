USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_WaltonVolume]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WaltonVolume](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[SumOfSales - COG Applied] [money] NULL,
	[SumOfNet Sales] [money] NULL,
	[SumOfRx Branded Sales] [money] NULL,
	[SumOfTot Generics w excluded] [money] NULL,
	[SumOfExcluded Gen] [money] NULL,
	[SumOfTop Generics Source] [money] NULL,
	[SumOfAAP Source] [money] NULL,
	[SumOfSource Backup] [money] NULL,
	[SumOfTot Generic Source] [money] NULL,
	[SumOfOTC Sales] [money] NULL,
	[SumOfOther] [money] NULL
) ON [PRIMARY]
GO
