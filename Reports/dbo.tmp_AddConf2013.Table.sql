USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AddConf2013]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AddConf2013](
	[PMID] [int] NULL,
	[Territory] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[CreditNo] [varchar](50) NULL,
	[RebateAmt] [money] NULL
) ON [PRIMARY]
GO
