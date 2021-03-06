USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_WaltonRebates]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WaltonRebates](
	[DATE] [datetime] NULL,
	[SumOf Extended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL
) ON [PRIMARY]
GO
