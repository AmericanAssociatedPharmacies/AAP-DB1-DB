USE [Reports]
GO
/****** Object:  Table [dbo].[import_WA_CHRebate_replaced]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_WA_CHRebate_replaced](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[CHGroupNo] [nvarchar](255) NULL,
	[Avg Mo Src & P2P3 Generics] [money] NULL,
	[0-5k] [money] NULL,
	[5-10k] [money] NULL,
	[10-15k] [money] NULL,
	[15-25k] [money] NULL,
	[25-35k] [money] NULL,
	[35-45k] [money] NULL,
	[45-55k] [money] NULL,
	[55-75k] [money] NULL,
	[100+] [money] NULL,
	[Cumulative Rebate] [money] NULL,
	[Effective  Rebate %] [float] NULL,
	[HRTA] [float] NULL
) ON [PRIMARY]
GO
