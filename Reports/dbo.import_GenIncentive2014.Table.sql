USE [Reports]
GO
/****** Object:  Table [dbo].[import_GenIncentive2014]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GenIncentive2014](
	[PMID] [int] NULL,
	[Acct#] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[Elig Generics for Rebate] [money] NULL,
	[Generic Loyalty Rebate] [money] NULL,
	[Cust NAME] [nvarchar](255) NULL,
	[Total Generics] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Check Fee] [money] NULL,
	[Net Generic Loyalty Rebate] [money] NULL,
	[Pay Account] [bit] NULL
) ON [PRIMARY]
GO
