USE [Reports]
GO
/****** Object:  Table [dbo].[import_GenIncentive2013]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GenIncentive2013](
	[Acct#] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[Elig Generics for Rebate] [money] NULL,
	[Generic Loyalty Rebate] [money] NULL,
	[PMID] [nvarchar](255) NULL,
	[Cust NAME] [nvarchar](255) NULL
) ON [PRIMARY]
GO
