USE [Reports]
GO
/****** Object:  Table [dbo].[import_GenIncentive2012FinalSum]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GenIncentive2012FinalSum](
	[PMID] [int] NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[SMN] [nvarchar](255) NULL,
	[TotalGenerics] [money] NULL,
	[EligGenForRebage] [money] NULL,
	[GenIncentiveRebate] [money] NULL
) ON [PRIMARY]
GO
