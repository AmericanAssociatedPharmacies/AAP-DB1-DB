USE [Reports]
GO
/****** Object:  Table [dbo].[PM_APIAdminQ1_2010]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_APIAdminQ1_2010](
	[PMID] [int] NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Class] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[Total CA Sales] [money] NULL,
	[Non Net Sales] [money] NULL,
	[Vol Admin Fee] [money] NULL,
	[Total Brand Sales] [money] NULL,
	[Total Cardinal Source] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Generic Compliance Rebate] [money] NULL,
	[Front Loaded Accounts] [money] NULL,
	[Generic Rebate Paid] [money] NULL,
	[Total Rebate Received] [money] NULL,
	[Total Rebate to Pay Out] [money] NULL,
	[API ADMIN FEE] [money] NULL,
	[To Pay-API Cardinal Rebate] [money] NULL,
	[API P2-4331] [money] NULL,
	[CA-P2P3 Rebate] [money] NULL,
	[Leader Net Rebate] [money] NULL
) ON [PRIMARY]
GO
