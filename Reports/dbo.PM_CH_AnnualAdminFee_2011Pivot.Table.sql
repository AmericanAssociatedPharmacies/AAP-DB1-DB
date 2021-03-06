USE [Reports]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2011Pivot]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2011Pivot](
	[PMID] [varchar](50) NULL,
	[CAAcctNo] [varchar](50) NULL,
	[SumOfJan] [money] NULL,
	[SumOfFeb] [money] NULL,
	[SumOfMar] [money] NULL,
	[SumOfApr] [money] NULL,
	[SumOfMay] [money] NULL,
	[SumOfJun] [money] NULL,
	[SumOfJul] [money] NULL,
	[SumOfAug] [money] NULL,
	[SumOfSep] [money] NULL,
	[SumOfOct] [money] NULL,
	[SumOfNov] [money] NULL,
	[SumOfDec] [money] NULL,
	[ExtSales] [money] NULL
) ON [PRIMARY]
GO
