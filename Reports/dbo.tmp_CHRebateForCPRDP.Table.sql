USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CHRebateForCPRDP]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHRebateForCPRDP](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL,
	[Group Rebate Pmts] [money] NULL,
	[Contract Performance Rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[MSI Rebate] [money] NULL,
	[ST] [nvarchar](255) NULL,
	[Sort Code] [nvarchar](255) NULL,
	[Payment method] [nvarchar](255) NULL
) ON [PRIMARY]
GO
