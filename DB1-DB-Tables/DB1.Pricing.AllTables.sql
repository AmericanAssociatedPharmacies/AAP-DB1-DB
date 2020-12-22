USE [Pricing]
GO
/****** Object:  Table [Archive].[AAPComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[AAPComparisons](
	[AAPComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[CIN] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[Descr] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQty] [int] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AAPPrice] [money] NULL,
	[AAPExt] [money] NULL,
	[Program] [varchar](50) NULL,
	[DiffStoreVsAAP] [money] NULL,
	[DateAppended] [datetime] NULL,
	[Group] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_AAPComparisons] PRIMARY KEY CLUSTERED 
(
	[AAPComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[ElectronicComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[ElectronicComparisons](
	[ElectronicComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [varchar](50) NULL,
	[Program] [varchar](50) NULL,
	[Descr] [varchar](50) NULL,
	[API#] [varchar](50) NULL,
	[Desc] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQTY] [numeric](10, 2) NULL,
	[APIPrice] [money] NULL,
	[APIExt] [money] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AdjReb] [money] NULL,
	[AdjExt] [money] NULL,
	[Diff] [money] NULL,
	[ItemStat] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[DateAppended] [datetime] NULL,
	[Source] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_ElectronicComparisons] PRIMARY KEY CLUSTERED 
(
	[ElectronicComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[Evaluations]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[Evaluations](
	[EvaluationsID] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](12) NULL,
	[Group] [varchar](12) NULL,
	[For] [varchar](50) NULL,
	[DateSaved] [date] NULL,
	[ItemNbr] [varchar](12) NULL,
	[ItemDesc] [varchar](50) NULL,
	[Unit] [varchar](12) NULL,
	[Size] [numeric](10, 2) NULL,
	[Contract] [varchar](12) NULL,
	[Program] [varchar](12) NULL,
	[Qty] [int] NULL,
	[APIPrice] [money] NULL,
	[Store] [money] NULL,
	[AWP] [money] NULL,
	[Net] [money] NULL,
	[PercentDiff] [decimal](10, 2) NULL,
	[DollarDiff] [money] NULL,
	[LastUpdated] [date] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_Evaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[_MasterFile]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_MasterFile](
	[Date] [datetime] NULL,
	[Type] [nvarchar](255) NULL,
	[CIN] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[AAP Price] [money] NULL,
	[Supplier] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[NDC/UPC] [float] NULL,
	[NDC11] [nvarchar](50) NULL,
	[DP#] [float] NULL,
	[UOM] [nvarchar](255) NULL,
	[Price Per Unit] [float] NULL,
	[GPI_ID] [nvarchar](255) NULL,
	[GCN] [nvarchar](255) NULL,
	[GCN SEQ] [float] NULL,
	[AWP] [money] NULL,
	[Color] [nvarchar](255) NULL,
	[Select] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[Comp Price] [nvarchar](50) NULL,
	[Invoice#] [nvarchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [nvarchar](50) NULL,
	[Comp Ext] [nvarchar](50) NULL,
	[Size diff] [nvarchar](50) NULL,
	[Comp NDC] [nvarchar](50) NULL,
	[Notes] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAP_AllInvoiceComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP_AllInvoiceComparisons](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[Supplier] [varchar](128) NULL,
	[ST] [varchar](128) NULL,
	[Group] [varchar](128) NULL,
	[SKUs] [int] NULL,
	[AAPCost] [decimal](18, 0) NULL,
	[AAPExtCost] [decimal](18, 0) NULL,
	[StoreCost] [decimal](18, 0) NULL,
	[StoreExtCost] [decimal](18, 0) NULL,
	[UnitDiff] [decimal](18, 0) NULL,
	[UnitDiffPercent] [decimal](18, 0) NULL,
	[ExtDiff] [decimal](18, 0) NULL,
	[ExtDiffPercent] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAP_InvoiceComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP_InvoiceComparisons](
	[InvoiceComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryManagerID] [int] NULL,
	[SupplierID] [int] NULL,
	[GroupID] [int] NULL,
	[StatusID] [int] NULL,
	[RequestDate] [date] NULL,
	[PharmacyName] [nchar](128) NOT NULL,
	[City] [nchar](128) NULL,
	[State] [nchar](2) NULL,
	[EstGenericVolume] [decimal](11, 2) NULL,
	[ExpectedFollowupDate] [date] NULL,
	[InvoiceDate] [date] NULL,
	[AAPAccountNo] [int] NULL,
	[Notes] [text] NULL,
	[PVACost] [decimal](11, 2) NULL,
	[PVAExtendedCost] [decimal](11, 2) NULL,
	[StoreCost] [decimal](11, 2) NULL,
	[StoreExtendedCost] [decimal](11, 2) NULL,
	[UnitDifference] [decimal](11, 2) NULL,
	[UnitDifferencePercentage] [decimal](5, 2) NULL,
	[ExtendedDifference] [decimal](11, 2) NULL,
	[ExtendedDifferencePercentage] [decimal](5, 2) NULL,
	[APIAccountNo] [int] NULL,
 CONSTRAINT [PK_AAP_InvoiceComparisons] PRIMARY KEY CLUSTERED 
(
	[InvoiceComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPComparisons](
	[AAPComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[CIN] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[Descr] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQty] [int] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AAPPrice] [money] NULL,
	[AAPExt] [money] NULL,
	[Program] [varchar](50) NULL,
	[DiffStoreVsAAP] [money] NULL,
	[DateAppended] [datetime] NULL,
	[Group] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_AAPComparisons] PRIMARY KEY CLUSTERED 
(
	[AAPComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_AllInvoiceComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_AllInvoiceComparisons](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [date] NULL,
	[Supplier] [varchar](128) NULL,
	[Group] [varchar](128) NULL,
	[SKUs] [int] NULL,
	[APITotal] [decimal](9, 2) NULL,
	[StoreTotal] [decimal](9, 2) NULL,
	[Less20Percent] [decimal](9, 2) NULL,
	[APINet] [decimal](9, 2) NULL,
	[Savings] [decimal](9, 2) NULL,
	[SavingsPercent] [decimal](5, 2) NULL,
	[APIInvw20Percent] [decimal](5, 2) NULL,
	[APIInv] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalPricing_forCompare]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalPricing_forCompare](
	[Date] [date] NULL,
	[Type] [varchar](15) NULL,
	[CIN] [float] NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SIZE] [varchar](50) NULL,
	[AAP Price] [decimal](18, 2) NULL,
	[Supplier] [varchar](50) NULL,
	[Brand Name] [varchar](50) NULL,
	[Form] [varchar](100) NULL,
	[NDC/UPC] [varchar](15) NULL,
	[GPI_ID] [varchar](25) NULL,
	[AWP] [float] NULL,
	[Select] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Comp Price] [varchar](50) NULL,
	[Invoice#] [varchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [varchar](50) NULL,
	[Comp Ext] [varchar](50) NULL,
	[Size diff] [varchar](50) NULL,
	[Comp NDC] [varchar](50) NULL,
	[Notes] [varchar](255) NULL,
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CardinalPricing_forCompare] PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalPricing_forCompare_Stephanie]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalPricing_forCompare_Stephanie](
	[Date] [date] NULL,
	[Type] [varchar](15) NULL,
	[CIN] [float] NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SIZE] [varchar](50) NULL,
	[AAP Price] [decimal](18, 2) NULL,
	[Supplier] [varchar](50) NULL,
	[Brand Name] [varchar](50) NULL,
	[Form] [varchar](100) NULL,
	[NDC/UPC] [varchar](15) NULL,
	[GPI_ID] [varchar](25) NULL,
	[AWP] [float] NULL,
	[Select] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Comp Price] [varchar](50) NULL,
	[Invoice#] [varchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [varchar](50) NULL,
	[Comp Ext] [varchar](50) NULL,
	[Size diff] [varchar](50) NULL,
	[Comp NDC] [varchar](50) NULL,
	[Notes] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalPricing_forCompare_WorkTable]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalPricing_forCompare_WorkTable](
	[Date] [date] NULL,
	[Type] [varchar](15) NULL,
	[CIN] [float] NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SIZE] [varchar](50) NULL,
	[AAP Price] [decimal](18, 2) NULL,
	[Supplier] [varchar](50) NULL,
	[Brand Name] [varchar](50) NULL,
	[Form] [varchar](100) NULL,
	[NDC/UPC] [varchar](15) NULL,
	[GPI_ID] [varchar](25) NULL,
	[AWP] [float] NULL,
	[Select] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[Comp Price] [varchar](50) NULL,
	[Invoice#] [varchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [varchar](50) NULL,
	[Comp Ext] [varchar](50) NULL,
	[Size diff] [varchar](50) NULL,
	[Comp NDC] [varchar](50) NULL,
	[Notes] [varchar](255) NULL,
	[LowestPrice] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalPricing_Historical]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalPricing_Historical](
	[UPC] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[VIN] [varchar](50) NULL,
	[CONTRACT_CODE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](50) NULL,
	[SHORT_DESCRIPTION] [varchar](50) NULL,
	[STRENGTH] [varchar](50) NULL,
	[FORM] [varchar](50) NULL,
	[SIZE] [varchar](50) NULL,
	[RXOTC] [varchar](50) NULL,
	[MINORDER] [varchar](50) NULL,
	[QTY] [varchar](50) NULL,
	[UNITS] [varchar](50) NULL,
	[AWP] [varchar](50) NULL,
	[INV] [varchar](50) NULL,
	[MSR] [varchar](50) NULL,
	[MANUFACTURER] [varchar](50) NULL,
	[UPDATED] [varchar](50) NULL,
	[GPI] [varchar](50) NULL,
	[BGO] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectronicComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectronicComparisons](
	[ElectronicComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [varchar](50) NULL,
	[Program] [varchar](50) NULL,
	[Descr] [varchar](50) NULL,
	[API#] [varchar](50) NULL,
	[Desc] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQTY] [numeric](10, 2) NULL,
	[APIPrice] [money] NULL,
	[APIExt] [money] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AdjReb] [money] NULL,
	[AdjExt] [money] NULL,
	[Diff] [money] NULL,
	[ItemStat] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[DateAppended] [datetime] NULL,
	[Source] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_ElectronicComparisons] PRIMARY KEY CLUSTERED 
(
	[ElectronicComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluations]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluations](
	[EvaluationsID] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](12) NULL,
	[Group] [varchar](12) NULL,
	[For] [varchar](50) NULL,
	[DateSaved] [date] NULL,
	[ItemNbr] [varchar](12) NULL,
	[ItemDesc] [varchar](50) NULL,
	[Unit] [varchar](12) NULL,
	[Size] [numeric](10, 2) NULL,
	[Contract] [varchar](12) NULL,
	[Program] [varchar](12) NULL,
	[Qty] [int] NULL,
	[APIPrice] [money] NULL,
	[Store] [money] NULL,
	[AWP] [money] NULL,
	[Net] [money] NULL,
	[PercentDiff] [decimal](10, 2) NULL,
	[DollarDiff] [money] NULL,
	[LastUpdated] [date] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Evaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nchar](128) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IC_Status]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IC_Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [nchar](16) NOT NULL,
 CONSTRAINT [PK_IC_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComparisons](
	[ProductComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceComparisonID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[StorePrice] [decimal](11, 2) NOT NULL,
	[CIN] [varchar](24) NULL,
	[AAPExtendedPrice] [decimal](11, 2) NOT NULL,
	[StoreExtendedPrice] [decimal](11, 2) NOT NULL,
	[Contract] [varchar](64) NULL,
	[CardinalPricing_EntryID] [int] NULL,
 CONSTRAINT [PK_ProductComparisons] PRIMARY KEY CLUSTERED 
(
	[ProductComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nchar](128) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TerritoryManagers]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerritoryManagers](
	[TerritoryManagerID] [int] NOT NULL,
	[TerritoryManagerName] [varchar](128) NOT NULL,
	[Active] [int] NOT NULL,
 CONSTRAINT [CPK_TerritoryManagers] PRIMARY KEY CLUSTERED 
(
	[TerritoryManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[AAPComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AAPComparisons](
	[AAPComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[CIN] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[Descr] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQty] [int] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AAPPrice] [money] NULL,
	[AAPExt] [money] NULL,
	[Program] [varchar](50) NULL,
	[DiffStoreVsAAP] [money] NULL,
	[DateAppended] [datetime] NULL,
	[Group] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_AAPComparisons] PRIMARY KEY CLUSTERED 
(
	[AAPComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[ElectronicComparisons]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ElectronicComparisons](
	[ElectronicComparisonsID] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [varchar](50) NULL,
	[Program] [varchar](50) NULL,
	[Descr] [varchar](50) NULL,
	[API#] [varchar](50) NULL,
	[Desc] [varchar](250) NULL,
	[Size] [numeric](10, 2) NULL,
	[ShipQTY] [numeric](10, 2) NULL,
	[APIPrice] [money] NULL,
	[APIExt] [money] NULL,
	[StorePrice] [money] NULL,
	[StoreExt] [money] NULL,
	[AdjReb] [money] NULL,
	[AdjExt] [money] NULL,
	[Diff] [money] NULL,
	[ItemStat] [varchar](50) NULL,
	[For] [varchar](50) NULL,
	[DateAppended] [datetime] NULL,
	[Source] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_ElectronicComparisons] PRIMARY KEY CLUSTERED 
(
	[ElectronicComparisonsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[Evaluations]    Script Date: 12/22/2020 3:42:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Evaluations](
	[EvaluationsID] [int] IDENTITY(1,1) NOT NULL,
	[Source] [varchar](12) NULL,
	[Group] [varchar](12) NULL,
	[For] [varchar](50) NULL,
	[DateSaved] [date] NULL,
	[ItemNbr] [varchar](12) NULL,
	[ItemDesc] [varchar](50) NULL,
	[Unit] [varchar](12) NULL,
	[Size] [numeric](10, 2) NULL,
	[Contract] [varchar](12) NULL,
	[Program] [varchar](12) NULL,
	[Qty] [int] NULL,
	[APIPrice] [money] NULL,
	[Store] [money] NULL,
	[AWP] [money] NULL,
	[Net] [money] NULL,
	[PercentDiff] [decimal](10, 2) NULL,
	[DollarDiff] [money] NULL,
	[LastUpdated] [date] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_Evaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[AAPComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[ElectronicComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[Evaluations] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] ADD  CONSTRAINT [DF_AAP_InvoiceComparisons_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[AAPComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ElectronicComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Evaluations] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Groups] ADD  CONSTRAINT [DF_Groups_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Suppliers] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [Staging].[AAPComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[ElectronicComparisons] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[Evaluations] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD FOREIGN KEY([TerritoryManagerID])
REFERENCES [dbo].[TerritoryManagers] ([TerritoryManagerID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD FOREIGN KEY([TerritoryManagerID])
REFERENCES [dbo].[TerritoryManagers] ([TerritoryManagerID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD  CONSTRAINT [FK_GroupAAP_InvoiceComparisons] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] CHECK CONSTRAINT [FK_GroupAAP_InvoiceComparisons]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD  CONSTRAINT [FK_StatusAAP_InvoiceComparisons] FOREIGN KEY([StatusID])
REFERENCES [dbo].[IC_Status] ([StatusID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] CHECK CONSTRAINT [FK_StatusAAP_InvoiceComparisons]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD  CONSTRAINT [FK_SupplierAAP_InvoiceComparisons] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] CHECK CONSTRAINT [FK_SupplierAAP_InvoiceComparisons]
GO
ALTER TABLE [dbo].[ProductComparisons]  WITH CHECK ADD FOREIGN KEY([CardinalPricing_EntryID])
REFERENCES [dbo].[CardinalPricing_forCompare] ([EntryID])
GO
ALTER TABLE [dbo].[ProductComparisons]  WITH CHECK ADD FOREIGN KEY([CardinalPricing_EntryID])
REFERENCES [dbo].[CardinalPricing_forCompare] ([EntryID])
GO
ALTER TABLE [dbo].[ProductComparisons]  WITH CHECK ADD  CONSTRAINT [FK_AAP_InvoiceComparisonsProductComparisons] FOREIGN KEY([InvoiceComparisonID])
REFERENCES [dbo].[AAP_InvoiceComparisons] ([InvoiceComparisonID])
GO
ALTER TABLE [dbo].[ProductComparisons] CHECK CONSTRAINT [FK_AAP_InvoiceComparisonsProductComparisons]
GO
