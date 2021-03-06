USE [Reports]
GO
/****** Object:  Table [dbo].[import_CHRebate0411]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHRebate0411](
	[Marker] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
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
	[Leader Rebate] [money] NULL,
	[MSI Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL,
	[Sort Code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
