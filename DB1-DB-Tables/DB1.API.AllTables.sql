USE [API]
GO
/****** Object:  Table [Archive].[APIPricing]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APIPricing](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[APIItemNum] [varchar](25) NOT NULL,
	[NDC] [varchar](15) NOT NULL,
	[DrugName] [varchar](100) NULL,
	[IsControl] [bit] NOT NULL,
	[IsC2Control] [bit] NOT NULL,
	[CustomerInvoicePrice] [numeric](18, 2) NULL,
	[Created] [date] NULL,
	[BrandName] [varchar](50) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[APISalesDetail]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APISalesDetail](
	[ID] [int] NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowVersionID] [varbinary](8) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[PMID] [int] NULL,
 CONSTRAINT [PK_Archive_apisalesdetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_HoldbackPercent]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_HoldbackPercent](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[HoldbackPercent] [decimal](18, 4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_090710]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_090710](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_bkp](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_bkp_082010]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_bkp_082010](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_bkp_110112]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_bkp_110112](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_bkp110310]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_bkp110310](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_bkp20180307]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_bkp20180307](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_test]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_test](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_S2K_20200813_3]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_S2K_20200813_3](
	[INVNBR] [numeric](9, 0) NOT NULL,
	[INVLINE] [numeric](4, 0) NOT NULL,
	[CUSTNBR] [char](7) NOT NULL,
	[CUST] [char](30) NOT NULL,
	[ITEMNO] [char](20) NOT NULL,
	[ITEM] [char](30) NOT NULL,
	[NDC] [char](13) NOT NULL,
	[QTY] [numeric](9, 2) NOT NULL,
	[ITEMAMT] [numeric](20, 6) NOT NULL,
	[ITEMGRP] [varchar](3) NOT NULL,
	[ACCTGRP] [varchar](3) NOT NULL,
	[SLSMAN] [numeric](5, 0) NOT NULL,
	[INVDATE] [numeric](8, 0) NOT NULL,
	[LINEAMT] [numeric](20, 6) NOT NULL,
	[EXTSALES] [numeric](20, 6) NOT NULL,
	[SALESORD] [numeric](9, 0) NOT NULL,
	[IDTYPP] [char](1) NOT NULL,
	[REBATE] [numeric](15, 4) NOT NULL,
	[IDPAGR] [numeric](4, 0) NOT NULL,
	[DISCOUNTPERCENTAGE] [numeric](16, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_SalesMTD]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_SalesMTD](
	[APIAccountNo] [varchar](32) NOT NULL,
	[PMID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[BrandSales] [numeric](18, 2) NULL,
	[GenericSales] [numeric](18, 2) NULL,
	[OTCSales] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_Sum_LineAmt_Mnthly]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Sum_LineAmt_Mnthly](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY] [numeric](18, 2) NULL,
	[FEBRUARY] [numeric](18, 2) NULL,
	[MARCH] [numeric](18, 2) NULL,
	[APRIL] [numeric](18, 2) NULL,
	[MAY] [numeric](18, 2) NULL,
	[JUNE] [numeric](18, 2) NULL,
	[JULY] [numeric](18, 2) NULL,
	[AUGUST] [numeric](18, 2) NULL,
	[SEPTEMBER] [numeric](18, 2) NULL,
	[OCTOBER] [numeric](18, 2) NULL,
	[NOVEMBER] [numeric](18, 2) NULL,
	[DECEMBER] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_Sum_Totamt_Mnthly]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Sum_Totamt_Mnthly](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY] [numeric](18, 2) NULL,
	[FEBRUARY] [numeric](18, 2) NULL,
	[MARCH] [numeric](18, 2) NULL,
	[APRIL] [numeric](18, 2) NULL,
	[MAY] [numeric](18, 2) NULL,
	[JUNE] [numeric](18, 2) NULL,
	[JULY] [numeric](18, 2) NULL,
	[AUGUST] [numeric](18, 2) NULL,
	[SEPTEMBER] [numeric](18, 2) NULL,
	[OCTOBER] [numeric](18, 2) NULL,
	[NOVEMBER] [numeric](18, 2) NULL,
	[DECEMBER] [numeric](18, 2) NULL,
 CONSTRAINT [PK_API_Sum_Totamt_Mnthly] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_Sum_Totamt_Mnthly_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Sum_Totamt_Mnthly_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY] [numeric](18, 2) NULL,
	[FEBRUARY] [numeric](18, 2) NULL,
	[MARCH] [numeric](18, 2) NULL,
	[APRIL] [numeric](18, 2) NULL,
	[MAY] [numeric](18, 2) NULL,
	[JUNE] [numeric](18, 2) NULL,
	[JULY] [numeric](18, 2) NULL,
	[AUGUST] [numeric](18, 2) NULL,
	[SEPTEMBER] [numeric](18, 2) NULL,
	[OCTOBER] [numeric](18, 2) NULL,
	[NOVEMBER] [numeric](18, 2) NULL,
	[DECEMBER] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_Sum_Totamt_Mnthly_test_del]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Sum_Totamt_Mnthly_test_del](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY] [numeric](18, 2) NULL,
	[FEBRUARY] [numeric](18, 2) NULL,
	[MARCH] [numeric](18, 2) NULL,
	[APRIL] [numeric](18, 2) NULL,
	[MAY] [numeric](18, 2) NULL,
	[JUNE] [numeric](18, 2) NULL,
	[JULY] [numeric](18, 2) NULL,
	[AUGUST] [numeric](18, 2) NULL,
	[SEPTEMBER] [numeric](18, 2) NULL,
	[OCTOBER] [numeric](18, 2) NULL,
	[NOVEMBER] [numeric](18, 2) NULL,
	[DECEMBER] [numeric](18, 2) NULL,
	[JANUARY_GEN] [numeric](18, 2) NULL,
	[FEBRUARY_GEN] [numeric](18, 2) NULL,
	[MARCH_GEN] [numeric](18, 2) NULL,
	[APRIL_GEN] [numeric](18, 2) NULL,
	[MAY_GEN] [numeric](18, 2) NULL,
	[JUNE_GEN] [numeric](18, 2) NULL,
	[JULY_GEN] [numeric](18, 2) NULL,
	[AUGUST_GEN] [numeric](18, 2) NULL,
	[SEPTEMBER_GEN] [numeric](18, 2) NULL,
	[OCTOBER_GEN] [numeric](18, 2) NULL,
	[NOVEMBER_GEN] [numeric](18, 2) NULL,
	[DECEMBER_GEN] [numeric](18, 2) NULL,
	[JANUARY_BR] [numeric](18, 2) NULL,
	[FEBRUARY_BR] [numeric](18, 2) NULL,
	[MARCH_BR] [numeric](18, 2) NULL,
	[APRIL_BR] [numeric](18, 2) NULL,
	[MAY_BR] [numeric](18, 2) NULL,
	[JUNE_BR] [numeric](18, 2) NULL,
	[JULY_BR] [numeric](18, 2) NULL,
	[AUGUST_BR] [numeric](18, 2) NULL,
	[SEPTEMBER_BR] [numeric](18, 2) NULL,
	[OCTOBER_BR] [numeric](18, 2) NULL,
	[NOVEMBER_BR] [numeric](18, 2) NULL,
	[DECEMBER_BR] [numeric](18, 2) NULL,
	[JANUARY_OTC] [numeric](18, 2) NULL,
	[FEBRUARY_OTC] [numeric](18, 2) NULL,
	[MARCH_OTC] [numeric](18, 2) NULL,
	[APRIL_OTC] [numeric](18, 2) NULL,
	[MAY_OTC] [numeric](18, 2) NULL,
	[JUNE_OTC] [numeric](18, 2) NULL,
	[JULY_OTC] [numeric](18, 2) NULL,
	[AUGUST_OTC] [numeric](18, 2) NULL,
	[SEPTEMBER_OTC] [numeric](18, 2) NULL,
	[OCTOBER_OTC] [numeric](18, 2) NULL,
	[NOVEMBER_OTC] [numeric](18, 2) NULL,
	[DECEMBER_OTC] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_WHSales_LineAmt_ByType]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WHSales_LineAmt_ByType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY_OTC] [numeric](18, 2) NULL,
	[FEBRUARY_OTC] [numeric](18, 2) NULL,
	[MARCH_OTC] [numeric](18, 2) NULL,
	[APRIL_OTC] [numeric](18, 2) NULL,
	[MAY_OTC] [numeric](18, 2) NULL,
	[JUNE_OTC] [numeric](18, 2) NULL,
	[JULY_OTC] [numeric](18, 2) NULL,
	[AUGUST_OTC] [numeric](18, 2) NULL,
	[SEPTEMBER_OTC] [numeric](18, 2) NULL,
	[OCTOBER_OTC] [numeric](18, 2) NULL,
	[NOVEMBER_OTC] [numeric](18, 2) NULL,
	[DECEMBER_OTC] [numeric](18, 2) NULL,
	[JANUARY_BR] [numeric](18, 2) NULL,
	[FEBRUARY_BR] [numeric](18, 2) NULL,
	[MARCH_BR] [numeric](18, 2) NULL,
	[APRIL_BR] [numeric](18, 2) NULL,
	[MAY_BR] [numeric](18, 2) NULL,
	[JUNE_BR] [numeric](18, 2) NULL,
	[JULY_BR] [numeric](18, 2) NULL,
	[AUGUST_BR] [numeric](18, 2) NULL,
	[SEPTEMBER_BR] [numeric](18, 2) NULL,
	[OCTOBER_BR] [numeric](18, 2) NULL,
	[NOVEMBER_BR] [numeric](18, 2) NULL,
	[DECEMBER_BR] [numeric](18, 2) NULL,
	[JANUARY_GEN] [numeric](18, 2) NULL,
	[FEBRUARY_GEN] [numeric](18, 2) NULL,
	[MARCH_GEN] [numeric](18, 2) NULL,
	[APRIL_GEN] [numeric](18, 2) NULL,
	[MAY_GEN] [numeric](18, 2) NULL,
	[JUNE_GEN] [numeric](18, 2) NULL,
	[JULY_GEN] [numeric](18, 2) NULL,
	[AUGUST_GEN] [numeric](18, 2) NULL,
	[SEPTEMBER_GEN] [numeric](18, 2) NULL,
	[OCTOBER_GEN] [numeric](18, 2) NULL,
	[NOVEMBER_GEN] [numeric](18, 2) NULL,
	[DECEMBER_GEN] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_WHSales_Mnthly_ByType]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WHSales_Mnthly_ByType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY_OTC] [numeric](18, 2) NULL,
	[FEBRUARY_OTC] [numeric](18, 2) NULL,
	[MARCH_OTC] [numeric](18, 2) NULL,
	[APRIL_OTC] [numeric](18, 2) NULL,
	[MAY_OTC] [numeric](18, 2) NULL,
	[JUNE_OTC] [numeric](18, 2) NULL,
	[JULY_OTC] [numeric](18, 2) NULL,
	[AUGUST_OTC] [numeric](18, 2) NULL,
	[SEPTEMBER_OTC] [numeric](18, 2) NULL,
	[OCTOBER_OTC] [numeric](18, 2) NULL,
	[NOVEMBER_OTC] [numeric](18, 2) NULL,
	[DECEMBER_OTC] [numeric](18, 2) NULL,
	[JANUARY_BR] [numeric](18, 2) NULL,
	[FEBRUARY_BR] [numeric](18, 2) NULL,
	[MARCH_BR] [numeric](18, 2) NULL,
	[APRIL_BR] [numeric](18, 2) NULL,
	[MAY_BR] [numeric](18, 2) NULL,
	[JUNE_BR] [numeric](18, 2) NULL,
	[JULY_BR] [numeric](18, 2) NULL,
	[AUGUST_BR] [numeric](18, 2) NULL,
	[SEPTEMBER_BR] [numeric](18, 2) NULL,
	[OCTOBER_BR] [numeric](18, 2) NULL,
	[NOVEMBER_BR] [numeric](18, 2) NULL,
	[DECEMBER_BR] [numeric](18, 2) NULL,
	[JANUARY_GEN] [numeric](18, 2) NULL,
	[FEBRUARY_GEN] [numeric](18, 2) NULL,
	[MARCH_GEN] [numeric](18, 2) NULL,
	[APRIL_GEN] [numeric](18, 2) NULL,
	[MAY_GEN] [numeric](18, 2) NULL,
	[JUNE_GEN] [numeric](18, 2) NULL,
	[JULY_GEN] [numeric](18, 2) NULL,
	[AUGUST_GEN] [numeric](18, 2) NULL,
	[SEPTEMBER_GEN] [numeric](18, 2) NULL,
	[OCTOBER_GEN] [numeric](18, 2) NULL,
	[NOVEMBER_GEN] [numeric](18, 2) NULL,
	[DECEMBER_GEN] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_WHSales_Mnthly_ByType_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WHSales_Mnthly_ByType_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY_OTC] [numeric](18, 2) NULL,
	[FEBRUARY_OTC] [numeric](18, 2) NULL,
	[MARCH_OTC] [numeric](18, 2) NULL,
	[APRIL_OTC] [numeric](18, 2) NULL,
	[MAY_OTC] [numeric](18, 2) NULL,
	[JUNE_OTC] [numeric](18, 2) NULL,
	[JULY_OTC] [numeric](18, 2) NULL,
	[AUGUST_OTC] [numeric](18, 2) NULL,
	[SEPTEMBER_OTC] [numeric](18, 2) NULL,
	[OCTOBER_OTC] [numeric](18, 2) NULL,
	[NOVEMBER_OTC] [numeric](18, 2) NULL,
	[DECEMBER_OTC] [numeric](18, 2) NULL,
	[JANUARY_BR] [numeric](18, 2) NULL,
	[FEBRUARY_BR] [numeric](18, 2) NULL,
	[MARCH_BR] [numeric](18, 2) NULL,
	[APRIL_BR] [numeric](18, 2) NULL,
	[MAY_BR] [numeric](18, 2) NULL,
	[JUNE_BR] [numeric](18, 2) NULL,
	[JULY_BR] [numeric](18, 2) NULL,
	[AUGUST_BR] [numeric](18, 2) NULL,
	[SEPTEMBER_BR] [numeric](18, 2) NULL,
	[OCTOBER_BR] [numeric](18, 2) NULL,
	[NOVEMBER_BR] [numeric](18, 2) NULL,
	[DECEMBER_BR] [numeric](18, 2) NULL,
	[JANUARY_GEN] [numeric](18, 2) NULL,
	[FEBRUARY_GEN] [numeric](18, 2) NULL,
	[MARCH_GEN] [numeric](18, 2) NULL,
	[APRIL_GEN] [numeric](18, 2) NULL,
	[MAY_GEN] [numeric](18, 2) NULL,
	[JUNE_GEN] [numeric](18, 2) NULL,
	[JULY_GEN] [numeric](18, 2) NULL,
	[AUGUST_GEN] [numeric](18, 2) NULL,
	[SEPTEMBER_GEN] [numeric](18, 2) NULL,
	[OCTOBER_GEN] [numeric](18, 2) NULL,
	[NOVEMBER_GEN] [numeric](18, 2) NULL,
	[DECEMBER_GEN] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIAccountMaster_Orig]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAccountMaster_Orig](
	[AccountMasterID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Territory] [varchar](4) NULL,
	[QPS] [varchar](4) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[BusinessClass] [varchar](4) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[DateOpened] [datetime] NULL,
	[OrigStartDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[FedID] [varchar](12) NULL,
	[Status] [varchar](32) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[ContractDate] [datetime] NULL,
	[Source] [varchar](25) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[AllowDupDEA] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apiaccountmaster_orig_052410]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apiaccountmaster_orig_052410](
	[AccountMasterID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Territory] [varchar](4) NULL,
	[QPS] [varchar](4) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[BusinessClass] [varchar](4) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[DateOpened] [datetime] NULL,
	[OrigStartDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[FedID] [varchar](12) NULL,
	[Status] [varchar](32) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[ContractDate] [datetime] NULL,
	[Source] [varchar](25) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[AllowDupDEA] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIAccountMaster_Orig_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAccountMaster_Orig_bkp](
	[AccountMasterID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Territory] [varchar](4) NULL,
	[QPS] [varchar](4) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[BusinessClass] [varchar](4) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[DateOpened] [datetime] NULL,
	[OrigStartDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[FedID] [varchar](12) NULL,
	[Status] [varchar](32) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[ContractDate] [datetime] NULL,
	[Source] [varchar](25) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[AllowDupDEA] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIAccountMaster_Orig_BKP060611_B4ChangeRun]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAccountMaster_Orig_BKP060611_B4ChangeRun](
	[AccountMasterID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Territory] [varchar](4) NULL,
	[QPS] [varchar](4) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[BusinessClass] [varchar](4) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[DateOpened] [datetime] NULL,
	[OrigStartDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[FedID] [varchar](12) NULL,
	[Status] [varchar](32) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[ContractDate] [datetime] NULL,
	[Source] [varchar](25) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[AllowDupDEA] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIAcctGrp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAcctGrp](
	[AcctGrp] [varchar](50) NULL,
	[Description] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIBusCls]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIBusCls](
	[BUSCLS] [varchar](5) NULL,
	[Description] [varchar](125) NULL,
	[Type] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apibuscls_chg]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apibuscls_chg](
	[BUSCLS] [varchar](5) NULL,
	[Description] [varchar](125) NULL,
	[Type] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APICardVolume]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICardVolume](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Year] [int] NULL,
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[CardinalNo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[January] [numeric](18, 2) NULL,
	[February] [numeric](18, 2) NULL,
	[March] [numeric](18, 2) NULL,
	[April] [numeric](18, 2) NULL,
	[May] [numeric](18, 2) NULL,
	[June] [numeric](18, 2) NULL,
	[July] [numeric](18, 2) NULL,
	[August] [numeric](18, 2) NULL,
	[September] [numeric](18, 2) NULL,
	[October] [numeric](18, 2) NULL,
	[November] [numeric](18, 2) NULL,
	[December] [numeric](18, 2) NULL,
 CONSTRAINT [PK_APICardVolume] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apicardvolume_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apicardvolume_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[CardinalNo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[January] [numeric](18, 2) NULL,
	[February] [numeric](18, 2) NULL,
	[March] [numeric](18, 2) NULL,
	[April] [numeric](18, 2) NULL,
	[May] [numeric](18, 2) NULL,
	[June] [numeric](18, 2) NULL,
	[July] [numeric](18, 2) NULL,
	[August] [numeric](18, 2) NULL,
	[September] [numeric](18, 2) NULL,
	[October] [numeric](18, 2) NULL,
	[November] [numeric](18, 2) NULL,
	[December] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APICardWHSalesQ409]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICardWHSalesQ409](
	[Territory] [varchar](10) NULL,
	[APIAccountNo] [varchar](15) NULL,
	[Name] [varchar](255) NULL,
	[OctBr] [numeric](18, 2) NULL,
	[OctGen] [numeric](18, 2) NULL,
	[OctOTC] [numeric](18, 2) NULL,
	[OctSales] [numeric](18, 2) NULL,
	[NovBr] [numeric](18, 2) NULL,
	[NovGen] [numeric](18, 2) NULL,
	[NovOTC] [numeric](18, 2) NULL,
	[NovSales] [numeric](18, 2) NULL,
	[DecBr] [numeric](18, 2) NULL,
	[DecGen] [numeric](18, 2) NULL,
	[DecOTC] [numeric](18, 2) NULL,
	[DecSales] [numeric](18, 2) NULL,
	[TotalBrands] [numeric](18, 2) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[TotalOTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL,
	[OctCardinalSales] [numeric](18, 2) NULL,
	[NovCardinalSales] [numeric](18, 2) NULL,
	[DecCardinalSales] [numeric](18, 2) NULL,
	[TotalCardinalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIContactName_del]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIContactName_del](
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[ContactFromAPI] [varchar](100) NULL,
	[Email] [varchar](75) NULL,
	[DEA] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APICustomerNonExist]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICustomerNonExist](
	[APIAccountNo] [varchar](50) NULL,
	[APICustomerStatus] [varchar](5) NULL,
	[APIType] [varchar](5) NULL,
	[APIAccountName] [varchar](250) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](4) NULL,
	[Zip] [varchar](20) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](75) NULL,
	[MemNum] [varchar](12) NULL,
	[NCPDP] [varchar](7) NULL,
	[NPI] [varchar](20) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Territory] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apicustomers]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apicustomers](
	[APIAccountNo] [varchar](50) NULL,
	[APICustomerStatus] [varchar](5) NULL,
	[APIType] [varchar](5) NULL,
	[APIAccountName] [varchar](250) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](4) NULL,
	[Zip] [varchar](20) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](75) NULL,
	[MemNum] [varchar](12) NULL,
	[NCPDP] [varchar](7) NULL,
	[NPI] [varchar](20) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Territory] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apicustomersAI]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apicustomersAI](
	[APIAccountNo] [varchar](50) NULL,
	[APICustomerStatus] [varchar](5) NULL,
	[APIType] [varchar](5) NULL,
	[APIAccountName] [varchar](250) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](4) NULL,
	[Zip] [varchar](20) NULL,
	[Contact] [varchar](50) NULL,
	[Email] [varchar](75) NULL,
	[MemNum] [varchar](12) NULL,
	[NCPDP] [varchar](7) NULL,
	[NPI] [varchar](20) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Territory] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APICustomersExist]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICustomersExist](
	[APIAccountNo] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[MemNum] [varchar](12) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Territory] [varchar](5) NULL,
	[DeleteStatus] [varchar](5) NULL,
	[Type] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APICustomersExistAI]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICustomersExistAI](
	[APIAccountNo] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[MemNum] [varchar](12) NULL,
	[EffectiveDate] [datetime] NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[DEA] [varchar](50) NULL,
	[CustomerStatus] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[Territory] [varchar](5) NULL,
	[DeleteStatus] [varchar](5) NULL,
	[Type] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIDailySummary]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIDailySummary](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[API#] [varchar](10) NULL,
	[InvDate] [datetime] NULL,
	[InvDateKey] [int] NULL,
	[OrderType] [varchar](15) NULL,
	[DailySales] [money] NULL,
	[OrderedUnits] [int] NULL,
	[RowCreateDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_APIDailySummary] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_APIDailySummary_APINum_InvDateKey] UNIQUE NONCLUSTERED 
(
	[API#] ASC,
	[InvDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIItemGrp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIItemGrp](
	[ItemGrp] [varchar](50) NULL,
	[Description] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIOrder]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIOrder](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](30) NOT NULL,
	[API_Item_Number] [varchar](30) NOT NULL,
	[Quantity] [numeric](18, 2) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ItemDesc] [varchar](500) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIOrder_BK20190730]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIOrder_BK20190730](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](30) NOT NULL,
	[API_Item_Number] [varchar](30) NOT NULL,
	[Quantity] [numeric](18, 2) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ItemDesc] [varchar](500) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_APIOrder] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIPricing_20201109]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPricing_20201109](
	[RowID] [int] NOT NULL,
	[APIItemNum] [varchar](25) NOT NULL,
	[NDC] [varchar](15) NOT NULL,
	[DrugName] [varchar](100) NULL,
	[IsControl] [bit] NOT NULL,
	[IsC2Control] [bit] NOT NULL,
	[CustomerInvoicePrice] [numeric](18, 2) NULL,
	[Created] [date] NULL,
	[BrandName] [varchar](50) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL,
	[PS] [numeric](8, 3) NULL,
	[GPI] [varchar](14) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIPricing_DW1_20200914]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPricing_DW1_20200914](
	[EffectiveDate] [date] NULL,
	[APICustomerInvoicePrice] [money] NULL,
	[RebateAmt] [money] NULL,
	[NDC] [varchar](11) NULL,
	[APIItemNum] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIPricing_new]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPricing_new](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[APIItemNum] [varchar](25) NOT NULL,
	[NDC] [varchar](15) NOT NULL,
	[DrugName] [varchar](100) NULL,
	[IsControl] [bit] NOT NULL,
	[IsC2Control] [bit] NOT NULL,
	[CustomerInvoicePrice] [numeric](18, 2) NULL,
	[Created] [date] NULL,
	[BrandName] [varchar](50) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL,
 CONSTRAINT [CPK_APIPricing] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIQ409Verify]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIQ409Verify](
	[WHAccountID] [varchar](32) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[Item] [varchar](125) NULL,
	[AcctGrp] [varchar](5) NULL,
	[ItemDescription] [varchar](125) NULL,
	[QTY] [numeric](18, 2) NULL,
	[SalesPrice] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[InvDate] [datetime] NULL,
	[InvNbr] [varchar](15) NULL,
	[OrdCls] [nvarchar](255) NULL,
	[AdminGrp] [varchar](50) NULL,
	[Territory] [varchar](5) NULL,
	[F14] [varchar](50) NULL,
	[F15] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apisaledetail_bkp090810]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apisaledetail_bkp090810](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL,
 CONSTRAINT [PK_apisalesdetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apisalesdetail_BeforeChange]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apisalesdetail_BeforeChange](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [int] NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[TotalAmount] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Delete_DW]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Delete_DW](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[WHAccountID] [varchar](100) NULL,
	[InvNumber] [varchar](250) NULL,
	[InvDate] [datetime] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_DW1]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_DW1](
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_HB]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_HB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [decimal](18, 4) NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Nov2020_backup_20201202]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Nov2020_backup_20201202](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_NovDups_20201202]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_NovDups_20201202](
	[RN] [bigint] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_NovExactDups_20201203]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_NovExactDups_20201203](
	[RN] [bigint] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Oct2020_backup_20201202]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Oct2020_backup_20201202](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Report]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Report](
	[ID] [int] NOT NULL,
	[InvDate] [datetime] NOT NULL,
	[WHAccountID] [varchar](8) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_APISalesDetail_Report] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[InvDate] ASC,
	[WHAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Report_2]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Report_2](
	[WHAccountID] [varchar](8) NOT NULL,
	[MinInvDate] [datetime] NULL,
	[MaxInvDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_StillReturns_20201122]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_StillReturns_20201122](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apisalesdetailBU071210]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apisalesdetailBU071210](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetailID]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetailID](
	[RowID] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesInvoice]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [varchar](32) NULL,
	[OrderNbr] [varchar](15) NULL,
	[InvDate] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[CustomerName] [varchar](255) NULL,
	[CarrierCode] [varchar](15) NULL,
	[CarrierDesc] [varchar](255) NULL,
	[CustomerRef] [varchar](255) NULL,
	[Whsnum] [varchar](2) NULL,
	[OrdType] [varchar](2) NULL,
	[DateLoaded] [datetime] NULL,
 CONSTRAINT [PK_APISalesInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesInvoice_Delete_DW]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_Delete_DW](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[WHAccountID] [varchar](100) NULL,
	[OrderNumber] [varchar](25) NULL,
	[InvNbr] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_APISalesInvoice_Delete_DW] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesInvoice_DW1]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_DW1](
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesNDC_MO]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesNDC_MO](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Type] [varchar](20) NULL,
	[JANUARY] [float] NULL,
	[FEBRUARY] [float] NULL,
	[MARCH] [float] NULL,
	[APRIL] [float] NULL,
	[MAY] [float] NULL,
	[JUNE] [float] NULL,
	[JULY] [float] NULL,
	[AUGUST] [float] NULL,
	[SEPTEMBER] [float] NULL,
	[OCTOBER] [float] NULL,
	[NOVEMBER] [float] NULL,
	[DECEMBER] [float] NULL,
	[january_st_cnt] [int] NULL,
	[february_st_cnt] [int] NULL,
	[march_st_cnt] [int] NULL,
	[april_st_cnt] [int] NULL,
	[may_st_cnt] [int] NULL,
	[june_st_cnt] [int] NULL,
	[july_st_cnt] [int] NULL,
	[august_st_cnt] [int] NULL,
	[september_st_cnt] [int] NULL,
	[october_st_cnt] [int] NULL,
	[november_st_cnt] [int] NULL,
	[december_st_cnt] [int] NULL,
 CONSTRAINT [PK_APISalesNDC_MO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesNDC_QTR]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesNDC_QTR](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Type] [varchar](20) NULL,
	[Q1] [float] NULL,
	[Q2] [float] NULL,
	[Q3] [float] NULL,
	[Q4] [float] NULL,
	[Q1_st_cnt] [int] NULL,
	[Q2_st_cnt] [int] NULL,
	[Q3_st_cnt] [int] NULL,
	[Q4_st_cnt] [int] NULL,
 CONSTRAINT [PK_APISalesNDC_QTR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AS400DrugType]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AS400DrugType](
	[AccountGroupID] [varchar](10) NULL,
	[ItemGroupID] [varchar](10) NULL,
	[DrugType] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_DB1_20180821]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_DB1_20180821](
	[NDC] [varchar](11) NULL,
	[Mnth] [int] NULL,
	[Yr] [int] NULL,
	[Unit] [varchar](2) NULL,
	[PS] [numeric](8, 3) NULL,
	[Qty] [numeric](38, 2) NULL,
	[TotalDose] [numeric](38, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSOS_Error]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_Error](
	[ErrorId] [int] IDENTITY(1,1) NOT NULL,
	[XmlFrmLegisym] [xml] NULL,
	[LegisymFileName] [nvarchar](350) NULL,
	[ServiceContract] [nvarchar](45) NULL,
 CONSTRAINT [PK_CSOS_Error] PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSOS_OrderDispositionFrmAPI]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_OrderDispositionFrmAPI](
	[OrderDispositionFrmAPIId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchemaVersion] [nvarchar](35) NULL,
	[DatePreparedStr] [nvarchar](25) NULL,
	[DatePrepared] [smalldatetime] NULL,
	[TimePrepared] [nvarchar](25) NULL,
	[ServiceContract] [nvarchar](45) NULL,
	[Express222OrderId] [int] NOT NULL,
	[TrackingNumber] [nvarchar](15) NULL,
	[LineId] [int] NULL,
	[DispositionDateStr] [nvarchar](25) NULL,
	[DispositionDate] [smalldatetime] NULL,
	[DispositionType] [nvarchar](25) NULL,
	[Quantity] [int] NULL,
	[StockCode] [nvarchar](20) NULL,
	[NdcNumber] [nvarchar](11) NULL,
	[Status] [nvarchar](30) NULL,
	[XmlToLegisym] [xml] NULL,
 CONSTRAINT [PK_CSOSOrderDispositionFrmAPI] PRIMARY KEY CLUSTERED 
(
	[OrderDispositionFrmAPIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSOS_SalesOrderFrmLegisym]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_SalesOrderFrmLegisym](
	[SalesOrderFrmLegisymId] [bigint] IDENTITY(1,1) NOT NULL,
	[DatePrepared] [smalldatetime] NULL,
	[TimePrepared] [nvarchar](30) NULL,
	[System] [nvarchar](20) NULL,
	[Version] [nvarchar](20) NULL,
	[Express222OrderID] [int] NOT NULL,
	[ServiceContract] [nvarchar](45) NULL,
	[TransmissionCustomData] [nvarchar](500) NULL,
	[ProcessState] [nvarchar](30) NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[SupplierAddress1] [varchar](255) NOT NULL,
	[SupplierAddress2] [varchar](255) NULL,
	[SupplierAddress3] [varchar](255) NULL,
	[SupplierCity] [varchar](255) NOT NULL,
	[SupplierState] [varchar](2) NOT NULL,
	[SupplierZip] [varchar](20) NOT NULL,
	[SupplierDeaNumber] [varchar](9) NOT NULL,
	[SupplierEmail] [varchar](150) NULL,
	[OrderActionType] [nvarchar](20) NULL,
	[Customer] [varchar](20) NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[CustomerName] [varchar](75) NOT NULL,
	[CustomerDeaNumber] [varchar](9) NOT NULL,
	[UserID] [nvarchar](20) NULL,
	[UserName] [nvarchar](30) NULL,
	[ShipAddress1] [varchar](255) NOT NULL,
	[ShipAddress2] [varchar](255) NULL,
	[ShipAddress3] [varchar](255) NULL,
	[ShipAddress4] [varchar](255) NOT NULL,
	[ShipAddress5] [varchar](2) NOT NULL,
	[ShipPostalCode] [varchar](20) NOT NULL,
	[Email] [varchar](150) NULL,
	[Phone] [varchar](25) NULL,
	[CustomerOrderId] [varchar](20) NULL,
	[TrackingNumber] [varchar](9) NOT NULL,
	[SpecialInstructions] [nvarchar](500) NULL,
	[SignedDate] [datetime] NULL,
	[OrderHeaderCustomData] [nvarchar](500) NULL,
	[Status] [nvarchar](30) NULL,
	[CertValidationParameters] [nvarchar](250) NULL,
	[LegisymFileName] [nvarchar](350) NULL,
	[XmlFrmLegisym] [xml] NULL,
 CONSTRAINT [PK_CSOS_SalesOrdersFrmLegisym] PRIMARY KEY CLUSTERED 
(
	[SalesOrderFrmLegisymId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSOS_SalesOrderStockLineFrmLegisym]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_SalesOrderStockLineFrmLegisym](
	[StockLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[LineId] [int] NOT NULL,
	[StockCode] [varchar](20) NOT NULL,
	[StockDescription] [varchar](50) NOT NULL,
	[StockCategory] [varchar](50) NOT NULL,
	[DeaSchedule] [varchar](8) NOT NULL,
	[DeaScheduleName] [varchar](75) NOT NULL,
	[NdcNumber] [varchar](11) NULL,
	[PackageSize] [nvarchar](50) NULL,
	[ArcosQtyFactor] [int] NULL,
	[ArcosUnit] [nvarchar](60) NULL,
	[ArcosStrength] [nvarchar](150) NULL,
	[OrderQty] [int] NOT NULL,
	[StockLineCustomData] [nvarchar](500) NULL,
	[Price] [nvarchar](50) NULL,
	[QtyonHand] [nvarchar](50) NULL,
	[BrandReference] [nvarchar](50) NULL,
	[SalesOrderFrmLegisymId] [bigint] NULL,
 CONSTRAINT [PK_CSOS_SalesOrdersStockLineFrmLegisym] PRIMARY KEY CLUSTERED 
(
	[StockLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSOS_StockItemFrmAPI]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_StockItemFrmAPI](
	[StockItemFrmAPIId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[SchemaVersion] [nvarchar](50) NULL,
	[DatePrepared] [smalldatetime] NULL,
	[TimePrepared] [nvarchar](30) NULL,
	[ServiceContract] [nvarchar](45) NULL,
	[XmlToLegisym] [xml] NULL,
	[ActionCode] [nvarchar](50) NULL,
	[E222StockId] [nvarchar](50) NULL,
	[SupplierStockId] [nvarchar](28) NULL,
	[StockDescription] [nvarchar](50) NULL,
	[StockCategory] [nvarchar](50) NULL,
	[Source] [nvarchar](50) NULL,
	[DeaSchedule] [nvarchar](50) NULL,
	[DeaScheduleName] [nvarchar](50) NULL,
	[NdcNumber] [nvarchar](11) NULL,
	[PackageSize] [nvarchar](50) NULL,
	[ArcosQtyFactor] [nvarchar](50) NULL,
	[ArcosUnit] [nvarchar](50) NULL,
	[ArcosStrength] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[QtyonHand] [nvarchar](50) NULL,
	[BrandReference] [nvarchar](50) NULL,
	[PRDC] [nvarchar](50) NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_StockItem] PRIMARY KEY CLUSTERED 
(
	[StockItemFrmAPIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSOS_Warehouse]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_Warehouse](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DeaNumber] [nvarchar](9) NULL,
	[ServiceContract] [nvarchar](45) NOT NULL,
	[LegissymFtpHost] [nvarchar](250) NULL,
	[LegisymFtpUser] [nvarchar](50) NULL,
	[LegisymFtpPW] [nvarchar](50) NULL,
	[LegisymSalesOrderFolder] [nvarchar](450) NULL,
	[LegisymErrMsgFolder] [nvarchar](450) NULL,
	[LegisymStockItemFolder] [nvarchar](450) NULL,
	[LegisymOrderDispositionFolder] [nvarchar](450) NULL,
 CONSTRAINT [PK_CSOS_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB1_RSE_20180827]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB1_RSE_20180827](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FinalRebateAmount] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_test1]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_test1](
	[PCLAIM_KEY] [int] NULL,
	[RX_NUM] [char](7) NULL,
	[FILL_DT] [datetime] NULL,
	[BILL_AMT] [numeric](8, 2) NULL,
	[PAID_AMT] [numeric](8, 2) NULL,
	[REJECT_AMT] [numeric](8, 2) NULL,
	[INGRED_BILL_AMT] [numeric](8, 2) NULL,
	[INGRED_PD_AMT] [numeric](8, 2) NULL,
	[COPAY_AMT] [numeric](8, 2) NULL,
	[CONTRACT_FEE_AMT] [numeric](8, 2) NULL,
	[PC_MISC_FEE_AMT] [numeric](8, 2) NULL,
	[REFILLS_QTY] [int] NULL,
	[CLAIM_TYPE] [char](2) NULL,
	[SUBMIT_CLARIF_CODE] [char](2) NULL,
	[GROUP_ID] [char](15) NULL,
	[PC_PAYEE_ID] [int] NULL,
	[NPI] [varchar](10) NULL,
	[NDC] [varchar](17) NULL,
	[PLAN_ID] [int] NULL,
	[R_FEED_ID] [int] NULL,
	[PLAN_CYCLE_DT] [datetime] NULL,
	[LINEITEM_ID] [int] NULL,
	[RECEIPT_ID] [int] NULL,
	[NABP] [varchar](7) NULL,
	[TO_STORE_AMT] [numeric](12, 2) NULL,
	[ADMIN_FEE_AMT] [numeric](12, 2) NULL,
	[MISC_FEE_AMT] [numeric](12, 2) NULL,
	[PAID_DT] [datetime] NULL,
	[CHECK_NUM] [int] NULL,
	[CLAIM_COUNT] [smallint] NULL,
	[ADJ_FLG] [smallint] NULL,
	[FEED_ID] [int] NULL,
	[XMIT_FLG] [smallint] NULL,
	[PROVIDER_OVERRIDE] [char](7) NULL,
	[PAYEE_ID] [int] NULL,
	[ADJ_REASON_CODE] [char](2) NULL,
	[ADJ_REF_ID] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemGroup]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemGroup](
	[ID] [varchar](5) NULL,
	[DrugType] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_SalesDetal_XRef]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_SalesDetal_XRef](
	[SalesDetailID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Order_SalesDetal_XRef] PRIMARY KEY CLUSTERED 
(
	[SalesDetailID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_SalesDetal_XRef_BK20190730]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_SalesDetal_XRef_BK20190730](
	[SalesDetailID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rebate]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebate](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [varchar](13) NULL,
	[DateKey] [int] NULL,
	[APIRebate] [money] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Rebate] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rebate_20190312]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebate_20190312](
	[NDC] [varchar](11) NOT NULL,
	[DateKey] [int] NOT NULL,
	[DrugKey] [int] NOT NULL,
	[CompetitorDrugKey] [int] NOT NULL,
	[APINetPrice] [money] NULL,
	[APIManufacturerInvoicePrice] [money] NULL,
	[APIHoldBackAmount] [money] NULL,
	[APICustomerInvoicePrice] [money] NULL,
	[APICustomerNetPrice] [money] NULL,
	[APIRebate] [money] NULL,
	[APIRebatePercentage] [float] NULL,
	[APIPricePerUnit] [money] NULL,
	[CardinalInvoicePrice] [money] NULL,
	[CardinalPricePerUnit] [money] NULL,
	[WACPackagePrice] [money] NULL,
	[WACPerDose] [money] NULL,
	[AWPPackagePrice] [money] NULL,
	[AWPPerDose] [money] NULL,
	[ABCInvoicePrice] [money] NULL,
	[ABC_AWP] [money] NULL,
	[ABC-CPA] [money] NULL,
	[McKesson-IPC] [money] NULL,
	[McKesson-APCI] [money] NULL,
	[Valley] [money] NULL,
	[RiverCity] [money] NULL,
	[Healthsource] [money] NULL,
	[Harvard] [money] NULL,
	[Par-Med] [money] NULL,
	[Bloodworth] [money] NULL,
	[NC Mutual] [money] NULL,
	[SmithDrug] [money] NULL,
	[H.D. Smith] [money] NULL,
	[Kinray] [money] NULL,
	[Morris-Dickson] [money] NULL,
	[Value Drug] [money] NULL,
	[Anda] [money] NULL,
	[Ezri Rx] [money] NULL,
	[Quest] [money] NULL,
	[H&H] [money] NULL,
	[Masters] [money] NULL,
	[Auburn] [money] NULL,
	[Belco] [money] NULL,
	[RowCreatedDate] [datetime2](3) NOT NULL,
	[RowUpdatedDate] [datetime2](3) NULL,
	[NADACPrice] [money] NULL,
	[NADACPricePerUnit] [money] NULL,
	[AWP] [money] NULL,
	[DirectPrice] [money] NULL,
	[WAC] [money] NULL,
	[CMSFUL] [money] NULL,
	[AAWP] [money] NULL,
	[GEAP] [money] NULL,
	[McKesson] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RebateCheck]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateCheck](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvDate] [datetime] NULL,
	[Rebate] [numeric](38, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[IsZero] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSE_20181025]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_20181025](
	[APISalesDetailID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDDS_APISalesDetail_MaxRowversionID]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDDS_APISalesDetail_MaxRowversionID](
	[RowversionID] [varchar](50) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TerritoryGroup]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerritoryGroup](
	[ID] [varchar](5) NULL,
	[TerritoryGroup] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_API_SALES_LOAD_SLX_AAP]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_API_SALES_LOAD_SLX_AAP](
	[whaccountid] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_API_SALES_LOAD_SLX_AAP_BD]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_API_SALES_LOAD_SLX_AAP_BD](
	[whaccountid] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_API_SALES_LOAD_SLX_DEA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_API_SALES_LOAD_SLX_DEA](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[whaccountid] [varchar](32) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_2010_WHSales]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_2010_WHSales](
	[pmid] [int] NULL,
	[ID] [int] NOT NULL,
	[YEAR] [int] NOT NULL,
	[WHAccountID] [varchar](32) NOT NULL,
	[JANUARY_OTC] [numeric](18, 2) NULL,
	[FEBRUARY_OTC] [numeric](18, 2) NULL,
	[MARCH_OTC] [numeric](18, 2) NULL,
	[APRIL_OTC] [numeric](18, 2) NULL,
	[MAY_OTC] [numeric](18, 2) NULL,
	[JUNE_OTC] [numeric](18, 2) NULL,
	[JULY_OTC] [numeric](18, 2) NULL,
	[AUGUST_OTC] [numeric](18, 2) NULL,
	[SEPTEMBER_OTC] [numeric](18, 2) NULL,
	[OCTOBER_OTC] [numeric](18, 2) NULL,
	[NOVEMBER_OTC] [numeric](18, 2) NULL,
	[DECEMBER_OTC] [numeric](18, 2) NULL,
	[JANUARY_BR] [numeric](18, 2) NULL,
	[FEBRUARY_BR] [numeric](18, 2) NULL,
	[MARCH_BR] [numeric](18, 2) NULL,
	[APRIL_BR] [numeric](18, 2) NULL,
	[MAY_BR] [numeric](18, 2) NULL,
	[JUNE_BR] [numeric](18, 2) NULL,
	[JULY_BR] [numeric](18, 2) NULL,
	[AUGUST_BR] [numeric](18, 2) NULL,
	[SEPTEMBER_BR] [numeric](18, 2) NULL,
	[OCTOBER_BR] [numeric](18, 2) NULL,
	[NOVEMBER_BR] [numeric](18, 2) NULL,
	[DECEMBER_BR] [numeric](18, 2) NULL,
	[JANUARY_GEN] [numeric](18, 2) NULL,
	[FEBRUARY_GEN] [numeric](18, 2) NULL,
	[MARCH_GEN] [numeric](18, 2) NULL,
	[APRIL_GEN] [numeric](18, 2) NULL,
	[MAY_GEN] [numeric](18, 2) NULL,
	[JUNE_GEN] [numeric](18, 2) NULL,
	[JULY_GEN] [numeric](18, 2) NULL,
	[AUGUST_GEN] [numeric](18, 2) NULL,
	[SEPTEMBER_GEN] [numeric](18, 2) NULL,
	[OCTOBER_GEN] [numeric](18, 2) NULL,
	[NOVEMBER_GEN] [numeric](18, 2) NULL,
	[DECEMBER_GEN] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_acv]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_acv](
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](50) NULL,
	[Q42009_CA_Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_api]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_api](
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](50) NULL,
	[Avg_3_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Card_SLX_COMP_DEA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Card_SLX_COMP_DEA](
	[DEA] [varchar](20) NULL,
	[SLXCardVolume] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Card_VOL_SLX_AAP]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Card_VOL_SLX_AAP](
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](20) NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[Avg_3_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Card_VOL_SLX_AAP_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Card_VOL_SLX_AAP_bkp](
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](50) NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[Avg_3_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Card_VOL_SLX_DEA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Card_VOL_SLX_DEA](
	[DEA] [varchar](50) NULL,
	[Avg_3_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Card_VOL_SLX_DEA_bkp]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Card_VOL_SLX_DEA_bkp](
	[DEA] [varchar](50) NULL,
	[Avg_3_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_JMW]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_JMW](
	[Salesman] [nvarchar](50) NULL,
	[CustName] [nvarchar](100) NULL,
	[CustNum] [nvarchar](50) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generic] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[Total] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Sales_ByWeek]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Sales_ByWeek](
	[WHAccountID] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[AccountName] [varchar](65) NULL,
	[Brand] [numeric](38, 2) NULL,
	[Generic] [numeric](38, 2) NULL,
	[OTC] [numeric](38, 2) NULL,
	[Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_AAP]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_AAP](
	[apiaccountno] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_AAP_BD]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_AAP_BD](
	[apiaccountno] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_AAP_BKP]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_AAP_BKP](
	[whaccountid] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_AAP_test]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_AAP_test](
	[whaccountid] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_DEA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_DEA](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_DEA_BKP]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_DEA_BKP](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[whaccountid] [varchar](32) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_DEA_bkp080310]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_DEA_bkp080310](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[whaccountid] [varchar](32) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_DEA_test]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_DEA_test](
	[DEA] [varchar](50) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_WH_6MO]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_WH_6MO](
	[whaccountid] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[tot_mo_4] [numeric](38, 2) NULL,
	[tot_mo_5] [numeric](38, 2) NULL,
	[tot_mo_6] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_WH_6MO_DEA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_WH_6MO_DEA](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[whaccountid] [varchar](32) NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[tot_mo_4] [numeric](38, 2) NULL,
	[tot_mo_5] [numeric](38, 2) NULL,
	[tot_mo_6] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_SLX_COMP_DEA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SLX_COMP_DEA](
	[DEA] [varchar](20) NULL,
	[WHAccountID] [varchar](50) NULL,
	[SLXVolume] [varchar](50) NULL,
	[SLXGeneric] [varchar](50) NULL,
	[SLXBrand] [varchar](50) NULL,
	[SLXOTC] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_apicardvolume_load]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_apicardvolume_load](
	[APIAccountNo] [varchar](50) NULL,
	[DEA] [varchar](50) NULL,
	[CardinalNo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Sales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_APIStatus_SLX]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_APIStatus_SLX](
	[APIAccountNo] [varchar](32) NULL,
	[AccountName] [varchar](255) NULL,
	[Addr1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](15) NULL,
	[APIStatus] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_apiwh]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_apiwh](
	[whaccountid] [varchar](32) NULL,
	[TotalDetailSales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_apiwhByType]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_apiwhByType](
	[whaccountid] [varchar](32) NULL,
	[DetailOTC] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_DrugMaster_ControlledSubstance]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_DrugMaster_ControlledSubstance](
	[NDC] [varchar](11) NOT NULL,
	[PS] [numeric](8, 3) NULL,
	[DrugName] [varchar](25) NULL,
	[DEA] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_july_OTC]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_july_OTC](
	[InvNbr] [float] NULL,
	[Type] [float] NULL,
	[IDORNO] [float] NULL,
	[LineNo] [float] NULL,
	[WHAccountID] [varchar](255) NULL,
	[InvDate] [float] NULL,
	[ItemDescription] [varchar](255) NULL,
	[QTY] [float] NULL,
	[Derived Column 1] [float] NULL,
	[Derived Column 2] [float] NULL,
	[ExtSales] [float] NULL,
	[Territory] [varchar](50) NULL,
	[Group] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_july_otc_betty]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_july_otc_betty](
	[Cust#] [nvarchar](255) NULL,
	[Brands] [money] NULL,
	[Generics] [money] NULL,
	[OTC] [money] NULL,
	[Total Monthly Sales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_BR_STD]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_BR_STD](
	[WH Acct. No] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[Aug. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Sept. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Oct. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Nov. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Dec. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Jan. 2010 Brand Rx] [numeric](38, 2) NULL,
	[Pay Terms] [varchar](26) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_BR_STD_test]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_BR_STD_test](
	[apiaccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[September_br] [numeric](38, 2) NULL,
	[October_br] [numeric](38, 2) NULL,
	[November_br] [numeric](38, 2) NULL,
	[December_br] [numeric](38, 2) NULL,
	[January_br] [numeric](38, 2) NULL,
	[February_br] [numeric](38, 2) NULL,
	[Pay Terms] [varchar](27) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_BR_WKLY]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_BR_WKLY](
	[WH Acct. No] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[Aug. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Sept. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Oct. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Nov. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Dec. 2009 Brand Rx] [numeric](38, 2) NULL,
	[Jan. 2010 Brand Rx] [numeric](38, 2) NULL,
	[Pay Terms] [varchar](27) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_BR_WKLY_test]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_BR_WKLY_test](
	[apiaccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[September_br] [numeric](38, 2) NULL,
	[October_br] [numeric](38, 2) NULL,
	[November_br] [numeric](38, 2) NULL,
	[December_br] [numeric](38, 2) NULL,
	[January_br] [numeric](38, 2) NULL,
	[February_br] [numeric](38, 2) NULL,
	[Pay Terms] [varchar](28) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_GEN_Non_PVA]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_GEN_Non_PVA](
	[WH Acct. No] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[Aug. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Sept. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Oct. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Nov. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Dec. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Jan. 2010 Generic Rx] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_GEN_Non_PVA_test]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_GEN_Non_PVA_test](
	[apiaccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[September_gen] [numeric](38, 2) NULL,
	[October_gen] [numeric](38, 2) NULL,
	[November_gen] [numeric](38, 2) NULL,
	[December_gen] [numeric](38, 2) NULL,
	[January_gen] [numeric](38, 2) NULL,
	[February_gen] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NDCfix]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NDCfix](
	[APIItemNbr] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[PGPCGR] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_pm]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm](
	[AccountMasterID] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDParentNo] [varchar](25) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ContactFullName] [varchar](255) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactLast] [varchar](50) NULL,
	[Territory] [varchar](4) NULL,
	[QPS] [varchar](4) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[BusinessClass] [varchar](4) NULL,
	[AreaCode] [varchar](3) NULL,
	[Phone] [varchar](50) NULL,
	[FaxAreaCode] [varchar](3) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[DateOpened] [datetime] NULL,
	[OrigStartDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Status] [varchar](32) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[ContractDate] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[FedID] [varchar](12) NULL,
	[Source] [varchar](25) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[ChainCode] [varchar](10) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[UDStatus] [varchar](32) NULL,
	[AAPStatus] [varchar](32) NULL,
	[UDQuitDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[Rank] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_VolumePivot_13mo_pivot]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VolumePivot_13mo_pivot](
	[pmid] [int] NULL,
	[API 01/10 Brand] [float] NULL,
	[API 01/10 Generic] [float] NULL,
	[API 01/10 OTC] [float] NULL,
	[API 01/10 Total] [float] NULL,
	[API 02/10 Brand] [float] NULL,
	[API 02/10 Generic] [float] NULL,
	[API 02/10 OTC] [float] NULL,
	[API 02/10 Total] [float] NULL,
	[API 03/10 Brand] [float] NULL,
	[API 03/10 Generic] [float] NULL,
	[API 03/10 OTC] [float] NULL,
	[API 03/10 Total] [float] NULL,
	[API 04/10 Brand] [float] NULL,
	[API 04/10 Generic] [float] NULL,
	[API 04/10 OTC] [float] NULL,
	[API 04/10 Total] [float] NULL,
	[API 05/10 Brand] [float] NULL,
	[API 05/10 Generic] [float] NULL,
	[API 05/10 OTC] [float] NULL,
	[API 05/10 Total] [float] NULL,
	[API 06/10 Brand] [float] NULL,
	[API 06/10 Generic] [float] NULL,
	[API 06/10 OTC] [float] NULL,
	[API 06/10 Total] [float] NULL,
	[API 07/10 Brand] [float] NULL,
	[API 07/10 Generic] [float] NULL,
	[API 07/10 OTC] [float] NULL,
	[API 07/10 Total] [float] NULL,
	[API 08/09 Brand] [float] NULL,
	[API 08/09 Generic] [float] NULL,
	[API 08/09 OTC] [float] NULL,
	[API 08/09 Total] [float] NULL,
	[API 08/10 Brand] [float] NULL,
	[API 08/10 Generic] [float] NULL,
	[API 08/10 OTC] [float] NULL,
	[API 08/10 Total] [float] NULL,
	[API 09/09 Brand] [float] NULL,
	[API 09/09 Generic] [float] NULL,
	[API 09/09 OTC] [float] NULL,
	[API 09/09 Total] [float] NULL,
	[API 10/09 Brand] [float] NULL,
	[API 10/09 Generic] [float] NULL,
	[API 10/09 OTC] [float] NULL,
	[API 10/09 Total] [float] NULL,
	[API 11/09 Brand] [float] NULL,
	[API 11/09 Generic] [float] NULL,
	[API 11/09 OTC] [float] NULL,
	[API 11/09 Total] [float] NULL,
	[API 12/09 Brand] [float] NULL,
	[API 12/09 Generic] [float] NULL,
	[API 12/09 OTC] [float] NULL,
	[API 12/09 Total] [float] NULL,
	[CAH 01/10 AAP Brand] [float] NULL,
	[CAH 01/10 AAP Generic] [float] NULL,
	[CAH 01/10 AAP OTC] [float] NULL,
	[CAH 01/10 AAP Total] [float] NULL,
	[CAH 02/10 AAP Brand] [float] NULL,
	[CAH 02/10 AAP Generic] [float] NULL,
	[CAH 02/10 AAP OTC] [float] NULL,
	[CAH 02/10 AAP Total] [float] NULL,
	[CAH 03/10 AAP Brand] [float] NULL,
	[CAH 03/10 AAP Generic] [float] NULL,
	[CAH 03/10 AAP OTC] [float] NULL,
	[CAH 03/10 AAP Total] [float] NULL,
	[CAH 04/10 AAP Brand] [float] NULL,
	[CAH 04/10 AAP Generic] [float] NULL,
	[CAH 04/10 AAP OTC] [float] NULL,
	[CAH 04/10 AAP Total] [float] NULL,
	[CAH 05/10 AAP Brand] [float] NULL,
	[CAH 05/10 AAP Generic] [float] NULL,
	[CAH 05/10 AAP OTC] [float] NULL,
	[CAH 05/10 AAP Total] [float] NULL,
	[CAH 06/10 AAP Brand] [float] NULL,
	[CAH 06/10 AAP Generic] [float] NULL,
	[CAH 06/10 AAP OTC] [float] NULL,
	[CAH 06/10 AAP Total] [float] NULL,
	[CAH 07/10 AAP Brand] [float] NULL,
	[CAH 07/10 AAP Generic] [float] NULL,
	[CAH 07/10 AAP OTC] [float] NULL,
	[CAH 07/10 AAP Total] [float] NULL,
	[CAH 08/10 AAP Brand] [float] NULL,
	[CAH 08/10 AAP Generic] [float] NULL,
	[CAH 08/10 AAP OTC] [float] NULL,
	[CAH 08/10 AAP Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_VolumePivot_13mo_pivot_final]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VolumePivot_13mo_pivot_final](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[Whse Date Opened] [datetime] NULL,
	[Status] [varchar](32) NULL,
	[API 01/10 Brand] [float] NULL,
	[API 01/10 Generic] [float] NULL,
	[API 01/10 OTC] [float] NULL,
	[API 01/10 Total] [float] NULL,
	[API 02/10 Brand] [float] NULL,
	[API 02/10 Generic] [float] NULL,
	[API 02/10 OTC] [float] NULL,
	[API 02/10 Total] [float] NULL,
	[API 03/10 Brand] [float] NULL,
	[API 03/10 Generic] [float] NULL,
	[API 03/10 OTC] [float] NULL,
	[API 03/10 Total] [float] NULL,
	[API 04/10 Brand] [float] NULL,
	[API 04/10 Generic] [float] NULL,
	[API 04/10 OTC] [float] NULL,
	[API 04/10 Total] [float] NULL,
	[API 05/10 Brand] [float] NULL,
	[API 05/10 Generic] [float] NULL,
	[API 05/10 OTC] [float] NULL,
	[API 05/10 Total] [float] NULL,
	[API 06/10 Brand] [float] NULL,
	[API 06/10 Generic] [float] NULL,
	[API 06/10 OTC] [float] NULL,
	[API 06/10 Total] [float] NULL,
	[API 07/10 Brand] [float] NULL,
	[API 07/10 Generic] [float] NULL,
	[API 07/10 OTC] [float] NULL,
	[API 07/10 Total] [float] NULL,
	[API 08/09 Brand] [float] NULL,
	[API 08/09 Generic] [float] NULL,
	[API 08/09 OTC] [float] NULL,
	[API 08/09 Total] [float] NULL,
	[API 08/10 Brand] [float] NULL,
	[API 08/10 Generic] [float] NULL,
	[API 08/10 OTC] [float] NULL,
	[API 08/10 Total] [float] NULL,
	[API 09/09 Brand] [float] NULL,
	[API 09/09 Generic] [float] NULL,
	[API 09/09 OTC] [float] NULL,
	[API 09/09 Total] [float] NULL,
	[API 10/09 Brand] [float] NULL,
	[API 10/09 Generic] [float] NULL,
	[API 10/09 OTC] [float] NULL,
	[API 10/09 Total] [float] NULL,
	[API 11/09 Brand] [float] NULL,
	[API 11/09 Generic] [float] NULL,
	[API 11/09 OTC] [float] NULL,
	[API 11/09 Total] [float] NULL,
	[API 12/09 Brand] [float] NULL,
	[API 12/09 Generic] [float] NULL,
	[API 12/09 OTC] [float] NULL,
	[API 12/09 Total] [float] NULL,
	[CAH 01/10 AAP Brand] [float] NULL,
	[CAH 01/10 AAP Generic] [float] NULL,
	[CAH 01/10 AAP OTC] [float] NULL,
	[CAH 01/10 AAP Total] [float] NULL,
	[CAH 02/10 AAP Brand] [float] NULL,
	[CAH 02/10 AAP Generic] [float] NULL,
	[CAH 02/10 AAP OTC] [float] NULL,
	[CAH 02/10 AAP Total] [float] NULL,
	[CAH 03/10 AAP Brand] [float] NULL,
	[CAH 03/10 AAP Generic] [float] NULL,
	[CAH 03/10 AAP OTC] [float] NULL,
	[CAH 03/10 AAP Total] [float] NULL,
	[CAH 04/10 AAP Brand] [float] NULL,
	[CAH 04/10 AAP Generic] [float] NULL,
	[CAH 04/10 AAP OTC] [float] NULL,
	[CAH 04/10 AAP Total] [float] NULL,
	[CAH 05/10 AAP Brand] [float] NULL,
	[CAH 05/10 AAP Generic] [float] NULL,
	[CAH 05/10 AAP OTC] [float] NULL,
	[CAH 05/10 AAP Total] [float] NULL,
	[CAH 06/10 AAP Brand] [float] NULL,
	[CAH 06/10 AAP Generic] [float] NULL,
	[CAH 06/10 AAP OTC] [float] NULL,
	[CAH 06/10 AAP Total] [float] NULL,
	[CAH 07/10 AAP Brand] [float] NULL,
	[CAH 07/10 AAP Generic] [float] NULL,
	[CAH 07/10 AAP OTC] [float] NULL,
	[CAH 07/10 AAP Total] [float] NULL,
	[CAH 08/10 AAP Brand] [float] NULL,
	[CAH 08/10 AAP Generic] [float] NULL,
	[CAH 08/10 AAP OTC] [float] NULL,
	[CAH 08/10 AAP Total] [float] NULL,
	[Total CAH Sales YTD] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_VolumePivot_13mo_source]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VolumePivot_13mo_source](
	[pmid] [int] NULL,
	[col] [varchar](21) NULL,
	[value] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_wh_aug]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wh_aug](
	[InvNo] [float] NULL,
	[Type] [float] NULL,
	[OrderNo] [float] NULL,
	[LineNo] [float] NULL,
	[WHAccountID] [varchar](255) NULL,
	[InvDate] [datetime] NULL,
	[PrdCode] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Derived Column_IDSALP] [float] NULL,
	[Derived Column_IDAMOU] [float] NULL,
	[extsales] [numeric](18, 2) NULL,
	[Territory] [varchar](255) NULL,
	[ItmGrp] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_wh_aug2]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wh_aug2](
	[InvNo] [float] NULL,
	[Type] [float] NULL,
	[OrderNo] [float] NULL,
	[LineNo] [float] NULL,
	[WHAccountID] [varchar](255) NULL,
	[InvDate] [datetime] NULL,
	[PrdCode] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[IDSALP] [float] NULL,
	[IDAMOU] [float] NULL,
	[extsales] [float] NULL,
	[Territory] [varchar](255) NULL,
	[ItmGrp] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_WSAPIPrice]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WSAPIPrice](
	[API Item #] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Contract] [nvarchar](255) NULL,
	[API Price] [money] NULL,
	[billable cost] [float] NULL,
	[GPI] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[web_APICatalog]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_APICatalog](
	[ndc] [nvarchar](20) NULL,
	[APIItemNbr] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[web_NDCList]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_NDCList](
	[ndc] [varchar](11) NOT NULL,
	[drugname] [varchar](25) NULL,
	[mfg] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SSAS_Volume].[Time]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSAS_Volume].[Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Month_Of_Year] [int] NULL,
	[Month_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Quarter] [int] NULL,
	[Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_Of_Year] [int] NULL,
	[Quarter_Of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APIOrder]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIOrder](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](30) NOT NULL,
	[API_Item_Number] [varchar](30) NOT NULL,
	[Quantity] [numeric](18, 2) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ItemDesc] [varchar](500) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_APIOrder] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APIPricing]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIPricing](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[APIItemNum] [varchar](25) NOT NULL,
	[NDC] [varchar](15) NOT NULL,
	[DrugName] [varchar](100) NULL,
	[IsControl] [bit] NOT NULL,
	[IsC2Control] [bit] NOT NULL,
	[CustomerInvoicePrice] [numeric](18, 2) NULL,
	[Created] [date] NULL,
	[BrandName] [varchar](50) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[EffectiveDate] [date] NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetail]    Script Date: 12/22/2020 2:53:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetail](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [PK_apisalesdetail_test] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetail_backup_RSE_20200818]    Script Date: 12/22/2020 2:53:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetail_backup_RSE_20200818](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetailReload]    Script Date: 12/22/2020 2:53:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetailReload](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[LineAmt] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL,
	[WHNbr] [varchar](2) NULL,
	[Rebate] [numeric](18, 2) NULL,
	[APIHoldbackPercent] [decimal](18, 4) NULL,
	[APIHoldbackAmount] [money] NULL,
	[RebateAfterAPIHoldbackAmount] [money] NULL,
	[AffiliateHoldbackPercent] [decimal](18, 4) NULL,
	[AffiliateHoldbackAmount] [money] NULL,
	[FinalRebateAmount] [money] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditPercentage] [decimal](5, 2) NULL,
	[ConferenceCreditAmount] [money] NULL,
	[PMID] [int] NULL,
	[TransTypeCode] [varchar](10) NULL,
	[TransTypeCodeDesc] [varchar](50) NULL,
	[CarrierCode] [varchar](50) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [PK_Staging_apisalesdetailReload] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesInvoice]    Script Date: 12/22/2020 2:53:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [varchar](32) NULL,
	[OrderNbr] [varchar](15) NULL,
	[InvDate] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[CustomerName] [varchar](255) NULL,
	[CarrierCode] [varchar](15) NULL,
	[CarrierDesc] [varchar](255) NULL,
	[CustomerRef] [varchar](255) NULL,
	[Whsnum] [varchar](2) NULL,
	[OrdType] [varchar](2) NULL,
	[DateLoaded] [datetime] NOT NULL,
 CONSTRAINT [PK_APISalesInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesInvoice_Delete_DW]    Script Date: 12/22/2020 2:53:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesInvoice_Delete_DW](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[WHAccountID] [varchar](100) NULL,
	[OrderNumber] [varchar](25) NULL,
	[InvNbr] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Staging_APISalesInvoice_Delete_DW] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[APISalesDetail] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[API_HoldbackPercent] ADD  DEFAULT ('29991231') FOR [EndDate]
GO
ALTER TABLE [dbo].[API_HoldbackPercent] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APIDailySummary] ADD  DEFAULT (getdate()) FOR [RowCreateDate]
GO
ALTER TABLE [dbo].[APIOrder] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APIOrder_BK20190730] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APIPricing_new] ADD  DEFAULT ((0)) FOR [IsControl]
GO
ALTER TABLE [dbo].[APIPricing_new] ADD  DEFAULT ((0)) FOR [IsC2Control]
GO
ALTER TABLE [dbo].[APIPricing_new] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [APIHoldbackPercent]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [APIHoldbackAmount]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [RebateAfterAPIHoldbackAmount]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [AffiliateHoldbackPercent]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [AffiliateHoldbackAmount]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [FinalRebateAmount]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditPercentage]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditAmount]
GO
ALTER TABLE [dbo].[APISalesDetail] ADD  DEFAULT ((0)) FOR [PMID]
GO
ALTER TABLE [dbo].[APISalesDetail_Delete_DW] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APISalesDetail_Report] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APISalesDetailID] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APISalesInvoice] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [dbo].[APISalesInvoice_Delete_DW] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[AS400DrugType] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ItemGroup] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Order_SalesDetal_XRef] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Rebate] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[RebateCheck] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[SalesDDS_APISalesDetail_MaxRowversionID] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[TerritoryGroup] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APIOrder] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [APIHoldbackPercent]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [APIHoldbackAmount]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [RebateAfterAPIHoldbackAmount]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [AffiliateHoldbackPercent]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [AffiliateHoldbackAmount]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [FinalRebateAmount]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditPercentage]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditAmount]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0)) FOR [PMID]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [APIHoldbackPercent]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [APIHoldbackAmount]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [RebateAfterAPIHoldbackAmount]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [AffiliateHoldbackPercent]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [AffiliateHoldbackAmount]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [FinalRebateAmount]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditPercentage]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditAmount]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0)) FOR [PMID]
GO
ALTER TABLE [Staging].[APISalesInvoice] ADD  DEFAULT (CONVERT([varchar](10),getdate(),(112))) FOR [DateLoaded]
GO
ALTER TABLE [Staging].[APISalesInvoice_Delete_DW] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[CSOS_SalesOrderStockLineFrmLegisym]  WITH CHECK ADD  CONSTRAINT [FK_CSOS_SalesOrderStockLineFrmLegisym_CSOS_SalesOrderFrmLegisym] FOREIGN KEY([SalesOrderFrmLegisymId])
REFERENCES [dbo].[CSOS_SalesOrderFrmLegisym] ([SalesOrderFrmLegisymId])
GO
ALTER TABLE [dbo].[CSOS_SalesOrderStockLineFrmLegisym] CHECK CONSTRAINT [FK_CSOS_SalesOrderStockLineFrmLegisym_CSOS_SalesOrderFrmLegisym]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'CONSTRAINT',@level2name=N'PK_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'Time' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'0b337ad8-fe4d-47f2-9afc-3fd7d2b2e1e2' , @level0type=N'SCHEMA',@level0name=N'SSAS_Volume', @level1type=N'TABLE',@level1name=N'Time'
GO
