USE [Reports]
GO
/****** Object:  Table [dbo].[PM_APIAdminQ4]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_APIAdminQ4](
	[Customer Name] [nvarchar](255) NULL,
	[Vol Admin Fee] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[PMID] [nvarchar](255) NULL,
	[GBR%] [float] NULL,
	[GBPA] [float] NULL,
	[Pay Account Yes-No] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Cardinal DC] [nvarchar](255) NULL,
	[Primary CA Acct#] [nvarchar](255) NULL,
	[Common Location] [nvarchar](255) NULL,
	[API Net Sales] [money] NULL,
	[API Admin Fee] [money] NULL,
	[API Sales-COG Applied] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Generic Rx] [money] NULL,
	[API Total Source] [money] NULL,
	[API Total P2P3] [money] NULL,
	[P2P3 Rebate] [money] NULL,
	[API Total Generics] [money] NULL,
	[Calculated Generic Rebate] [money] NULL,
	[Front Loaded] [nvarchar](255) NULL,
	[Amt Withheld for Front Load] [money] NULL,
	[Generic Rebate Due] [money] NULL,
	[Generic Rebate pd by CAH] [money] NULL,
	[Variance] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Rebate to Pay Account] [money] NULL
) ON [PRIMARY]
GO
