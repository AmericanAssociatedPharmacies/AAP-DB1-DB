USE [TempTables]
GO
/****** Object:  Table [dbo].[rebates_CH0210Final]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebates_CH0210Final](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL
) ON [PRIMARY]
GO
