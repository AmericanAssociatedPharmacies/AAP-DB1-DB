USE [Reports]
GO
/****** Object:  Table [dbo].[CH_AnnualAdminFee]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_AnnualAdminFee](
	[PMID] [varchar](50) NULL,
	[Leval] [varchar](50) NULL,
	[Affiliate] [varchar](255) NULL,
	[CANo] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[Addr] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Store] [varchar](255) NULL,
	[Jan] [float] NULL,
	[Feb] [float] NULL,
	[Mar] [float] NULL,
	[Apr] [float] NULL,
	[May] [float] NULL,
	[Jun] [float] NULL,
	[Jul] [float] NULL,
	[Aug] [float] NULL,
	[Sep] [float] NULL,
	[Oct] [float] NULL,
	[Nov] [float] NULL,
	[Dec] [float] NULL,
	[ExtSales] [float] NULL,
	[CalcAdminFee] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
