USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2014_Pivot]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2014_Pivot](
	[PMID] [varchar](50) NULL,
	[AccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Jan] [money] NULL,
	[Feb] [money] NULL,
	[Mar] [money] NULL,
	[Apr] [money] NULL,
	[May] [money] NULL,
	[Jun] [money] NULL,
	[Jul] [money] NULL,
	[Aug] [money] NULL,
	[Sep] [money] NULL,
	[Oct] [money] NULL,
	[Nov] [money] NULL,
	[Dec] [money] NULL,
	[ExtSalesTotal] [money] NULL,
	[AnnualAdminFee] [money] NULL
) ON [PRIMARY]
GO
