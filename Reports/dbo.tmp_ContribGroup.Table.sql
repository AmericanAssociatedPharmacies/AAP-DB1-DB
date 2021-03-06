USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ContribGroup]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ContribGroup](
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ContactName] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[GenericAdminFee] [money] NULL,
	[APIAdminFee] [money] NULL,
	[TotalAdminFeeContrib] [money] NULL,
	[APIGenSales] [money] NULL,
	[GenericContrib] [money] NULL,
	[APIBrandSales] [money] NULL,
	[BrandContrib] [money] NULL,
	[APIOTCSales] [money] NULL,
	[OTCContrib] [money] NULL,
	[TotalCustContrib] [money] NULL,
	[TotalGroupContrib] [money] NULL,
	[GroupNo] [varchar](255) NULL,
	[Rank] [float] NULL,
	[TM] [varchar](255) NULL
) ON [PRIMARY]
GO
