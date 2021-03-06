USE [Reports]
GO
/****** Object:  Table [dbo].[import_RebateCAAnnualAdminFeePivot]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_RebateCAAnnualAdminFeePivot](
	[Year] [varchar](50) NULL,
	[PMID] [varchar](255) NULL,
	[CAAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](255) NULL,
	[January] [money] NULL,
	[February] [money] NULL,
	[March] [money] NULL,
	[April] [money] NULL,
	[May] [money] NULL,
	[June] [money] NULL,
	[July] [money] NULL,
	[August] [money] NULL,
	[September] [money] NULL,
	[October] [money] NULL,
	[November] [money] NULL,
	[December] [money] NULL,
	[ExtSales] [money] NULL,
	[AnnualAdminFee] [money] NULL
) ON [PRIMARY]
GO
