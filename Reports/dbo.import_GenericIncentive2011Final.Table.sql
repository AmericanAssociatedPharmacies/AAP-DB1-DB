USE [Reports]
GO
/****** Object:  Table [dbo].[import_GenericIncentive2011Final]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GenericIncentive2011Final](
	[PMID] [int] NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[NAME] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[Generics] [money] NULL,
	[GxL Incentive] [float] NULL,
	[Percentage] [float] NULL
) ON [PRIMARY]
GO
