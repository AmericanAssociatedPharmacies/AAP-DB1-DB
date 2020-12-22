USE [Reports]
GO
/****** Object:  Table [dbo].[import_APIGenericIncentive041311]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_APIGenericIncentive041311](
	[Acct#] [nvarchar](255) NULL,
	[apiaccountno] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[SumOf Generics] [float] NULL,
	[Generic Incentive] [float] NULL,
	[Territory] [nvarchar](255) NULL
) ON [PRIMARY]
GO
