USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_SalesByCustomer#]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SalesByCustomer#](
	[TM] [varchar](4) NULL,
	[PMID] [int] NOT NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[APIEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[AccountDBAName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Date] [datetime] NULL,
	[APIGenericUnits] [int] NULL,
	[APIGenericSales] [float] NULL,
	[APIBrandUnits] [int] NULL,
	[APIBrandSales] [float] NULL,
	[DaysOrderedAPI] [int] NULL,
	[CAHGenericUnits] [int] NULL,
	[CAHGenericSales] [float] NULL,
	[CAHBrandUnits] [int] NULL,
	[CAHBrandSales] [float] NULL,
	[APIAudited] [varchar](1) NULL,
	[CAHAudited] [varchar](1) NULL
) ON [PRIMARY]
GO
