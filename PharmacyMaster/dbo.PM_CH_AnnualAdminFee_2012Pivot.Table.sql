USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2012Pivot]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2012Pivot](
	[PMID] [nvarchar](255) NULL,
	[CA#] [nvarchar](255) NULL,
	[Cust Name] [nvarchar](255) NULL,
	[JAN 2012] [money] NULL,
	[FEB 2012] [money] NULL,
	[MAR 2012] [money] NULL,
	[APR 2012] [money] NULL,
	[MAY 2012] [money] NULL,
	[JUN 2012] [money] NULL,
	[JUL 2012] [money] NULL,
	[AUG 2012] [money] NULL,
	[SEP 2012] [money] NULL,
	[OCT 2012] [money] NULL,
	[NOV 2012] [money] NULL,
	[DEC 2012] [money] NULL,
	[Sum Extended Sales] [money] NULL,
	[Addl Admin Fee] [money] NULL,
	[Adj Admin Fee for negs] [money] NULL
) ON [PRIMARY]
GO
