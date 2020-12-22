USE [ODSIntake]
GO
/****** Object:  Table [Archive].[API_Inventory]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[API_Inventory](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[LPSROM] [char](3) NOT NULL,
	[LPLZON] [char](2) NOT NULL,
	[LPLCID] [char](8) NOT NULL,
	[LPPRDC] [char](35) NOT NULL,
	[LPBATC] [char](13) NOT NULL,
	[LPFPUT] [numeric](8, 0) NOT NULL,
	[LPLPUT] [numeric](8, 0) NOT NULL,
	[LPLOQT] [numeric](17, 3) NOT NULL,
	[LPPIQT] [numeric](17, 3) NOT NULL,
	[LPSTTC] [char](1) NOT NULL,
	[LPLIST] [numeric](7, 0) NOT NULL,
	[LPPIPR] [numeric](3, 0) NOT NULL,
	[LPPUPR] [numeric](3, 0) NOT NULL,
	[LPSDAT] [numeric](8, 0) NOT NULL,
	[LPLOCT] [char](6) NOT NULL,
	[LPRQNC] [numeric](15, 3) NOT NULL,
	[LPUQNC] [numeric](15, 3) NOT NULL,
	[LPNCCN] [numeric](7, 0) NOT NULL,
	[LPSENC] [char](1) NOT NULL,
	[LPORFN] [numeric](7, 0) NOT NULL,
	[LPORFL] [numeric](5, 0) NOT NULL,
	[LPLCRE] [char](1) NOT NULL,
	[LPQCYN] [char](1) NOT NULL,
	[LPTDCD] [char](1) NOT NULL,
	[LPHLBA] [char](1) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [varbinary](8) NOT NULL,
	[ETLDateKey] [int] NULL,
	[ETLDate] [date] NULL,
	[ETLTime] [time](7) NULL,
 CONSTRAINT [CPK_Archive_API_Inventory] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[API_Inventory_2]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[API_Inventory_2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[LPSROM] [char](3) NOT NULL,
	[LPLZON] [char](2) NOT NULL,
	[LPLCID] [char](8) NOT NULL,
	[LPPRDC] [char](35) NOT NULL,
	[LPBATC] [char](13) NOT NULL,
	[LPFPUT] [numeric](8, 0) NOT NULL,
	[LPLPUT] [numeric](8, 0) NOT NULL,
	[LPLOQT] [numeric](17, 3) NOT NULL,
	[LPPIQT] [numeric](17, 3) NOT NULL,
	[LPSTTC] [char](1) NOT NULL,
	[LPLIST] [numeric](7, 0) NOT NULL,
	[LPPIPR] [numeric](3, 0) NOT NULL,
	[LPPUPR] [numeric](3, 0) NOT NULL,
	[LPSDAT] [numeric](8, 0) NOT NULL,
	[LPLOCT] [char](6) NOT NULL,
	[LPRQNC] [numeric](15, 3) NOT NULL,
	[LPUQNC] [numeric](15, 3) NOT NULL,
	[LPNCCN] [numeric](7, 0) NOT NULL,
	[LPSENC] [char](1) NOT NULL,
	[LPORFN] [numeric](7, 0) NOT NULL,
	[LPORFL] [numeric](5, 0) NOT NULL,
	[LPLCRE] [char](1) NOT NULL,
	[LPQCYN] [char](1) NOT NULL,
	[LPTDCD] [char](1) NOT NULL,
	[LPHLBA] [char](1) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [varbinary](8) NOT NULL,
	[ETLDateKey] [int] NULL,
	[ETLDate] [date] NULL,
	[ETLTime] [time](7) NULL,
 CONSTRAINT [CPK_Archive_API_Inventory_2] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[APIOrder]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APIOrder](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[IDINVN] [numeric](7, 0) NOT NULL,
	[IDTYPP] [numeric](1, 0) NOT NULL,
	[IDINYY] [numeric](4, 0) NOT NULL,
	[IDORNO] [numeric](7, 0) NOT NULL,
	[IDLINE] [numeric](5, 0) NOT NULL,
	[IDIDAT] [numeric](8, 0) NOT NULL,
	[IDCUNO] [char](11) NOT NULL,
	[IDPRDC] [char](35) NOT NULL,
	[IDDESC] [char](30) NOT NULL,
	[IDQTY] [numeric](15, 3) NOT NULL,
	[IDDECC] [numeric](1, 0) NOT NULL,
	[IDSQTY] [numeric](15, 3) NOT NULL,
	[IDDECU] [numeric](1, 0) NOT NULL,
	[IDUNIT] [char](5) NOT NULL,
	[IDDDAT] [numeric](8, 0) NOT NULL,
	[IDDTIM] [numeric](5, 0) NOT NULL,
	[IDSALP] [numeric](17, 4) NOT NULL,
	[IDDCPR] [numeric](4, 2) NOT NULL,
	[IDDCAM] [numeric](17, 4) NOT NULL,
	[IDAMOU] [numeric](17, 4) NOT NULL,
	[IDFOCC] [char](1) NOT NULL,
	[IDOVDC] [char](1) NOT NULL,
	[IDVAHC] [char](4) NOT NULL,
	[IDSHPM] [char](30) NOT NULL,
	[IDCONO] [numeric](8, 0) NOT NULL,
	[IDRPRV] [numeric](17, 4) NOT NULL,
	[IDTRTY] [numeric](1, 0) NOT NULL,
	[IDCOSP] [numeric](17, 4) NOT NULL,
	[IDPGRP] [char](5) NOT NULL,
	[IDPAGR] [char](4) NOT NULL,
	[IDPCA1] [char](5) NOT NULL,
	[IDPCA2] [char](5) NOT NULL,
	[IDPCA3] [char](5) NOT NULL,
	[IDPCA4] [char](5) NOT NULL,
	[IDPCA5] [char](5) NOT NULL,
	[IDPCA6] [char](5) NOT NULL,
	[IDCGRP] [char](6) NOT NULL,
	[IDCAGR] [char](4) NOT NULL,
	[IDCCA1] [char](6) NOT NULL,
	[IDCCA2] [char](6) NOT NULL,
	[IDCCA3] [char](6) NOT NULL,
	[IDDGRP] [char](2) NOT NULL,
	[IDCOUN] [char](4) NOT NULL,
	[IDAREA] [char](3) NOT NULL,
	[IDHAND] [char](10) NOT NULL,
	[IDSROM] [char](3) NOT NULL,
	[IDORDT] [char](2) NOT NULL,
	[IDSUPP] [char](11) NOT NULL,
	[IDODIS] [numeric](4, 2) NOT NULL,
	[IDSALE] [char](10) NOT NULL,
	[IDNPRC] [numeric](17, 4) NOT NULL,
	[IDEXR3] [numeric](13, 7) NOT NULL,
	[IDSTRU] [numeric](1, 0) NOT NULL,
	[IDRDTE] [numeric](8, 0) NOT NULL,
	[IDRDTI] [numeric](5, 0) NOT NULL,
	[IDTDCD] [char](1) NOT NULL,
	[IDDDCD] [char](1) NOT NULL,
	[IDPOTP] [char](2) NOT NULL,
	[IDPORN] [numeric](7, 0) NOT NULL,
	[IDPLIN] [numeric](5, 0) NOT NULL,
	[IDPCOD] [char](3) NOT NULL,
	[IDPERI] [numeric](6, 0) NOT NULL,
	[IDSENC] [char](1) NOT NULL,
	[IDOLIN] [numeric](5, 0) NOT NULL,
	[IDGWGT] [numeric](11, 5) NOT NULL,
	[IDNWGT] [numeric](11, 5) NOT NULL,
	[IDGVOL] [numeric](11, 5) NOT NULL,
	[IDNVOL] [numeric](11, 5) NOT NULL,
	[IDICNO] [char](11) NOT NULL,
	[IDSTCF] [numeric](1, 0) NOT NULL,
	[IDSVCC] [char](1) NOT NULL,
	[IDAGMC] [char](1) NOT NULL,
	[IDTECN] [char](10) NOT NULL,
	[IDPTPE] [char](5) NOT NULL,
	[IDODAT] [numeric](8, 0) NOT NULL,
	[IDNOTR] [char](3) NOT NULL,
	[IDPOVA] [char](4) NOT NULL,
	[IDCSNO] [char](18) NOT NULL,
	[IDOCOU] [char](4) NOT NULL,
	[IDNSVA] [numeric](17, 4) NOT NULL,
	[IDDLBU] [char](1) NOT NULL,
	[IDCIPO] [numeric](7, 0) NOT NULL,
	[IDIORD] [char](1) NOT NULL,
	[IDIOTY] [char](2) NOT NULL,
	[IDLCVA] [numeric](17, 4) NOT NULL,
	[IDEDPC] [char](1) NOT NULL,
	[IDBTCC] [char](1) NOT NULL,
	[IDPODR] [char](20) NOT NULL,
	[IDPROD] [char](1) NOT NULL,
	[IDDENO] [char](11) NOT NULL,
	[IDDIS2] [numeric](4, 2) NOT NULL,
	[IDDIS3] [numeric](4, 2) NOT NULL,
	[IDDIS4] [numeric](4, 2) NOT NULL,
	[IDDIS5] [numeric](4, 2) NOT NULL,
	[IDDIS6] [numeric](4, 2) NOT NULL,
	[IDDIS7] [numeric](4, 2) NOT NULL,
	[IDDIS8] [numeric](4, 2) NOT NULL,
	[IDDIS9] [numeric](4, 2) NOT NULL,
	[IDITET] [numeric](17, 3) NOT NULL,
	[IDITIT] [numeric](17, 3) NOT NULL,
	[IDITT] [numeric](17, 3) NOT NULL,
	[IDTAXF] [char](1) NOT NULL,
	[IDUPBA] [numeric](9, 5) NOT NULL,
	[IDVATI] [char](1) NOT NULL,
	[IDLAOC] [numeric](17, 4) NOT NULL,
	[IDVAOC] [numeric](17, 4) NOT NULL,
	[IDTAXC] [char](1) NOT NULL,
	[IDTSRM] [char](3) NOT NULL,
	[IDCIOL] [numeric](5, 0) NOT NULL,
	[IDCCOD] [char](3) NOT NULL,
	[IDHCOD] [char](5) NOT NULL,
	[IDLBCD] [char](3) NOT NULL,
	[IDNCCN] [numeric](7, 0) NOT NULL,
	[IDPCKT] [char](10) NOT NULL,
	[IDREAS] [char](3) NOT NULL,
	[IDIVTP] [char](4) NOT NULL,
	[IDROCO] [char](1) NOT NULL,
	[IDAGMT] [char](12) NOT NULL,
	[IDPDGR] [char](5) NOT NULL,
	[IDINUM] [numeric](7, 0) NOT NULL,
	[IDINLN] [numeric](5, 0) NOT NULL,
	[IDQUNO] [numeric](7, 0) NOT NULL,
	[IDVRNO] [numeric](2, 0) NOT NULL,
	[IDQULN] [numeric](5, 0) NOT NULL,
	[IDDECCH1] [char](6) NOT NULL,
	[IDDECCH2] [char](6) NOT NULL,
	[IDDECCH3] [char](6) NOT NULL,
	[IDDECCH4] [char](6) NOT NULL,
	[IDDECCH5] [char](6) NOT NULL,
	[IDDECCH6] [char](6) NOT NULL,
	[IDDECCH7] [char](6) NOT NULL,
	[IDDECCH8] [char](6) NOT NULL,
	[IDDECCH9] [char](6) NOT NULL,
	[IDDECCF1] [char](6) NOT NULL,
	[IDDECCF2] [char](6) NOT NULL,
	[IDDECCF3] [char](6) NOT NULL,
	[IDDECCF4] [char](6) NOT NULL,
	[IDDECCF5] [char](6) NOT NULL,
	[IDDECCUN] [char](11) NOT NULL,
	[IDDEDCUN] [char](11) NOT NULL,
	[IDDEPST1] [char](5) NOT NULL,
	[IDDEPST2] [char](5) NOT NULL,
	[IDDEPST3] [char](5) NOT NULL,
	[IDDEPST4] [char](5) NOT NULL,
	[IDDEPST5] [char](5) NOT NULL,
	[IDDEPST6] [char](5) NOT NULL,
	[IDDEPST7] [char](5) NOT NULL,
	[IDDEPST8] [char](5) NOT NULL,
	[IDDEPST9] [char](5) NOT NULL,
	[IDAMCF] [numeric](1, 0) NOT NULL,
	[IDCPCF] [numeric](1, 0) NOT NULL,
	[IDPPGR] [char](5) NOT NULL,
	[IDPRFA] [char](5) NOT NULL,
	[IDPRSE] [char](5) NOT NULL,
	[IDPROI] [numeric](7, 0) NOT NULL,
	[IDPRPH] [numeric](3, 0) NOT NULL,
	[IDPROL] [numeric](4, 0) NOT NULL,
	[IDPLAN] [char](10) NOT NULL,
	[IDPRCL] [char](1) NOT NULL,
	[IDPRIL] [char](2) NOT NULL,
	[IDSOPR] [numeric](1, 0) NOT NULL,
	[IDBOPR] [numeric](1, 0) NOT NULL,
	[IDTXKY] [numeric](15, 0) NOT NULL,
	[IDCPRD] [char](35) NOT NULL,
	[IDCPDS] [char](30) NOT NULL,
	[IDCSTS] [char](7) NOT NULL,
	[IDDIVN] [char](8) NOT NULL,
	[IDCOPO] [char](1) NOT NULL,
	[IDIS01] [char](35) NOT NULL,
	[IDIS02] [char](35) NOT NULL,
	[IDIS03] [char](35) NOT NULL,
	[IDIS04] [char](35) NOT NULL,
	[IDIS05] [char](35) NOT NULL,
	[IDIS06] [char](35) NOT NULL,
	[IDISPR] [char](35) NOT NULL,
	[IDAGTP] [char](5) NOT NULL,
	[IDJNBR] [numeric](3, 0) NOT NULL,
	[IDOPRD] [char](35) NOT NULL,
	[IDOSEN] [char](20) NOT NULL,
	[IDRECQ] [numeric](15, 3) NOT NULL,
	[IDREC1] [numeric](15, 3) NOT NULL,
	[IDACQT] [numeric](15, 3) NOT NULL,
	[IDACT1] [numeric](15, 3) NOT NULL,
	[IDIREC] [char](1) NOT NULL,
	[IDPDDT] [numeric](8, 0) NOT NULL,
	[IDPDRD] [numeric](5, 0) NOT NULL,
	[IDDEBI] [numeric](4, 0) NOT NULL,
	[IDRESP] [char](10) NOT NULL,
	[IDCCGR] [char](5) NOT NULL,
	[IDPCGR] [char](5) NOT NULL,
	[IDSPGR] [char](5) NOT NULL,
	[IDSDAG] [char](15) NOT NULL,
	[IDSDCA] [numeric](17, 4) NOT NULL,
	[IDSATX] [char](1) NOT NULL,
	[IDPRME] [char](5) NOT NULL,
	[IDSHPA] [char](11) NOT NULL,
	[IDROUT] [char](10) NOT NULL,
	[IDDEST] [char](10) NOT NULL,
	[IDTPRC] [char](1) NOT NULL,
	[IDDLVD] [numeric](8, 0) NOT NULL,
	[IDRDVD] [numeric](8, 0) NOT NULL,
	[IDTRPT] [numeric](3, 0) NOT NULL,
	[IDDEPA] [char](10) NOT NULL,
	[IDPCKD] [char](1) NOT NULL,
	[IDPTQT] [numeric](15, 3) NOT NULL,
	[IDUSPUNT] [char](5) NOT NULL,
	[IDUSPCNV] [numeric](15, 9) NOT NULL,
	[IDUSPQTY] [numeric](23, 7) NOT NULL,
	[IDUSRRAQ] [numeric](15, 3) NOT NULL,
	[IDUSRRUQ] [numeric](15, 3) NOT NULL,
	[IDUSPRQY] [numeric](15, 3) NOT NULL,
	[IDRBPR] [numeric](17, 4) NOT NULL,
	[IDUSCURB] [numeric](17, 4) NOT NULL,
	[IDUSPACU] [numeric](23, 9) NOT NULL,
	[IDRPAB] [numeric](17, 4) NOT NULL,
	[IDUSPSLN] [numeric](5, 0) NOT NULL,
	[IDGTPE] [char](5) NOT NULL,
	[IDSHPG] [char](5) NOT NULL,
	[IDLTYP] [numeric](2, 0) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_Archive_APIOrder] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[APIPricing]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APIPricing](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ROW] [bigint] NULL,
	[COMPANY_NO] [numeric](3, 0) NULL,
	[SKU] [varchar](20) NULL,
	[STATUS] [varchar](8) NULL,
	[PRODUCT_ONLINE] [varchar](1) NULL,
	[NAME] [char](30) NULL,
	[CATEGORY_NAME] [varchar](30) NULL,
	[CATEGORY_ID] [char](6) NULL,
	[TOP_CATEGORY_NAME] [varchar](30) NULL,
	[TOP_CATEGORY_ID] [char](6) NULL,
	[NDC] [char](13) NULL,
	[UPC] [char](18) NULL,
	[BARCODE] [char](18) NULL,
	[IS_CONTROL] [varchar](1) NULL,
	[IS_CII_CONTROL] [varchar](1) NULL,
	[IS_REMS_RESTRICTED] [varchar](1) NULL,
	[IS_REFRIGERATED] [varchar](1) NULL,
	[TAX_CLASS_NAME] [varchar](1) NULL,
	[PRICE] [numeric](9, 2) NULL,
	[CREATED] [numeric](8, 0) NULL,
	[UPDATED] [numeric](8, 0) NULL,
	[MSRP] [numeric](9, 2) NULL,
	[RELATED_SKUS] [varchar](1) NULL,
	[UPSELL_SKUS] [varchar](1) NULL,
	[ALLOCATION] [numeric](9, 2) NULL,
	[IMAGE_PATH_LG] [varchar](73) NULL,
	[WEIGHT] [numeric](11, 4) NULL,
	[DESCRIPTION] [char](30) NULL,
	[BRAND_NAME] [char](30) NULL,
	[REBATE_AMT] [numeric](11, 4) NULL,
	[RowCreatedDate] [datetime] NULL,
	[EffectiveDate] [date] NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[APISalesDetail]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APISalesDetail](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NULL,
	[InvLine] [varchar](4) NULL,
	[CustNbr] [varchar](35) NULL,
	[Cust] [varchar](100) NULL,
	[Item] [varchar](100) NULL,
	[NDC] [varchar](100) NULL,
	[Qty] [varchar](100) NULL,
	[ItemAmt] [varchar](100) NULL,
	[ItemGrp] [varchar](100) NULL,
	[AcctGrp] [varchar](100) NULL,
	[Slsman] [varchar](100) NULL,
	[InvDate] [varchar](100) NULL,
	[LineAmt] [varchar](100) NULL,
	[ExtSales] [varchar](100) NULL,
	[SalesOrd] [varchar](100) NULL,
	[DISREBATE] [varchar](100) NULL,
	[IDTYPP] [varchar](100) NULL,
	[IDNSVA] [varchar](100) NULL,
	[REBATE] [varchar](100) NULL,
	[IDPAGR] [varchar](100) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ItemNo] [varchar](25) NULL,
	[CarrierCode] [varchar](50) NULL,
	[WharehouseNum] [varchar](10) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [CPK_Archive_APISalesDetail] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[CONTRACT]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[CONTRACT](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[show] [bit] NOT NULL,
	[ID] [int] NOT NULL,
	[delete] [bit] NOT NULL,
	[Contract Status] [nvarchar](255) NULL,
	[Contract Status 2] [nvarchar](255) NULL,
	[Control Rx] [bit] NOT NULL,
	[API Item #] [nvarchar](255) NULL,
	[REPLACE#] [nvarchar](50) NULL,
	[NDC #] [nvarchar](12) NULL,
	[Brand Reference] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [decimal](8, 2) NULL,
	[Contract] [nvarchar](255) NULL,
	[Program] [nvarchar](255) NULL,
	[Rate] [nvarchar](255) NULL,
	[Invoice Price] [money] NULL,
	[DISCOUNT-RX PRICE] [money] NULL,
	[BW Contract Price] [money] NULL,
	[Contract Price] [money] NULL,
	[API Price] [money] NULL,
	[AWP] [money] NULL,
	[Net Price] [money] NULL,
	[Rebate] [money] NULL,
	[% Rebate] [float] NULL,
	[case pk] [int] NULL,
	[inner pk] [int] NULL,
	[Fee] [nvarchar](255) NULL,
	[MFG Date] [nvarchar](255) NULL,
	[API Date] [datetime] NULL,
	[billable size] [nvarchar](50) NULL,
	[billable cost] [nvarchar](50) NULL,
	[4% of price] [nvarchar](255) NULL,
	[rebate minus 4% of price] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_CONTRACT] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[ContractUp]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[ContractUp](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[case pk] [float] NULL,
	[inner pk] [float] NULL,
	[1] [nvarchar](255) NULL,
	[2] [nvarchar](255) NULL,
	[Control Rx] [bit] NULL,
	[API ITEM #] [nvarchar](255) NULL,
	[REPLACE#] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[temp-ndc number] [nvarchar](255) NULL,
	[BRAND REFER] [nvarchar](255) NULL,
	[ITEM DESCRIPTION] [nvarchar](255) NULL,
	[UNIT] [nvarchar](255) NULL,
	[SIZE] [nvarchar](255) NULL,
	[CONTRACT] [nvarchar](255) NULL,
	[INVOICE PRICE] [money] NULL,
	[CONTRACT PRICE] [money] NULL,
	[API PRICE] [money] NULL,
	[FEE SCHED] [float] NULL,
	[AWP] [money] NULL,
	[PROGRAM] [nvarchar](255) NULL,
	[RATE] [nvarchar](255) NULL,
	[MFG Multiple for  Rebate] [float] NULL,
	[NET PRICE] [money] NULL,
	[REBATE] [money] NULL,
	[% REBATE] [float] NULL,
	[Value Add Factor] [float] NULL,
	[Value Add Basis] [nvarchar](255) NULL,
	[ADR Item] [bit] NULL,
	[ADR Expiry] [nvarchar](255) NULL,
	[MFG DATE] [nvarchar](255) NULL,
	[Work Date] [nvarchar](255) NULL,
	[API DATE] [datetime] NULL,
	[REVIEW] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[TempSIZE] [nvarchar](255) NULL,
	[billable size] [nvarchar](255) NULL,
	[billable cost] [nvarchar](255) NULL,
	[4% of price] [nvarchar](255) NULL,
	[rebate minus 4% of price] [nvarchar](255) NULL,
	[Comments] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_ContractUp] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[KPI_AllyScripts]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[KPI_AllyScripts](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FileRowID] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[Pharmacy] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[AAPNumber] [varchar](255) NULL,
	[APINumber] [varchar](255) NULL,
	[Date] [varchar](255) NULL,
	[RXReceived] [varchar](255) NULL,
	[RXFilled] [varchar](255) NULL,
	[Transferred] [varchar](255) NULL,
	[FileProcessed] [varchar](1000) NULL,
	[RowCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[Rx30Claims]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[Rx30Claims](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FileRowID] [int] NOT NULL,
	[PharmID] [varchar](500) NULL,
	[BINNbr] [varchar](500) NULL,
	[PCN] [varchar](500) NULL,
	[GroupNbr] [varchar](500) NULL,
	[Submitted] [varchar](500) NULL,
	[RxDate] [varchar](500) NULL,
	[QtyDispensed] [varchar](500) NULL,
	[DaySupply] [varchar](500) NULL,
	[NDCDispensed] [varchar](500) NULL,
	[FeeSubmitted] [varchar](500) NULL,
	[CostSubmitted] [varchar](500) NULL,
	[FeePaid] [varchar](500) NULL,
	[CostPaid] [varchar](500) NULL,
	[PlanAmount] [varchar](500) NULL,
	[CoPayAmount] [varchar](500) NULL,
	[UandC] [varchar](500) NULL,
	[TotalPrice] [varchar](500) NULL,
	[BS] [varchar](500) NULL,
	[BR] [varchar](500) NULL,
	[OI] [varchar](500) NULL,
	[DAW] [varchar](500) NULL,
	[DAWDesc] [varchar](500) NULL,
	[PatientPaid] [varchar](500) NULL,
	[GrossAmtDue] [varchar](500) NULL,
	[PlanID] [varchar](500) NULL,
	[RejCode] [varchar](500) NULL,
	[MessageResponse] [varchar](500) NULL,
	[TxResponse] [varchar](500) NULL,
	[RxNbr] [varchar](500) NULL,
	[RfNbr] [varchar](500) NULL,
	[PID_Q] [varchar](500) NULL,
	[PID] [varchar](500) NULL,
	[DoctorName] [varchar](500) NULL,
	[RA] [varchar](500) NULL,
	[NDCWritten] [varchar](500) NULL,
	[OtherAmount] [varchar](500) NULL,
	[TYPE] [varchar](500) NULL,
	[Rx30Lic] [varchar](500) NULL,
	[Compound] [varchar](500) NULL,
	[NetworkReimbID] [varchar](500) NULL,
	[PatientKey] [varchar](500) NULL,
	[PatientName] [varchar](500) NULL,
	[PatLocationCode] [varchar](500) NULL,
	[CardholderID] [varchar](500) NULL,
	[Patient Address] [varchar](500) NULL,
	[PatientCity] [varchar](500) NULL,
	[PatientState] [varchar](500) NULL,
	[PatientZip] [varchar](500) NULL,
	[PatientPhone] [varchar](500) NULL,
	[Birthdate] [varchar](500) NULL,
	[Gender] [varchar](500) NULL,
	[PrescriberPhone] [varchar](500) NULL,
	[RxSource] [varchar](500) NULL,
	[DRDEA] [varchar](500) NULL,
	[UnitAWP] [varchar](500) NULL,
	[PatientLastName] [varchar](500) NULL,
	[PatientFirstName] [varchar](500) NULL,
	[PatientMiddleName] [varchar](500) NULL,
	[FlatTaxPaid] [varchar](500) NULL,
	[PCTTaxPaid] [varchar](500) NULL,
	[PCTTaxRate] [varchar](500) NULL,
	[PCTTaxBasis] [varchar](500) NULL,
	[IncentiveFePaid] [varchar](500) NULL,
	[ProfFeePaid] [varchar](500) NULL,
	[PrescriberNPI] [varchar](500) NULL,
	[RxDiscount] [varchar](500) NULL,
	[ClaimAuthNumber] [varchar](500) NULL,
	[FileProcessed] [varchar](1000) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_Rx30Claims] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[StandeferCatalog]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[StandeferCatalog](
	[UPC] [varchar](15) NULL,
	[NDC] [varchar](15) NULL,
	[VIN] [varchar](250) NULL,
	[CONTRACT_CODE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SHORT_DESCRIPTION] [varchar](50) NULL,
	[STRENGTH] [varchar](50) NULL,
	[FORM] [varchar](100) NULL,
	[SIZE] [varchar](50) NULL,
	[RXOTC] [varchar](50) NULL,
	[MINORDER] [varchar](50) NULL,
	[QTY] [varchar](50) NULL,
	[UNITS] [varchar](50) NULL,
	[AWP] [real] NULL,
	[INV] [real] NULL,
	[MSR] [varchar](50) NULL,
	[MANUFACTURER] [varchar](50) NULL,
	[UPDATED] [datetime] NULL,
	[GPI] [varchar](25) NULL,
	[BGO] [varchar](50) NULL,
	[DateKey] [datetime] NULL,
	[CatalogDate] [varchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[UserLogin]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[UserLogin](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[uname] [char](30) NOT NULL,
	[name] [char](30) NOT NULL,
	[pwd] [char](10) NOT NULL,
	[active] [char](1) NOT NULL,
	[api_id] [char](11) NOT NULL,
	[default_pmid] [char](6) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Archive_UserLogin] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[2018ConferenceCredits]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2018ConferenceCredits](
	[Territory] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[API #] [nvarchar](255) NULL,
	[Group #] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[API Status] [nvarchar](255) NULL,
	[Conference 2018] [nvarchar](255) NULL,
	[API Credit] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPCardinalAccounts_LHC]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPCardinalAccounts_LHC](
	[Marker] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[AKA] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[AAP Number] [nvarchar](255) NULL,
	[AAP Parent#] [nvarchar](255) NULL,
	[MCA on File] [bit] NOT NULL,
	[Bs Class] [nvarchar](255) NULL,
	[AAP Affiliate] [nvarchar](255) NULL,
	[CA Master Number] [nvarchar](255) NULL,
	[Cardinal Division#] [nvarchar](255) NULL,
	[Cardinal DC] [nvarchar](255) NULL,
	[Primary CA Acct#] [nvarchar](255) NULL,
	[2nd Cardinal cust] [nvarchar](255) NULL,
	[3rd Cardinal cust] [nvarchar](255) NULL,
	[POS Acct] [nvarchar](255) NULL,
	[Scan-Toss Acct] [nvarchar](255) NULL,
	[CSOS Acct] [nvarchar](255) NULL,
	[AAP Contract Date] [datetime] NULL,
	[Termination Date] [datetime] NULL,
	[Multiple Store] [bit] NOT NULL,
	[Multiple Store Code] [nvarchar](255) NULL,
	[Group Code] [nvarchar](255) NULL,
	[Current Est Mo Sales] [money] NULL,
	[Current Grp Total] [money] NULL,
	[Est Volume at Load] [money] NULL,
	[Last Review Date] [datetime] NULL,
	[Current API COG] [float] NULL,
	[Current CA COG] [float] NULL,
	[Payment Terms description] [nvarchar](255) NULL,
	[Payment Terms Code] [nvarchar](255) NULL,
	[Pending Changes] [bit] NOT NULL,
	[Change Pending] [nvarchar](255) NULL,
	[Notes COG Differences] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[AAP Rep] [nvarchar](255) NULL,
	[Excpt to Matrix] [bit] NOT NULL,
	[Optional Pay Terms] [bit] NOT NULL,
	[Contracted DSO] [float] NULL,
	[WAPD] [float] NULL,
	[DSO] [float] NULL,
	[Last Update] [datetime] NULL,
	[WAPD 2nd Acct] [float] NULL,
	[DSO 2nd Acct] [float] NULL,
	[Sublogic Change] [bit] NOT NULL,
	[Notes on Terms] [nvarchar](255) NULL,
	[High Volume Rebate] [bit] NOT NULL,
	[Est Annual Vol on comn own] [money] NULL,
	[Second Division] [nvarchar](255) NULL,
	[2nd Primary Number] [nvarchar](255) NULL,
	[2nd 2nd] [nvarchar](255) NULL,
	[2nd 3rd] [nvarchar](255) NULL,
	[2nd POS] [nvarchar](255) NULL,
	[2nd CSOS] [nvarchar](255) NULL,
	[2nd CST] [nvarchar](255) NULL,
	[Third Division] [nvarchar](255) NULL,
	[3rd Primary Number] [nvarchar](255) NULL,
	[3rd 2nd] [nvarchar](255) NULL,
	[3rd POS] [nvarchar](255) NULL,
	[3rd CSOS] [nvarchar](255) NULL,
	[3rd CST] [nvarchar](255) NULL,
	[Matrix Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ABC]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ABC](
	[C1] [varchar](8000) NULL,
	[C2] [varchar](8000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Affiliation_20200310]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affiliation_20200310](
	[(Do Not Modify) Account] [nvarchar](255) NULL,
	[(Do Not Modify) Row Checksum] [nvarchar](255) NULL,
	[(Do Not Modify) Modified On] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllObjectDefinition]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllObjectDefinition](
	[ServerName] [varchar](100) NULL,
	[DbName] [varchar](100) NULL,
	[ObjectName] [varchar](255) NULL,
	[ObjectDefinition] [varchar](8000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllSysJobSteps]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllSysJobSteps](
	[job_id] [uniqueidentifier] NOT NULL,
	[name] [sysname] NOT NULL,
	[step_id] [int] NOT NULL,
	[step_name] [sysname] NOT NULL,
	[command] [nvarchar](max) NULL,
	[server] [sysname] NULL,
	[database_name] [sysname] NULL,
	[database_user_name] [sysname] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_Missed_Disc_20200501]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_Missed_Disc_20200501](
	[IDCUNO] [nvarchar](255) NULL,
	[Disc Amount] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[Inv] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_RSE_20200805]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_RSE_20200805](
	[PMID] [nvarchar](100) NULL,
	[APIAccountNumHistorical] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_S2K_20200812]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_S2K_20200812](
	[INVNBR] [numeric](9, 0) NOT NULL,
	[INVLINE] [numeric](4, 0) NOT NULL,
	[CUSTNBR] [char](7) NOT NULL,
	[CUST] [char](30) NOT NULL,
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
	[DISREBATE] [varchar](1) NOT NULL,
	[IDTYPP] [char](1) NOT NULL,
	[IDNSVA] [varchar](1) NOT NULL,
	[REBATE] [numeric](15, 4) NOT NULL,
	[IDPAGR] [numeric](4, 0) NOT NULL,
	[DISCOUNTPERCENTAGE] [numeric](16, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_S2K_20200813]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_S2K_20200813](
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
	[DISREBATE] [varchar](1) NOT NULL,
	[IDTYPP] [char](1) NOT NULL,
	[IDNSVA] [varchar](1) NOT NULL,
	[REBATE] [numeric](15, 4) NOT NULL,
	[IDPAGR] [numeric](4, 0) NOT NULL,
	[DISCOUNTPERCENTAGE] [numeric](16, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_S2K_20200813_2]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_S2K_20200813_2](
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
	[DISREBATE] [varchar](1) NOT NULL,
	[IDTYPP] [char](1) NOT NULL,
	[IDNSVA] [varchar](1) NOT NULL,
	[REBATE] [numeric](15, 4) NOT NULL,
	[IDPAGR] [numeric](4, 0) NOT NULL,
	[DISCOUNTPERCENTAGE] [numeric](16, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_S2K_20200813_3]    Script Date: 12/22/2020 2:59:56 AM ******/
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
/****** Object:  Table [dbo].[API_UnitsSold_Sept]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_UnitsSold_Sept](
	[NDC] [varchar](11) NULL,
	[UnitsSold] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIAddress_20190125]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAddress_20190125](
	[APIID] [char](11) NOT NULL,
	[PMID] [char](6) NOT NULL,
	[ADSTAT] [char](1) NOT NULL,
	[ADNUM] [char](11) NOT NULL,
	[ADADNO] [numeric](3, 0) NOT NULL,
	[ADNAME] [char](30) NOT NULL,
	[ADADR1] [char](35) NOT NULL,
	[ADADR2] [char](35) NOT NULL,
	[ADADR3] [char](35) NOT NULL,
	[ADADR4] [char](35) NOT NULL,
	[ADPOCD] [char](16) NOT NULL,
	[ADCOUN] [char](4) NOT NULL,
	[ADTREG] [char](16) NOT NULL,
	[ADPIDE] [char](17) NOT NULL,
	[ADTRPT] [numeric](3, 0) NOT NULL,
	[ADPLRN] [numeric](8, 0) NOT NULL,
	[ADGANN] [numeric](8, 0) NOT NULL,
	[ADROUT] [char](10) NOT NULL,
	[ADDEPA] [char](10) NOT NULL,
	[ADDEST] [char](10) NOT NULL,
	[ADSHPA] [char](11) NOT NULL,
	[ADAD01] [char](1) NOT NULL,
	[ADAD02] [char](1) NOT NULL,
	[ADAD03] [char](1) NOT NULL,
	[ADAD04] [char](1) NOT NULL,
	[ADAD05] [char](1) NOT NULL,
	[ADAD06] [char](1) NOT NULL,
	[ADBART] [char](10) NOT NULL,
	[ADCNTY] [char](5) NOT NULL,
	[ADSPCD] [char](2) NOT NULL,
	[ADTAXJ] [char](12) NOT NULL,
	[ADLBCD] [char](3) NOT NULL,
	[ADAD07] [char](1) NOT NULL,
	[ADCAID] [char](5) NOT NULL,
	[ADAD08] [char](1) NOT NULL,
	[ADUSDLMO] [char](1) NOT NULL,
	[ADUSDLTU] [char](1) NOT NULL,
	[ADUSDLWE] [char](1) NOT NULL,
	[ADUSDLTH] [char](1) NOT NULL,
	[ADUSDLFR] [char](1) NOT NULL,
	[ADUSDLSA] [char](1) NOT NULL,
	[ADUSDLSU] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIFieldAudit_TH]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIFieldAudit_TH](
	[(Do Not Modify) Account] [nvarchar](255) NULL,
	[(Do Not Modify) Row Checksum] [nvarchar](255) NULL,
	[(Do Not Modify) Modified On] [datetime] NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Street 1] [nvarchar](255) NULL,
	[Street 2] [nvarchar](255) NULL,
	[Street 3] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[General Email] [nvarchar](255) NULL,
	[Main Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Group #] [nvarchar](255) NULL,
	[AAP #] [nvarchar](255) NULL,
	[API #] [nvarchar](255) NULL,
	[API Status] [nvarchar](255) NULL,
	[API Account Activation] [datetime] NULL,
	[API Credit Limit] [float] NULL,
	[API Warehouse] [nvarchar](255) NULL,
	[API Freight] [nvarchar](255) NULL,
	[API MOT] [nvarchar](255) NULL,
	[API Order Cut-Off] [nvarchar](255) NULL,
	[API Payment Method] [nvarchar](255) NULL,
	[API Payment Terms] [nvarchar](255) NULL,
	[API Primary Order Method] [nvarchar](255) NULL,
	[API CSOS Status] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Expiration] [datetime] NULL,
	[Federal Tax ID #] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[Financial Street 1] [nvarchar](255) NULL,
	[Financial Street 2] [nvarchar](255) NULL,
	[Financial Street 3] [nvarchar](255) NULL,
	[Financial City] [nvarchar](255) NULL,
	[Financial State] [nvarchar](255) NULL,
	[Financial Zip] [nvarchar](255) NULL,
	[Mailing Street 1] [nvarchar](255) NULL,
	[Mailing Street 2] [nvarchar](255) NULL,
	[Mailing Street 3] [nvarchar](255) NULL,
	[Mailing CIty] [nvarchar](255) NULL,
	[Mailing State] [nvarchar](255) NULL,
	[Mailing Zip] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[Primary Wholesaler] [nvarchar](255) NULL,
	[Primary CAH Account #] [nvarchar](255) NULL,
	[F48] [nvarchar](255) NULL,
	[F49] [nvarchar](255) NULL,
	[F50] [nvarchar](255) NULL,
	[F51] [nvarchar](255) NULL,
	[F52] [nvarchar](255) NULL,
	[F53] [nvarchar](255) NULL,
	[F54] [nvarchar](255) NULL,
	[F55] [nvarchar](255) NULL,
	[F56] [nvarchar](255) NULL,
	[F57] [nvarchar](255) NULL,
	[F58] [nvarchar](255) NULL,
	[F59] [nvarchar](255) NULL,
	[F60] [nvarchar](255) NULL,
	[F61] [nvarchar](255) NULL,
	[F62] [nvarchar](255) NULL,
	[F63] [nvarchar](255) NULL,
	[F64] [nvarchar](255) NULL,
	[F65] [nvarchar](255) NULL,
	[F66] [nvarchar](255) NULL,
	[F67] [nvarchar](255) NULL,
	[F68] [nvarchar](255) NULL,
	[F69] [nvarchar](255) NULL,
	[F70] [nvarchar](255) NULL,
	[F71] [nvarchar](255) NULL,
	[F72] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIInventory]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIInventory](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CompanyNo] [varchar](10) NULL,
	[ItemNum] [varchar](25) NULL,
	[Warehouse] [varchar](25) NULL,
	[QOH] [decimal](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_APIInventory] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIMontlyRebates_20190701]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIMontlyRebates_20190701](
	[Marker] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Total Whse Sales] [money] NULL,
	[API Whse Gross Rebate] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[20% Instant Rebate] [money] NULL,
	[Brand RX Monthly Credit] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Previous Month Held Rebate] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NOT NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Post Ave Rebate %] [float] NULL,
	[Arete Rebate Fee] [money] NULL,
	[API Generic Sales Tier 1] [money] NULL,
	[API Generic Sales Tier 2] [money] NULL,
	[API Generic Rebate Tier 1] [money] NULL,
	[API Generic Rebate Tier 2] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseReferncedObjects_20200805]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseReferncedObjects_20200805](
	[ServerName] [varchar](100) NULL,
	[BaseDbName] [varchar](100) NULL,
	[BaseSchemaObjectName] [varchar](100) NULL,
	[BaseObject] [varchar](100) NULL,
	[ReferencedDbName] [varchar](100) NULL,
	[ReferencedSchemaName] [varchar](100) NULL,
	[ReferencedObjectName] [varchar](100) NULL,
	[referenced_id] [int] NULL,
	[IsAmbigous] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_Betty_20200128]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_Betty_20200128](
	[Month] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[NetSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_UnitsSold_Sept]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_UnitsSold_Sept](
	[NDC] [varchar](15) NULL,
	[UnitsSold] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_Updated_July2019_20190917]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_Updated_July2019_20190917](
	[Marker] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[Price Protection] [money] NULL,
	[Adjusted Ext Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Vol Admin Fee Adjustment] [money] NULL,
	[RX Branded-RxPlus] [money] NULL,
	[RxPlus Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[Affil Admin Fee Adjustment] [money] NULL,
	[Total RX less Excluded items] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Adjusted Generic Source] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee Adjustment] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Generic rebate adjustment] [money] NULL,
	[COG Eligible Sales] [money] NULL,
	[COG Rebate] [money] NULL,
	[COG Rebate %] [float] NULL,
	[COG Rebate Adjustment] [money] NULL,
	[Florida Phcy Assoc Deduct] [money] NULL,
	[Leader Rebate] [money] NULL,
	[MSI Rebate] [money] NULL,
	[Price Protection Rebate] [money] NULL,
	[Price Protection Adjustment] [money] NULL,
	[Prescribed Wellness Fee] [money] NULL,
	[NCPA Membership Fee] [money] NULL,
	[Arete Eligible] [bit] NOT NULL,
	[Arete Performance Rebate] [money] NULL,
	[Check Fee] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL,
	[Sort Code] [nvarchar](255) NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Matrix] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cardinal Complete_20190708]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cardinal Complete_20190708](
	[UNITPRODUCT] [varchar](500) NULL,
	[SCANNEDUNITPRODUCTCODE] [varchar](500) NULL,
	[NDC] [varchar](500) NULL,
	[CARDINALITEMNUMBER] [varchar](500) NULL,
	[RXOTCFLAG] [varchar](500) NULL,
	[BRANDNAME] [varchar](500) NULL,
	[GENERICPRODUCTDESCRIPTION] [varchar](500) NULL,
	[AWP] [varchar](500) NULL,
	[CONTRACTPRICE] [varchar](500) NULL,
	[INVOICEPRICE] [varchar](500) NULL,
	[BASEPRICE] [varchar](500) NULL,
	[RETAILPRICE] [varchar](500) NULL,
	[FORM] [varchar](500) NULL,
	[STRENGTH] [varchar](500) NULL,
	[SIZE] [varchar](500) NULL,
	[UNITOFMEASURE] [varchar](500) NULL,
	[VENDORNAME] [varchar](500) NULL,
	[ACCUNETSIZE] [varchar](500) NULL,
	[CASEQUANTITY] [varchar](500) NULL,
	[PACKQUANTITY] [varchar](500) NULL,
	[UNITSIZE] [varchar](500) NULL,
	[DISPENSEQUANTITY] [varchar](500) NULL,
	[THERAPEUTICCLASSCODE] [varchar](500) NULL,
	[CONTRACTNUMBER] [varchar](500) NULL,
	[CONTRACTNAME] [varchar](500) NULL,
	[CONTRACTSTARTDATE] [varchar](500) NULL,
	[CONTRACTENDDATE] [varchar](500) NULL,
	[INVOICEPRICECHANGEDATE] [varchar](500) NULL,
	[BASEPRICECHANGEDATE] [varchar](500) NULL,
	[FINELINECODE] [varchar](500) NULL,
	[PREVIOUSINVOICEPRICE] [varchar](500) NULL,
	[CCAHEADER] [varchar](500) NULL,
	[GENERICCODE] [varchar](500) NULL,
	[GPPCCODE] [varchar](500) NULL,
	[GPI] [varchar](500) NULL,
	[API_Size] [varchar](500) NULL,
	[API ITEM  ] [varchar](500) NULL,
	[API PRICE] [varchar](500) NULL,
	[Adj Rebate] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfCredits_2019]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfCredits_2019](
	[Cust#] [nvarchar](255) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[Desc] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Sales Price] [money] NULL,
	[Gross Sales] [money] NULL,
	[Discount] [float] NULL,
	[Discount Amt] [money] NULL,
	[Adjust for Discounts] [nvarchar](255) NULL,
	[IDNSVA1] [money] NULL,
	[INVOICE ADJ] [nvarchar](255) NULL,
	[Calc Gross less Disc] [money] NULL,
	[Variance] [money] NULL,
	[Inv Date] [float] NULL,
	[Inv #] [float] NULL,
	[Admin Grp] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractPriceAnalysis_Mark]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractPriceAnalysis_Mark](
	[CIN] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Supplier Name] [nvarchar](255) NULL,
	[Strength] [nvarchar](255) NULL,
	[Accunet Size] [float] NULL,
	[UOM] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Form Description] [nvarchar](255) NULL,
	[AAP CONTRACT PRICE] [money] NULL,
	[Lowest GPI Price  ] [money] NULL,
	[Contract] [varchar](20) NULL,
	[PPP CONTRACT PRICE] [float] NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Formulary Name] [nvarchar](255) NULL,
	[END_DTE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].['Corrected LaJolla']    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['Corrected LaJolla'](
	[PMID] [nvarchar](255) NULL,
	[AAP Number] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Multiple Store Code] [nvarchar](255) NULL,
	[Current Est Mo Sales] [money] NULL,
	[Mo API Volume] [money] NULL,
	[CAH off Contract-LTC Volume] [money] NULL,
	[AAP Net Sales] [money] NULL,
	[Mo Comb Volume] [money] NULL,
	[AAP Sales- COG Applied] [money] NULL,
	[AAP Brand RX Sales] [money] NULL,
	[Current CA COG] [float] NULL,
	[Base] [float] NULL,
	[Brand RX@WAC] [money] NULL,
	[Brand RX Saved] [money] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[A/P Terms] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[Pay Y/N] [nvarchar](255) NULL,
	[DATE] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DateDim]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateDim](
	[DateKey] [int] NOT NULL,
	[TheDate] [date] NOT NULL,
	[DayOfMonth] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[DayOfWeek] [tinyint] NOT NULL,
	[DayName] [varchar](10) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[IsHoliday] [bit] NOT NULL,
	[HolidayText] [varchar](64) NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[ISOWeekOfYear] [tinyint] NOT NULL,
	[MonthOfYear] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[FirstDayOfMonth] [date] NOT NULL,
	[LastDayOfMonth] [date] NOT NULL,
	[FirstDayOfQuarter] [date] NOT NULL,
	[LastDayOfQuarter] [date] NOT NULL,
	[FirstDayOfYear] [date] NOT NULL,
	[LastDayOfYear] [date] NOT NULL,
	[FirstDayOfNextMonth] [date] NOT NULL,
	[FirstDayOfNextYear] [date] NOT NULL,
	[IsWeekDay] [bit] NOT NULL,
	[IsAAPHoliday] [bit] NOT NULL,
	[IsAPIHoliday] [bit] NOT NULL,
	[IsAPIShipDate] [bit] NOT NULL,
	[IsUPSShipDate] [bit] NOT NULL,
	[IsFedExShipDate] [bit] NOT NULL,
	[DayOfQuarter] [int] NOT NULL,
 CONSTRAINT [CPK_DateDim] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBA_ShrinkFile_Log]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBA_ShrinkFile_Log](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SQLCommand] [varchar](2000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster](
	[NDC] [varchar](11) NOT NULL,
	[GPI] [varchar](14) NULL,
	[DrugName] [varchar](25) NULL,
	[MFG] [varchar](30) NULL,
	[DrugType] [varchar](50) NULL,
	[DrugTypeShort] [varchar](3) NULL,
	[Unit] [varchar](2) NULL,
	[Form] [varchar](4) NULL,
	[PS] [decimal](8, 3) NULL,
	[PD] [varchar](10) NULL,
	[RxOTC] [varchar](3) NULL,
	[Repack] [varchar](1) NULL,
	[GPIDesc] [varchar](60) NULL,
	[Strength] [varchar](25) NULL,
	[Strength_Unit_Measure] [varchar](11) NULL,
	[OBSDTEC] [smalldatetime] NULL,
	[DEA] [int] NOT NULL,
	[WACPkg] [decimal](10, 2) NULL,
	[WAC] [decimal](13, 5) NULL,
	[WACEffDate] [smalldatetime] NULL,
	[AWPPkg] [decimal](10, 2) NULL,
	[AWP] [decimal](13, 5) NULL,
	[BBDC] [smalldatetime] NULL,
	[MSC] [varchar](1) NULL,
	[BNC] [varchar](1) NULL,
	[CSP] [decimal](37, 0) NULL,
	[DESI] [varchar](1) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[RouteAdmin] [varchar](2) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[AHFSCC_Therapeutic_Class_Code] [decimal](37, 0) NULL,
	[GPPC] [varchar](25) NULL,
	[NDC_10] [varchar](11) NULL,
	[IDCode] [varchar](1) NULL,
	[PackageQuantity] [decimal](37, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster_20170919]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_20170919](
	[NDC] [varchar](255) NULL,
	[GPI] [varchar](255) NULL,
	[DrugName] [varchar](255) NULL,
	[MFG] [varchar](255) NULL,
	[DrugType] [varchar](255) NULL,
	[DrugTypeShort] [varchar](255) NULL,
	[Unit] [varchar](255) NULL,
	[Form] [varchar](255) NULL,
	[PS] [varchar](255) NULL,
	[PD] [varchar](255) NULL,
	[RxOTC] [varchar](255) NULL,
	[Repack] [varchar](255) NULL,
	[GPIDesc] [varchar](255) NULL,
	[Strength] [varchar](255) NULL,
	[Strength_Unit_Measure] [varchar](255) NULL,
	[OBSDTEC] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[WACPkg] [varchar](255) NULL,
	[WAC] [varchar](255) NULL,
	[WACEffDate] [varchar](255) NULL,
	[AWPPkg] [varchar](255) NULL,
	[AWP] [varchar](255) NULL,
	[BBDC] [varchar](255) NULL,
	[MSC] [varchar](255) NULL,
	[BNC] [varchar](255) NULL,
	[CSP] [varchar](255) NULL,
	[DESI] [varchar](255) NULL,
	[DEA_Class_Code] [varchar](255) NULL,
	[RouteAdmin] [varchar](255) NULL,
	[RX_OTC_Indicator_Code] [varchar](255) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](255) NULL,
	[AHFSCC_Therapeutic_Class_Code] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FDA_Products]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FDA_Products](
	[ApplNo] [varchar](500) NULL,
	[ProductNo] [varchar](500) NULL,
	[Form] [varchar](500) NULL,
	[Strength] [varchar](500) NULL,
	[ReferenceDrug] [varchar](500) NULL,
	[DrugName] [varchar](500) NULL,
	[ActiveIngredient] [varchar](500) NULL,
	[ReferenceStandard] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileCheck]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileCheck](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](500) NULL,
	[FileName] [varchar](250) NULL,
	[DoesFileExist] [bit] NOT NULL,
	[VerifiedDate] [datetime] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileLog]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](1000) NULL,
	[DownloadDateTime] [datetime] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[Process] [varchar](250) NULL,
 CONSTRAINT [CPK_FileLog] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FINALPAYOUTTABLE_Sept2019]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FINALPAYOUTTABLE_Sept2019](
	[Marker] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Total Whse Sales] [money] NULL,
	[API Whse Gross Rebate] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[20% Instant Rebate] [money] NULL,
	[Brand RX Monthly Credit] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Previous Month Held Rebate] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NOT NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Post Ave Rebate %] [float] NULL,
	[Arete Rebate Fee] [money] NULL,
	[API Generic Sales Tier 1] [money] NULL,
	[API Generic Sales Tier 2] [money] NULL,
	[API Generic Rebate Tier 1] [money] NULL,
	[API Generic Rebate Tier 2] [money] NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[G06_20190702]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G06_20190702](
	[Invoice] [float] NULL,
	[CustNum] [nvarchar](255) NULL,
	[InvDate] [float] NULL,
	[Item] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Price] [money] NULL,
	[Ext Price] [money] NULL,
	[ItemGrp] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generics]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generics](
	[NDC] [varchar](11) NULL,
	[GPI] [varchar](14) NULL,
	[DrugName] [varchar](25) NULL,
	[MFG] [varchar](30) NULL,
	[DrugType] [varchar](50) NULL,
	[DrugTypeShort] [varchar](3) NULL,
	[Unit] [varchar](2) NULL,
	[Form] [varchar](4) NULL,
	[PS] [numeric](8, 3) NULL,
	[PD] [varchar](10) NULL,
	[RxOTC] [varchar](3) NULL,
	[Repack] [varchar](1) NULL,
	[GPIDesc] [varchar](60) NULL,
	[Strength] [numeric](13, 5) NULL,
	[Strength_Unit_Measure] [varchar](11) NULL,
	[OBSDTEC] [smalldatetime] NULL,
	[DEA] [int] NOT NULL,
	[WACPkg] [numeric](10, 2) NULL,
	[WAC] [numeric](13, 5) NULL,
	[WACEffDate] [smalldatetime] NULL,
	[AWPPkg] [numeric](10, 2) NULL,
	[AWP] [numeric](13, 5) NULL,
	[BBDC] [smalldatetime] NULL,
	[MSC] [varchar](1) NULL,
	[BNC] [varchar](1) NULL,
	[CSP] [numeric](37, 0) NULL,
	[DESI] [varchar](1) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[RouteAdmin] [varchar](2) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HV_lovie_20200622]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HV_lovie_20200622](
	[PMID] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Month] [float] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Month1] [nvarchar](255) NULL,
	[1% Generic Admin1] [money] NULL,
	[Incentive from AAP Net Sales1] [money] NULL,
	[High Volume Incentive1] [money] NULL,
	[TOTAL DUE ACCOUNT ] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_PriceProtection]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PriceProtection](
	[Date] [datetime] NULL,
	[RebateReportMonth] [datetime] NULL,
	[L01AfltnName] [varchar](255) NULL,
	[DCNumber] [float] NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[CorpItemNumber] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[Size] [varchar](255) NULL,
	[ProtectedSelPrice] [money] NULL,
	[NewSellPrice] [money] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[Prev3MonthUsage] [float] NULL,
	[AvgMonthlyUsage] [float] NULL,
	[UnitSellDlr] [money] NULL,
	[ActualUsageToDate] [float] NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[State] [varchar](255) NULL,
	[SubAffiliation] [varchar](255) NULL,
	[CustomerUnique] [varchar](255) NULL,
	[Usage] [float] NULL,
	[Returns] [float] NULL,
	[PriorMonthUsage] [float] NULL,
	[Available] [float] NULL,
	[OverageLastMonth] [float] NULL,
	[TotalOwed] [float] NULL,
	[UsageForCalculation] [float] NULL,
	[Comment] [varchar](255) NULL,
	[RebatePerc] [float] NULL,
	[FinalPriceProtectionDue] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceComparison]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceComparison](
	[Date] [datetime] NULL,
	[Type] [nvarchar](15) NULL,
	[CIN] [float] NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[SIZE] [nvarchar](50) NULL,
	[AAP Price] [float] NULL,
	[Supplier] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](100) NULL,
	[NDC/UPC] [nvarchar](15) NULL,
	[GPI_ID] [nvarchar](25) NULL,
	[AWP] [float] NULL,
	[Select] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[Comp Price] [nvarchar](50) NULL,
	[Invoice#] [nvarchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [nvarchar](50) NULL,
	[Comp Ext] [nvarchar](50) NULL,
	[Size diff] [nvarchar](50) NULL,
	[Comp NDC] [nvarchar](50) NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners_20200206]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_20200206](
	[VendorID] [int] NOT NULL,
	[VendorName] [nvarchar](255) NULL,
	[RebateReportDisplayName] [nvarchar](255) NULL,
	[PPVendorID] [nvarchar](255) NULL,
	[Active] [float] NULL,
	[Comments] [nvarchar](255) NULL,
 CONSTRAINT [CPK1_20200206] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners_20200206_New]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_20200206_New](
	[VendorID] [float] NULL,
	[VendorName] [nvarchar](255) NULL,
	[RebateReportDisplayName] [nvarchar](255) NULL,
	[PPVendorID] [float] NULL,
	[Active] [float] NULL,
	[Comments] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_New]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_New](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](4000) NULL,
	[Affiliate] [varchar](50) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentiveFirstPayment] [numeric](18, 2) NULL,
	[GenericIncentiveSecondPayment] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL,
	[3MRebate] [numeric](18, 2) NULL,
	[POGRebate] [numeric](18, 2) NULL,
	[MasonRebate] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_PM_AnnualRebates_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_Conference_New]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_Conference_New](
	[date] [datetime] NULL,
	[date_period_start] [datetime] NULL,
	[date_period_end] [datetime] NULL,
	[rebate_type] [varchar](32) NULL,
	[PMID] [float] NULL,
	[accountname] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMID_WA]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMID_WA](
	[PMID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMID_WA_2]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMID_WA_2](
	[PMID] [nvarchar](100) NULL,
	[State] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20200422]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20200422](
	[State] [nvarchar](255) NULL,
	[Sub-Affiliation] [nvarchar](255) NULL,
	[Customer Unique] [nvarchar](255) NULL,
	[L01 Afltn Name] [nvarchar](255) NULL,
	[Distribution Center Number] [float] NULL,
	[Customer Number] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Corporate Item Number] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Supplier] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Old Sell] [money] NULL,
	[New Sell] [money] NULL,
	[% Change] [float] NULL,
	[Protection Start Date] [datetime] NULL,
	[Protection End Date] [datetime] NULL,
	[Previous 3 Months Historical Usage] [float] NULL,
	[Average Monthly Usage] [float] NULL,
	[Unit Sell Dlr] [money] NULL,
	[Usage] [float] NULL,
	[Returns] [float] NULL,
	[Total Usage] [float] NULL,
	[Prior Month Usage] [float] NULL,
	[Available From Last Month] [float] NULL,
	[Overage Last Month] [float] NULL,
	[Total Owed] [float] NULL,
	[Usage For Calculation] [float] NULL,
	[Price Protection Due] [money] NULL,
	[Comments] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20201117]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20201117](
	[L01 Afltn Number] [varchar](500) NULL,
	[Distribution Center Number] [varchar](500) NULL,
	[Customer Number] [varchar](500) NULL,
	[Corporate Item Number] [varchar](500) NULL,
	[Description] [varchar](500) NULL,
	[Size] [varchar](500) NULL,
	[Old Sell] [varchar](500) NULL,
	[New Sell] [varchar](500) NULL,
	[Protection Start Date] [varchar](500) NULL,
	[Protection End Date] [varchar](500) NULL,
	[Average Monthly Usage] [varchar](500) NULL,
	[Unit Sell Dlr] [varchar](500) NULL,
	[Total Usage] [varchar](500) NULL,
	[Prior Month Usage] [varchar](500) NULL,
	[Available From Last Month] [varchar](500) NULL,
	[Usage For Calculation] [varchar](500) NULL,
	[ Price Protection Due ] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PricePotection]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PricePotection](
	[Marker] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[Price Protection] [money] NULL,
	[Adjusted Ext Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Vol Admin Fee Adjustment] [money] NULL,
	[RX Branded-RxPlus] [money] NULL,
	[RxPlus Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[Affil Admin Fee Adjustment] [money] NULL,
	[Total RX less Excluded items] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Adjusted Generic Source] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee Adjustment] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Generic rebate adjustment] [money] NULL,
	[COG Eligible Sales] [money] NULL,
	[COG Rebate] [money] NULL,
	[COG Rebate %] [float] NULL,
	[COG Rebate Adjustment] [money] NULL,
	[Florida Phcy Assoc Deduct] [money] NULL,
	[Leader Rebate] [money] NULL,
	[MSI Rebate] [money] NULL,
	[Price Protection Rebate] [money] NULL,
	[Price Protection Adjustment] [money] NULL,
	[Calculations] [money] NULL,
	[Prescribed Wellness Fee] [money] NULL,
	[NCPA Membership Fee] [money] NULL,
	[Arete Eligible] [bit] NOT NULL,
	[Arete Performance Rebate] [money] NULL,
	[Check Fee] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL,
	[Sort Code] [nvarchar](255) NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Matrix] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reed_RBC]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reed_RBC](
	[Confirmation #] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Guests] [nvarchar](255) NULL,
	[Registration Type] [nvarchar](255) NULL,
	[Primary Registrant Confirmation #] [nvarchar](255) NULL,
	[Confirmation #1] [nvarchar](255) NULL,
	[Email Address] [nvarchar](255) NULL,
	[CC Email Address] [nvarchar](255) NULL,
	[Account Number] [nvarchar](255) NULL,
	[Retail Independent Buying Group Name] [nvarchar](255) NULL,
	[Pharmacy/Store Name] [nvarchar](255) NULL,
	[DC#-Division] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Sales Rep Name/Number] [nvarchar](255) NULL,
	[Work Address] [nvarchar](255) NULL,
	[Work City] [nvarchar](255) NULL,
	[Work State/Prov# Code] [nvarchar](255) NULL,
	[Work Zip/Postal Code] [nvarchar](255) NULL,
	[Work Phone] [nvarchar](255) NULL,
	[Mobile Phone] [nvarchar](255) NULL,
	[Is this your first time attending RBC?] [nvarchar](255) NULL,
	[Please list your buying group affiliation:] [nvarchar](255) NULL,
	[Parent -Affilition] [nvarchar](255) NULL,
	[Child-Affiliation] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[S2KAccount_20200805]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[S2KAccount_20200805](
	[DbName] [varchar](255) NULL,
	[ObjectName] [varchar](255) NULL,
	[ObjectType] [varchar](25) NULL,
	[ObjectDefinition] [varchar](max) NULL,
	[IsPossibleJoin] [bit] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ObjectSchemaName] [varchar](25) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentInfo_20200811]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentInfo_20200811](
	[ROW_NUM] [bigint] NOT NULL,
	[COMPANY_NO] [numeric](3, 0) NOT NULL,
	[PACKAGE_ID] [numeric](4, 0) NOT NULL,
	[ORDER_ID] [numeric](9, 0) NOT NULL,
	[ORDER_BO_CODE] [numeric](3, 0) NOT NULL,
	[COMPANY_ID] [char](7) NOT NULL,
	[TRACKING_NUMBER] [char](30) NOT NULL,
	[SHIP_COST] [numeric](11, 2) NOT NULL,
	[SHIP_DATE] [varchar](49) NULL,
	[SHIP_STATUS] [varchar](7) NOT NULL,
	[SHIP_METHOD] [varchar](4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLObject]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLObject](
	[ServerName] [varchar](100) NULL,
	[BaseDbName] [varchar](100) NULL,
	[BaseSchemaObjectName] [varchar](100) NULL,
	[BaseObject] [varchar](100) NULL,
	[ReferencedDbName] [varchar](100) NULL,
	[ReferencedSchemaName] [varchar](100) NULL,
	[ReferencedObjectName] [varchar](100) NULL,
	[IsAmbigous] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLTrace_Error]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLTrace_Error](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[TextData] [ntext] NULL,
	[BinaryData] [image] NULL,
	[DatabaseID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[LineNumber] [int] NULL,
	[NTUserName] [nvarchar](256) NULL,
	[NTDomainName] [nvarchar](256) NULL,
	[HostName] [nvarchar](256) NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](256) NULL,
	[LoginName] [nvarchar](256) NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[Permissions] [bigint] NULL,
	[Severity] [int] NULL,
	[EventSubClass] [int] NULL,
	[ObjectID] [int] NULL,
	[Success] [int] NULL,
	[IndexID] [int] NULL,
	[IntegerData] [int] NULL,
	[ServerName] [nvarchar](256) NULL,
	[EventClass] [int] NULL,
	[ObjectType] [int] NULL,
	[NestLevel] [int] NULL,
	[State] [int] NULL,
	[Error] [int] NULL,
	[Mode] [int] NULL,
	[Handle] [int] NULL,
	[ObjectName] [nvarchar](256) NULL,
	[DatabaseName] [nvarchar](256) NULL,
	[FileName] [nvarchar](256) NULL,
	[OwnerName] [nvarchar](256) NULL,
	[RoleName] [nvarchar](256) NULL,
	[TargetUserName] [nvarchar](256) NULL,
	[DBUserName] [nvarchar](256) NULL,
	[LoginSid] [image] NULL,
	[TargetLoginName] [nvarchar](256) NULL,
	[TargetLoginSid] [image] NULL,
	[ColumnPermissions] [int] NULL,
	[LinkedServerName] [nvarchar](256) NULL,
	[ProviderName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[RowCounts] [bigint] NULL,
	[RequestID] [int] NULL,
	[XactSequence] [bigint] NULL,
	[EventSequence] [bigint] NULL,
	[BigintData1] [bigint] NULL,
	[BigintData2] [bigint] NULL,
	[GUID] [uniqueidentifier] NULL,
	[IntegerData2] [int] NULL,
	[ObjectID2] [bigint] NULL,
	[Type] [int] NULL,
	[OwnerID] [int] NULL,
	[ParentName] [nvarchar](256) NULL,
	[IsSystem] [int] NULL,
	[Offset] [int] NULL,
	[SourceDatabaseID] [int] NULL,
	[SqlHandle] [image] NULL,
	[SessionLoginName] [nvarchar](256) NULL,
	[PlanHandle] [image] NULL,
	[GroupID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLtrace_PMLogin_20181228]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLtrace_PMLogin_20181228](
	[TextData] [ntext] NULL,
	[BinaryData] [image] NULL,
	[DatabaseID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[LineNumber] [int] NULL,
	[NTUserName] [nvarchar](256) NULL,
	[NTDomainName] [nvarchar](256) NULL,
	[HostName] [nvarchar](256) NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](256) NULL,
	[LoginName] [nvarchar](256) NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[Permissions] [bigint] NULL,
	[Severity] [int] NULL,
	[EventSubClass] [int] NULL,
	[ObjectID] [int] NULL,
	[Success] [int] NULL,
	[IndexID] [int] NULL,
	[IntegerData] [int] NULL,
	[ServerName] [nvarchar](256) NULL,
	[EventClass] [int] NULL,
	[ObjectType] [int] NULL,
	[NestLevel] [int] NULL,
	[State] [int] NULL,
	[Error] [int] NULL,
	[Mode] [int] NULL,
	[Handle] [int] NULL,
	[ObjectName] [nvarchar](256) NULL,
	[DatabaseName] [nvarchar](256) NULL,
	[FileName] [nvarchar](256) NULL,
	[OwnerName] [nvarchar](256) NULL,
	[RoleName] [nvarchar](256) NULL,
	[TargetUserName] [nvarchar](256) NULL,
	[DBUserName] [nvarchar](256) NULL,
	[LoginSid] [image] NULL,
	[TargetLoginName] [nvarchar](256) NULL,
	[TargetLoginSid] [image] NULL,
	[ColumnPermissions] [int] NULL,
	[LinkedServerName] [nvarchar](256) NULL,
	[ProviderName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[RowCounts] [bigint] NULL,
	[RequestID] [int] NULL,
	[XactSequence] [bigint] NULL,
	[EventSequence] [bigint] NULL,
	[BigintData1] [bigint] NULL,
	[BigintData2] [bigint] NULL,
	[GUID] [uniqueidentifier] NULL,
	[IntegerData2] [int] NULL,
	[ObjectID2] [bigint] NULL,
	[Type] [int] NULL,
	[OwnerID] [int] NULL,
	[ParentName] [nvarchar](256) NULL,
	[IsSystem] [int] NULL,
	[Offset] [int] NULL,
	[SourceDatabaseID] [int] NULL,
	[SqlHandle] [image] NULL,
	[SessionLoginName] [nvarchar](256) NULL,
	[PlanHandle] [image] NULL,
	[GroupID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLtrace_PMLogin_NewLogin_20181228]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLtrace_PMLogin_NewLogin_20181228](
	[TextData] [ntext] NULL,
	[BinaryData] [image] NULL,
	[DatabaseID] [int] NULL,
	[TransactionID] [bigint] NULL,
	[LineNumber] [int] NULL,
	[NTUserName] [nvarchar](256) NULL,
	[NTDomainName] [nvarchar](256) NULL,
	[HostName] [nvarchar](256) NULL,
	[ClientProcessID] [int] NULL,
	[ApplicationName] [nvarchar](256) NULL,
	[LoginName] [nvarchar](256) NULL,
	[SPID] [int] NULL,
	[Duration] [bigint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[CPU] [int] NULL,
	[Permissions] [bigint] NULL,
	[Severity] [int] NULL,
	[EventSubClass] [int] NULL,
	[ObjectID] [int] NULL,
	[Success] [int] NULL,
	[IndexID] [int] NULL,
	[IntegerData] [int] NULL,
	[ServerName] [nvarchar](256) NULL,
	[EventClass] [int] NULL,
	[ObjectType] [int] NULL,
	[NestLevel] [int] NULL,
	[State] [int] NULL,
	[Error] [int] NULL,
	[Mode] [int] NULL,
	[Handle] [int] NULL,
	[ObjectName] [nvarchar](256) NULL,
	[DatabaseName] [nvarchar](256) NULL,
	[FileName] [nvarchar](256) NULL,
	[OwnerName] [nvarchar](256) NULL,
	[RoleName] [nvarchar](256) NULL,
	[TargetUserName] [nvarchar](256) NULL,
	[DBUserName] [nvarchar](256) NULL,
	[LoginSid] [image] NULL,
	[TargetLoginName] [nvarchar](256) NULL,
	[TargetLoginSid] [image] NULL,
	[ColumnPermissions] [int] NULL,
	[LinkedServerName] [nvarchar](256) NULL,
	[ProviderName] [nvarchar](256) NULL,
	[MethodName] [nvarchar](256) NULL,
	[RowCounts] [bigint] NULL,
	[RequestID] [int] NULL,
	[XactSequence] [bigint] NULL,
	[EventSequence] [bigint] NULL,
	[BigintData1] [bigint] NULL,
	[BigintData2] [bigint] NULL,
	[GUID] [uniqueidentifier] NULL,
	[IntegerData2] [int] NULL,
	[ObjectID2] [bigint] NULL,
	[Type] [int] NULL,
	[OwnerID] [int] NULL,
	[ParentName] [nvarchar](256) NULL,
	[IsSystem] [int] NULL,
	[Offset] [int] NULL,
	[SourceDatabaseID] [int] NULL,
	[SqlHandle] [image] NULL,
	[SessionLoginName] [nvarchar](256) NULL,
	[PlanHandle] [image] NULL,
	[GroupID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreVol_API1118_PVA1018$]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreVol_API1118_PVA1018$](
	[TM] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[AAP#] [nvarchar](255) NULL,
	[Parent#] [nvarchar](255) NULL,
	[Group#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP Eff] [nvarchar](255) NULL,
	[AAP Quit] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[ChainCode] [nvarchar](255) NULL,
	[Account DBA Name] [nvarchar](255) NULL,
	[Account Corporate Name] [nvarchar](255) NULL,
	[Software] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[Whse Acct Date Opened] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[API Nov 17 Brand] [money] NULL,
	[API Nov 17 Generic] [money] NULL,
	[API Nov 17 OTC] [money] NULL,
	[API Nov 17 Total Whse] [money] NULL,
	[API Dec 17 Brand] [money] NULL,
	[API Dec 17 Generic] [money] NULL,
	[API Dec 17 OTC] [money] NULL,
	[API Dec 17 Total Whse] [money] NULL,
	[API Jan 18 Brand] [money] NULL,
	[API Jan 18 Generic] [money] NULL,
	[API Jan 18 OTC] [money] NULL,
	[API Jan 18 Total Whse] [money] NULL,
	[API Feb 18 Brand] [money] NULL,
	[API Feb 18 Generic] [money] NULL,
	[API Feb 18 OTC] [money] NULL,
	[API Feb 18 Total Whse] [money] NULL,
	[API Mar 18 Brand] [money] NULL,
	[API Mar 18 Generic] [money] NULL,
	[API Mar 18 OTC] [money] NULL,
	[API Mar 18 Total Whse] [money] NULL,
	[API Apr 18 Brand] [money] NULL,
	[API Apr 18 Generic] [money] NULL,
	[API Apr 18 OTC] [money] NULL,
	[API Apr 18 Total Whse] [money] NULL,
	[API May 18 Brand] [money] NULL,
	[API May 18 Generic] [money] NULL,
	[API May 18 OTC] [money] NULL,
	[API May 18 Total Whse] [money] NULL,
	[API Jun 18 Brand] [money] NULL,
	[API Jun 18 Generic] [money] NULL,
	[API Jun 18 OTC] [money] NULL,
	[API Jun 18 Total Whse] [money] NULL,
	[API Jul 18 Brand] [money] NULL,
	[API Jul 18 Generic] [money] NULL,
	[API Jul 18 OTC] [money] NULL,
	[API Jul 18 Total Whse] [money] NULL,
	[API Aug 18 Brand] [money] NULL,
	[API Aug 18 Generic] [money] NULL,
	[API Aug 18 OTC] [money] NULL,
	[API Aug 18 Total Whse] [money] NULL,
	[API Sep 18 Brand] [money] NULL,
	[API Sep 18 Generic] [money] NULL,
	[API Sep 18 OTC] [money] NULL,
	[API Sep 18 Total Whse] [money] NULL,
	[API Oct 18 Brand] [money] NULL,
	[API Oct 18 Generic] [money] NULL,
	[API Oct 18 OTC] [money] NULL,
	[API Oct 18 Total Whse] [money] NULL,
	[API Nov 18 Brand] [money] NULL,
	[API Nov 18 Generic] [money] NULL,
	[API Nov 18 OTC] [money] NULL,
	[API Nov 18 Total Whse] [money] NULL,
	[API Total Brand Sales] [money] NULL,
	[API Total Generic Sales] [money] NULL,
	[API Total OTC Sales] [money] NULL,
	[API TOTAL SALES] [money] NULL,
	[CAH Oct 17 AAP Brand] [money] NULL,
	[CAH New Oct 17 AAP Brand] [money] NULL,
	[CAH Oct 17 AAP Src Generics] [money] NULL,
	[CAH Oct 17 AAP Other Sales] [money] NULL,
	[CAH Oct 17 AAP Total RX] [money] NULL,
	[CAH Oct 17 Other RX] [money] NULL,
	[CAH Oct 17 AAP Excluded from Total RX] [money] NULL,
	[CAH Oct 17 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Oct 17 AAP Source Compliance] [float] NULL,
	[CAH Oct 17 AAP Total Sales] [money] NULL,
	[CAH Nov 17 AAP Brand] [money] NULL,
	[CAH New Nov 17 AAP Brand] [money] NULL,
	[CAH Nov 17 AAP Src Generics] [money] NULL,
	[CAH Nov 17 AAP Other Sales] [money] NULL,
	[CAH Nov 17 AAP Total RX] [money] NULL,
	[CAH Nov 17 Other RX] [money] NULL,
	[CAH Nov 17 AAP Excluded from Total RX] [money] NULL,
	[CAH Nov 17 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Nov 17 AAP Source Compliance] [float] NULL,
	[CAH Nov 17 AAP Total Sales] [money] NULL,
	[CAH Dec 17 AAP Brand] [money] NULL,
	[CAH New Dec 17 AAP Brand] [money] NULL,
	[CAH Dec 17 AAP Src Generics] [money] NULL,
	[CAH Dec 17 AAP Other Sales] [money] NULL,
	[CAH Dec 17 AAP Total RX] [money] NULL,
	[CAH Dec 17 Other RX] [money] NULL,
	[CAH Dec 17 AAP Excluded from Total RX] [money] NULL,
	[CAH Dec 17 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Dec 17 AAP Source Compliance] [float] NULL,
	[CAH Dec 17 AAP Total Sales] [money] NULL,
	[CAH Jan 18 AAP Brand] [money] NULL,
	[CAH New Jan 18 AAP Brand] [money] NULL,
	[CAH Jan 18 AAP Src Generics] [money] NULL,
	[CAH Jan 18 AAP Other Sales] [money] NULL,
	[CAH Jan 18 AAP Total RX] [money] NULL,
	[CAH Jan 18 Other RX] [money] NULL,
	[CAH Jan 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Jan 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Jan 18 AAP Source Compliance] [float] NULL,
	[CAH Jan 18 AAP Total Sales] [money] NULL,
	[CAH Feb 18 AAP Brand] [money] NULL,
	[CAH New Feb 18 AAP Brand] [money] NULL,
	[CAH Feb 18 AAP Src Generics] [money] NULL,
	[CAH Feb 18 AAP Other Sales] [money] NULL,
	[CAH Feb 18 AAP Total RX] [money] NULL,
	[CAH Feb 18 Other RX] [money] NULL,
	[CAH Feb 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Feb 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Feb 18 AAP Source Compliance] [float] NULL,
	[CAH Feb 18 AAP Total Sales] [money] NULL,
	[CAH Mar 18 AAP Brand] [money] NULL,
	[CAH New Mar 18 AAP Brand] [money] NULL,
	[CAH Mar 18 AAP Src Generics] [money] NULL,
	[CAH Mar 18 AAP Other Sales] [money] NULL,
	[CAH Mar 18 AAP Total RX] [money] NULL,
	[CAH Mar 18 Other RX] [money] NULL,
	[CAH Mar 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Mar 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Mar 18 AAP Source Compliance] [float] NULL,
	[CAH Mar 18 AAP Total Sales] [money] NULL,
	[CAH Apr 18 AAP Brand] [money] NULL,
	[CAH New Apr 18 AAP Brand] [money] NULL,
	[CAH Apr 18 AAP Src Generics] [money] NULL,
	[CAH Apr 18 AAP Other Sales] [money] NULL,
	[CAH Apr 18 AAP Total RX] [money] NULL,
	[CAH Apr 18 Other RX] [money] NULL,
	[CAH Apr 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Apr 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Apr 18 AAP Source Compliance] [float] NULL,
	[CAH Apr 18 AAP Total Sales] [money] NULL,
	[CAH May 18 AAP Brand] [money] NULL,
	[CAH New May 18 AAP Brand] [money] NULL,
	[CAH May 18 AAP Src Generics] [money] NULL,
	[CAH May 18 AAP Other Sales] [money] NULL,
	[CAH May 18 AAP Total RX] [money] NULL,
	[CAH May 18 Other RX] [money] NULL,
	[CAH May 18 AAP Excluded from Total RX] [money] NULL,
	[CAH May 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH May 18 AAP Source Compliance] [float] NULL,
	[CAH May 18 AAP Total Sales] [money] NULL,
	[CAH Jun 18 AAP Brand] [money] NULL,
	[CAH New Jun 18 AAP Brand] [money] NULL,
	[CAH Jun 18 AAP Src Generics] [money] NULL,
	[CAH Jun 18 AAP Other Sales] [money] NULL,
	[CAH Jun 18 AAP Total RX] [money] NULL,
	[CAH Jun 18 Other RX] [money] NULL,
	[CAH Jun 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Jun 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Jun 18 AAP Source Compliance] [float] NULL,
	[CAH Jun 18 AAP Total Sales] [money] NULL,
	[CAH Jul 18 AAP Brand] [money] NULL,
	[CAH New Jul 18 AAP Brand] [money] NULL,
	[CAH Jul 18 AAP Src Generics] [money] NULL,
	[CAH Jul 18 AAP Other Sales] [money] NULL,
	[CAH Jul 18 AAP Total RX] [money] NULL,
	[CAH Jul 18 Other RX] [money] NULL,
	[CAH Jul 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Jul 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Jul 18 AAP Source Compliance] [float] NULL,
	[CAH Jul 18 AAP Total Sales] [money] NULL,
	[CAH Aug 18 AAP Brand] [money] NULL,
	[CAH New Aug 18 AAP Brand] [money] NULL,
	[CAH Aug 18 AAP Src Generics] [money] NULL,
	[CAH Aug 18 AAP Other Sales] [money] NULL,
	[CAH Aug 18 AAP Total RX] [money] NULL,
	[CAH Aug 18 Other RX] [money] NULL,
	[CAH Aug 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Aug 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Aug 18 AAP Source Compliance] [float] NULL,
	[CAH Aug 18 AAP Total Sales] [money] NULL,
	[CAH Sep 18 AAP Brand] [money] NULL,
	[CAH New Sep 18 AAP Brand] [money] NULL,
	[CAH Sep 18 AAP Src Generics] [money] NULL,
	[CAH Sep 18 AAP Other Sales] [money] NULL,
	[CAH Sep 18 AAP Total RX] [money] NULL,
	[CAH Sep 18 Other RX] [money] NULL,
	[CAH Sep 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Sep 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Sep 18 AAP Source Compliance] [float] NULL,
	[CAH Sep 18 AAP Total Sales] [money] NULL,
	[CAH Oct 18 AAP Brand] [money] NULL,
	[CAH New Oct 18 AAP Brand] [money] NULL,
	[CAH Oct 18 AAP Src Generics] [money] NULL,
	[CAH Oct 18 AAP Other Sales] [money] NULL,
	[CAH Oct 18 AAP Total RX] [money] NULL,
	[CAH Oct 18 Other RX] [money] NULL,
	[CAH Oct 18 AAP Excluded from Total RX] [money] NULL,
	[CAH Oct 18 AAP NonRX - OTC&HH] [money] NULL,
	[CAH Oct 18 AAP Source Compliance] [float] NULL,
	[CAH Oct 18 AAP Total Sales] [money] NULL,
	[CAH Total Brand Sales] [money] NULL,
	[CAH Total New Brand Sales] [money] NULL,
	[CAH Total Src Generic Sales] [money] NULL,
	[CAH Total Other Sales] [money] NULL,
	[CAH Total Total RX] [money] NULL,
	[CAH Total Other RX] [money] NULL,
	[CAH Total Excluded from Total RX] [money] NULL,
	[CAH Total NonRX - OTC&HH] [money] NULL,
	[CAH TOTAL SALES] [money] NULL,
	[Total Oct 17 Combined Mthly Sales] [money] NULL,
	[Total Nov 17 Combined Mthly Sales] [money] NULL,
	[Total Dec 17 Combined Mthly Sales] [money] NULL,
	[Total Jan 18 Combined Mthly Sales] [money] NULL,
	[Total Feb 18 Combined Mthly Sales] [money] NULL,
	[Total Mar 18 Combined Mthly Sales] [money] NULL,
	[Total Apr 18 Combined Mthly Sales] [money] NULL,
	[Total May 18 Combined Mthly Sales] [money] NULL,
	[Total Jun 18 Combined Mthly Sales] [money] NULL,
	[Total Jul 18 Combined Mthly Sales] [money] NULL,
	[Total Aug 18 Combined Mthly Sales] [money] NULL,
	[Total Sep 18 Combined Mthly Sales] [money] NULL,
	[Total Oct 18 Combined Mthly Sales] [money] NULL,
	[Total Nov 18 Combined Mthly Sales] [money] NULL,
	[TOTAL COMBINED SALES] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SummaryEmily]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SummaryEmily](
	[TM] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[API #] [float] NULL,
	[Status] [nvarchar](255) NULL,
	[App Recd] [datetime] NULL,
	[AAP#] [float] NULL,
	[API Active] [datetime] NULL,
	[Jul ] [money] NULL,
	[Jun ] [money] NULL,
	[May ] [money] NULL,
	[Apr ] [money] NULL,
	[Mar ] [money] NULL,
	[Feb ] [money] NULL,
	[Jan ] [money] NULL,
	[F16] [nvarchar](255) NULL,
	[Jul 1] [float] NULL,
	[Jun 1] [float] NULL,
	[May 1] [float] NULL,
	[Apr 1] [float] NULL,
	[Mar 1] [float] NULL,
	[Feb 1] [float] NULL,
	[Jan 1] [float] NULL,
	[TTL] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sweetwater]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sweetwater](
	[Invoice Date] [nvarchar](255) NULL,
	[Invoice_Due Date] [nvarchar](255) NULL,
	[Invoice #] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[PO #] [nvarchar](255) NULL,
	[Trade Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Package Size] [nvarchar](255) NULL,
	[Package U/M] [nvarchar](255) NULL,
	[Unit Cost] [money] NULL,
	[Order Qty] [float] NULL,
	[Ship Qty] [float] NULL,
	[Return Qty] [float] NULL,
	[Dollars] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableIndexUsage]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableIndexUsage](
	[DbName] [varchar](100) NULL,
	[ObjectName] [varchar](100) NULL,
	[SchemaName] [varchar](100) NULL,
	[IndexName] [varchar](100) NULL,
	[index_id] [int] NOT NULL,
	[IndexSizeKB] [bigint] NULL,
	[user_seeks] [bigint] NULL,
	[user_scans] [bigint] NULL,
	[user_lookups] [bigint] NULL,
	[user_updates] [bigint] NULL,
	[last_user_seek] [datetime] NULL,
	[last_user_scan] [datetime] NULL,
	[last_user_lookup] [datetime] NULL,
	[last_user_update] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableUsuageStats_20200805]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableUsuageStats_20200805](
	[ServerName] [varchar](100) NULL,
	[DbName] [varchar](100) NULL,
	[SchemaName] [varchar](100) NULL,
	[ObjectName] [varchar](100) NULL,
	[Size] [bigint] NULL,
	[UserSeeks] [bigint] NULL,
	[UserScans] [bigint] NULL,
	[UserLookUps] [bigint] NULL,
	[UserUpdates] [bigint] NULL,
	[LastUserSeek] [datetime2](3) NULL,
	[LastUserScan] [datetime2](3) NULL,
	[LastUserLookup] [datetime2](3) NULL,
	[LastUserUpdate] [datetime2](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestRSE202012008]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestRSE202012008](
	[SBITDC] [numeric](3, 3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VSHEAD]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VSHEAD](
	[SADEL] [char](1) NOT NULL,
	[SACMP] [numeric](3, 0) NOT NULL,
	[SAORD] [numeric](9, 0) NOT NULL,
	[SASLOC] [char](4) NOT NULL,
	[SABOCD] [numeric](3, 0) NOT NULL,
	[SACUST] [char](7) NOT NULL,
	[SATYPE] [char](1) NOT NULL,
	[SAPICK] [numeric](7, 0) NOT NULL,
	[SAEMAL] [char](50) NOT NULL,
	[SASHIP] [char](7) NOT NULL,
	[SADSTC] [char](7) NOT NULL,
	[SACLOC] [char](7) NOT NULL,
	[SASNAM] [char](30) NOT NULL,
	[SASAD1] [char](30) NOT NULL,
	[SASAD2] [char](30) NOT NULL,
	[SASAD3] [char](30) NOT NULL,
	[SACITY] [char](17) NOT NULL,
	[SAST] [char](2) NOT NULL,
	[SAMZIP] [char](15) NOT NULL,
	[SACNTR] [char](3) NOT NULL,
	[SACNTY] [numeric](4, 0) NOT NULL,
	[SALOC1] [numeric](4, 0) NOT NULL,
	[SALOC2] [numeric](4, 0) NOT NULL,
	[SAFRT] [numeric](11, 2) NOT NULL,
	[SAHAND] [numeric](11, 2) NOT NULL,
	[SAMISC] [numeric](11, 2) NOT NULL,
	[SARESK] [numeric](11, 2) NOT NULL,
	[SADSC1] [numeric](3, 3) NOT NULL,
	[SADSC2] [numeric](3, 3) NOT NULL,
	[SADSC3] [numeric](3, 3) NOT NULL,
	[SAORDT] [numeric](8, 0) NOT NULL,
	[SAORYM] [numeric](6, 0) NOT NULL,
	[SAINDT] [numeric](8, 0) NOT NULL,
	[SAINYM] [numeric](6, 0) NOT NULL,
	[SADTIN] [numeric](8, 0) NOT NULL,
	[SASHDT] [numeric](8, 0) NOT NULL,
	[SASHYM] [numeric](6, 0) NOT NULL,
	[SARQDT] [numeric](8, 0) NOT NULL,
	[SADDAT] [numeric](8, 0) NOT NULL,
	[SACADT] [numeric](8, 0) NOT NULL,
	[SAPKDT] [numeric](8, 0) NOT NULL,
	[SAPODT] [numeric](8, 0) NOT NULL,
	[SAPOYM] [numeric](6, 0) NOT NULL,
	[SADUDT] [numeric](6, 0) NOT NULL,
	[SAINV] [numeric](9, 0) NOT NULL,
	[SAITOT] [numeric](11, 2) NOT NULL,
	[SALOC] [char](4) NOT NULL,
	[SABLOC] [char](4) NOT NULL,
	[SASMN1] [numeric](5, 0) NOT NULL,
	[SASMN2] [numeric](5, 0) NOT NULL,
	[SACMR1] [numeric](7, 4) NOT NULL,
	[SACMR2] [numeric](7, 4) NOT NULL,
	[SATERM] [char](2) NOT NULL,
	[SASHTR] [char](15) NOT NULL,
	[SASTR] [char](4) NOT NULL,
	[SACPO] [char](20) NOT NULL,
	[SAVIA] [char](4) NOT NULL,
	[SASCAC] [char](35) NOT NULL,
	[SAUPIN] [char](1) NOT NULL,
	[SABKO] [char](1) NOT NULL,
	[SADRSH] [char](1) NOT NULL,
	[SADEAL] [char](1) NOT NULL,
	[SACRES] [char](3) NOT NULL,
	[SAPERS] [char](3) NOT NULL,
	[SACAUS] [char](3) NOT NULL,
	[SAHOLD] [char](4) NOT NULL,
	[SAHORD] [char](1) NOT NULL,
	[SAORDS] [char](1) NOT NULL,
	[SAORWT] [char](3) NOT NULL,
	[SASINS] [char](30) NOT NULL,
	[SAPHYP] [numeric](6, 0) NOT NULL,
	[SABTCH] [numeric](6, 0) NOT NULL,
	[SAYTDD] [numeric](11, 2) NOT NULL,
	[SADEPL] [numeric](11, 2) NOT NULL,
	[SAPTYP] [char](6) NOT NULL,
	[SACCCK] [char](25) NOT NULL,
	[SAEXP] [numeric](4, 0) NOT NULL,
	[SAAUTH] [char](1) NOT NULL,
	[SAAUT#] [char](8) NOT NULL,
	[SAROUT] [char](4) NOT NULL,
	[SASTOP] [numeric](3, 0) NOT NULL,
	[SADRIV] [char](3) NOT NULL,
	[SATXOR] [char](1) NOT NULL,
	[SATXST] [char](1) NOT NULL,
	[SATXCN] [char](1) NOT NULL,
	[SATXL1] [char](1) NOT NULL,
	[SATXL2] [char](1) NOT NULL,
	[SASTTX] [numeric](11, 2) NOT NULL,
	[SACNTX] [numeric](11, 2) NOT NULL,
	[SAL1TX] [numeric](11, 2) NOT NULL,
	[SAL2TX] [numeric](11, 2) NOT NULL,
	[SAAMTX] [numeric](11, 2) NOT NULL,
	[SASTPE] [numeric](6, 6) NOT NULL,
	[SACNPE] [numeric](6, 6) NOT NULL,
	[SAL1PE] [numeric](6, 6) NOT NULL,
	[SAL2PE] [numeric](6, 6) NOT NULL,
	[SATTPE] [numeric](6, 6) NOT NULL,
	[SAREV#] [numeric](4, 0) NOT NULL,
	[SAFOB] [char](2) NOT NULL,
	[SAFOBP] [char](15) NOT NULL,
	[SABOL] [char](30) NOT NULL,
	[SAPRON] [char](15) NOT NULL,
	[SAADV] [char](30) NOT NULL,
	[SASORT] [char](10) NOT NULL,
	[SAWGHT] [numeric](13, 4) NOT NULL,
	[SAGWGH] [numeric](13, 4) NOT NULL,
	[SALINE] [numeric](6, 0) NOT NULL,
	[SATSHP] [numeric](11, 2) NOT NULL,
	[SAPCKS] [numeric](9, 0) NOT NULL,
	[SATCRT] [numeric](9, 0) NOT NULL,
	[SADEPT] [char](9) NOT NULL,
	[SARLNO] [char](9) NOT NULL,
	[SAPOTY] [char](10) NOT NULL,
	[SAPROM] [char](10) NOT NULL,
	[SAOHNS] [char](10) NOT NULL,
	[SATSP] [char](2) NOT NULL,
	[SANETW] [char](2) NOT NULL,
	[SATRST] [char](1) NOT NULL,
	[SAMLOV] [char](2) NOT NULL,
	[SASUPN] [char](30) NOT NULL,
	[SATTQ] [char](2) NOT NULL,
	[SATRTM] [numeric](4, 0) NOT NULL,
	[SATLID] [char](10) NOT NULL,
	[SAASNS] [char](1) NOT NULL,
	[SAMO] [numeric](9, 0) NOT NULL,
	[SAMOSQ] [numeric](3, 0) NOT NULL,
	[SARORD] [numeric](14, 0) NOT NULL,
	[SAWCST] [char](7) NOT NULL,
	[SAWORD] [numeric](9, 0) NOT NULL,
	[SAWSID] [char](10) NOT NULL,
	[SAJNUM] [char](6) NOT NULL,
	[SAUSER] [char](10) NOT NULL,
	[SAKEYC] [char](6) NOT NULL,
	[SAPHONE] [char](20) NOT NULL,
	[SACONT] [char](30) NOT NULL,
	[SARETAIL] [char](1) NOT NULL,
	[SATLOAD] [numeric](7, 0) NOT NULL,
	[SAREC#] [numeric](9, 0) NOT NULL,
	[SABAN#] [char](7) NOT NULL,
	[SAREA#] [char](3) NOT NULL,
	[SAOSTO] [char](4) NOT NULL,
	[SABODD] [numeric](11, 2) NOT NULL,
	[SACRCD] [char](3) NOT NULL,
	[SACNVF] [numeric](10, 5) NOT NULL,
	[SAFFRT] [numeric](11, 2) NOT NULL,
	[SAFHAND] [numeric](11, 2) NOT NULL,
	[SAFMISC] [numeric](11, 2) NOT NULL,
	[SAFRESK] [numeric](11, 2) NOT NULL,
	[SAFITOT] [numeric](11, 2) NOT NULL,
	[SAFYTDD] [numeric](11, 2) NOT NULL,
	[SAFDEPL] [numeric](11, 2) NOT NULL,
	[SAFBODD] [numeric](11, 2) NOT NULL,
	[SAFSTTX] [numeric](11, 2) NOT NULL,
	[SAFCNTX] [numeric](11, 2) NOT NULL,
	[SAFL1TX] [numeric](11, 2) NOT NULL,
	[SAFL2TX] [numeric](11, 2) NOT NULL,
	[SAFAMTX] [numeric](11, 2) NOT NULL,
	[SACHGD] [numeric](11, 2) NOT NULL,
	[SAINHO] [numeric](11, 2) NOT NULL,
	[SAOPT#] [numeric](9, 0) NOT NULL,
	[SAPCRC] [char](5) NOT NULL,
	[SASRBILL] [char](1) NOT NULL,
	[SACLNO] [numeric](7, 0) NOT NULL,
	[SARPAIDFUL] [char](1) NOT NULL,
	[SARLASTONE] [char](1) NOT NULL,
	[SATIMEL] [numeric](4, 0) NOT NULL,
	[SAPOD] [char](1) NOT NULL,
	[SAPORET] [char](1) NOT NULL,
	[SARET#] [numeric](9, 0) NOT NULL,
	[SAICCMP] [numeric](3, 0) NOT NULL,
	[SAICPO] [numeric](9, 0) NOT NULL,
	[SAVRET] [char](1) NOT NULL,
	[SAVRET#] [numeric](9, 0) NOT NULL,
	[SASHPC] [char](1) NOT NULL,
	[SASEASON] [char](3) NOT NULL,
	[SACCTD] [numeric](8, 0) NOT NULL,
	[SACCTT] [numeric](6, 0) NOT NULL,
	[SACCTU] [char](10) NOT NULL,
	[SACCTP] [char](10) NOT NULL,
	[SALCGD] [numeric](8, 0) NOT NULL,
	[SALCGT] [numeric](6, 0) NOT NULL,
	[SALCGU] [char](10) NOT NULL,
	[SALCGP] [char](10) NOT NULL,
	[SAPGRP] [char](7) NOT NULL,
	[SAPMAT] [char](3) NOT NULL,
	[SASPHONE] [char](20) NOT NULL,
	[SASCONT] [char](30) NOT NULL,
	[SAPARENT] [char](7) NOT NULL,
	[SAGRNDPAR] [char](7) NOT NULL,
	[SACCLS] [char](2) NOT NULL,
	[SARST] [char](2) NOT NULL,
	[SARZIP] [char](15) NOT NULL,
	[SARCITY] [char](17) NOT NULL,
	[SATERR] [char](4) NOT NULL,
	[SA_OROUT] [char](5) NOT NULL,
	[SA_ADDON] [char](1) NOT NULL,
	[SA_SLING] [char](1) NOT NULL,
	[SA_WSTAT] [char](1) NOT NULL,
	[SA_RQOVR] [char](1) NOT NULL,
	[SA_ORGO] [char](1) NOT NULL,
	[SA_NROUT] [char](5) NOT NULL,
	[SAWHO] [char](30) NOT NULL,
	[SAPRONL] [char](30) NOT NULL,
	[SATXID] [char](15) NOT NULL,
	[SA_PROMO] [char](7) NOT NULL,
	[SA_PROVR] [char](1) NOT NULL,
	[SACRDREB] [char](1) NOT NULL,
	[SACAMP] [numeric](9, 0) NOT NULL,
	[SABUSU] [char](2) NOT NULL,
	[SAPODFLG] [char](1) NOT NULL,
	[SASHPCD] [char](3) NOT NULL,
	[SAXPHS340] [char](20) NOT NULL,
	[SAXPHSFLG] [char](1) NOT NULL,
	[SAXOVRCUS] [char](7) NOT NULL,
	[SAFREEFRT] [numeric](11, 2) NOT NULL,
	[SAFDTXE] [numeric](11, 2) NOT NULL,
	[SASTTXE] [numeric](11, 2) NOT NULL,
	[SACNTXE] [numeric](11, 2) NOT NULL,
	[SAL1TXE] [numeric](11, 2) NOT NULL,
	[SAL2TXE] [numeric](11, 2) NOT NULL,
	[SAAMTXE] [numeric](11, 2) NOT NULL,
	[SAFDTXEF] [numeric](11, 2) NOT NULL,
	[SASTTXEF] [numeric](11, 2) NOT NULL,
	[SACNTXEF] [numeric](11, 2) NOT NULL,
	[SAL1TXEF] [numeric](11, 2) NOT NULL,
	[SAL2TXEF] [numeric](11, 2) NOT NULL,
	[SAAMTXEF] [numeric](11, 2) NOT NULL,
	[SA@PKCTL] [numeric](9, 0) NOT NULL,
	[SA@DESTCOD] [char](10) NOT NULL,
	[SAPREQ] [char](10) NOT NULL,
	[N] [numeric](6, 0) NOT NULL,
	[SAPGMCD] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpartners_20200206]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpartners_20200206](
	[PARTNER_ID] [float] NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WHAccountSales20200807]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WHAccountSales20200807](
	[Cust#] [nvarchar](255) NULL,
	[Brands] [float] NULL,
	[Generics] [float] NULL,
	[OTC] [float] NULL,
	[Total Monthly Sales] [float] NULL,
	[G1235] [float] NULL,
	[G6] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Error].[ErrorOutput]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Error].[ErrorOutput](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorDateTime] [datetime] NULL,
	[FQNFileName] [varchar](1000) NULL,
	[FileErrorRowNumber] [int] NOT NULL,
	[ErrorData] [varchar](8000) NOT NULL,
	[ErrorDescription] [varchar](8000) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Error].[ManagedErrorLog]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Error].[ManagedErrorLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Process] [varchar](1000) NOT NULL,
	[Message] [varchar](8000) NULL,
	[StackTrace] [varchar](1000) NULL,
	[Source] [varchar](1000) NULL,
	[Procedure] [varchar](1000) NULL,
	[LineNumber] [int] NULL,
	[InnerException] [varchar](8000) NULL,
	[Number] [int] NULL,
	[State] [int] NULL,
	[TargetSite] [varchar](1000) NULL,
	[HelpLink] [varchar](8000) NULL,
	[SQLErrorCode] [int] NULL,
	[SQLSeverity] [int] NULL,
	[Data] [varchar](8000) NULL,
	[Server] [varchar](1000) NULL,
	[ExceptionType] [varchar](1000) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Error_ManagedErrorLog] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Error].[SSIS_ErrorLog]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Error].[SSIS_ErrorLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionID] [bigint] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[API_Inventory]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[API_Inventory](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[LPSROM] [char](3) NOT NULL,
	[LPLZON] [char](2) NOT NULL,
	[LPLCID] [char](8) NOT NULL,
	[LPPRDC] [char](35) NOT NULL,
	[LPBATC] [char](13) NOT NULL,
	[LPFPUT] [numeric](8, 0) NOT NULL,
	[LPLPUT] [numeric](8, 0) NOT NULL,
	[LPLOQT] [numeric](17, 3) NOT NULL,
	[LPPIQT] [numeric](17, 3) NOT NULL,
	[LPSTTC] [char](1) NOT NULL,
	[LPLIST] [numeric](7, 0) NOT NULL,
	[LPPIPR] [numeric](3, 0) NOT NULL,
	[LPPUPR] [numeric](3, 0) NOT NULL,
	[LPSDAT] [numeric](8, 0) NOT NULL,
	[LPLOCT] [char](6) NOT NULL,
	[LPRQNC] [numeric](15, 3) NOT NULL,
	[LPUQNC] [numeric](15, 3) NOT NULL,
	[LPNCCN] [numeric](7, 0) NOT NULL,
	[LPSENC] [char](1) NOT NULL,
	[LPORFN] [numeric](7, 0) NOT NULL,
	[LPORFL] [numeric](5, 0) NOT NULL,
	[LPLCRE] [char](1) NOT NULL,
	[LPQCYN] [char](1) NOT NULL,
	[LPTDCD] [char](1) NOT NULL,
	[LPHLBA] [char](1) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_Staging_API_Inventory] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APIInvoiceImport]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIInvoiceImport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice] [varchar](500) NULL,
	[OrderNbr] [varchar](500) NULL,
	[Date] [varchar](500) NULL,
	[APICustNbr] [varchar](500) NULL,
	[APICustName] [varchar](500) NULL,
	[CarrierCode] [varchar](500) NULL,
	[CarrierDesc] [varchar](500) NULL,
	[CustRef] [varchar](500) NULL,
	[Whse] [varchar](500) NULL,
	[OrdType] [varchar](500) NULL,
	[DateLoaded] [datetime] NOT NULL,
	[FileProcessed] [varchar](1000) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ROWVERSIONID] [timestamp] NOT NULL,
 CONSTRAINT [PK_APISalesInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APIOrder]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIOrder](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[IDINVN] [numeric](7, 0) NOT NULL,
	[IDTYPP] [numeric](1, 0) NOT NULL,
	[IDINYY] [numeric](4, 0) NOT NULL,
	[IDORNO] [numeric](7, 0) NOT NULL,
	[IDLINE] [numeric](5, 0) NOT NULL,
	[IDIDAT] [numeric](8, 0) NOT NULL,
	[IDCUNO] [char](11) NOT NULL,
	[IDPRDC] [char](35) NOT NULL,
	[IDDESC] [char](30) NOT NULL,
	[IDQTY] [numeric](15, 3) NOT NULL,
	[IDDECC] [numeric](1, 0) NOT NULL,
	[IDSQTY] [numeric](15, 3) NOT NULL,
	[IDDECU] [numeric](1, 0) NOT NULL,
	[IDUNIT] [char](5) NOT NULL,
	[IDDDAT] [numeric](8, 0) NOT NULL,
	[IDDTIM] [numeric](5, 0) NOT NULL,
	[IDSALP] [numeric](17, 4) NOT NULL,
	[IDDCPR] [numeric](4, 2) NOT NULL,
	[IDDCAM] [numeric](17, 4) NOT NULL,
	[IDAMOU] [numeric](17, 4) NOT NULL,
	[IDFOCC] [char](1) NOT NULL,
	[IDOVDC] [char](1) NOT NULL,
	[IDVAHC] [char](4) NOT NULL,
	[IDSHPM] [char](30) NOT NULL,
	[IDCONO] [numeric](8, 0) NOT NULL,
	[IDRPRV] [numeric](17, 4) NOT NULL,
	[IDTRTY] [numeric](1, 0) NOT NULL,
	[IDCOSP] [numeric](17, 4) NOT NULL,
	[IDPGRP] [char](5) NOT NULL,
	[IDPAGR] [char](4) NOT NULL,
	[IDPCA1] [char](5) NOT NULL,
	[IDPCA2] [char](5) NOT NULL,
	[IDPCA3] [char](5) NOT NULL,
	[IDPCA4] [char](5) NOT NULL,
	[IDPCA5] [char](5) NOT NULL,
	[IDPCA6] [char](5) NOT NULL,
	[IDCGRP] [char](6) NOT NULL,
	[IDCAGR] [char](4) NOT NULL,
	[IDCCA1] [char](6) NOT NULL,
	[IDCCA2] [char](6) NOT NULL,
	[IDCCA3] [char](6) NOT NULL,
	[IDDGRP] [char](2) NOT NULL,
	[IDCOUN] [char](4) NOT NULL,
	[IDAREA] [char](3) NOT NULL,
	[IDHAND] [char](10) NOT NULL,
	[IDSROM] [char](3) NOT NULL,
	[IDORDT] [char](2) NOT NULL,
	[IDSUPP] [char](11) NOT NULL,
	[IDODIS] [numeric](4, 2) NOT NULL,
	[IDSALE] [char](10) NOT NULL,
	[IDNPRC] [numeric](17, 4) NOT NULL,
	[IDEXR3] [numeric](13, 7) NOT NULL,
	[IDSTRU] [numeric](1, 0) NOT NULL,
	[IDRDTE] [numeric](8, 0) NOT NULL,
	[IDRDTI] [numeric](5, 0) NOT NULL,
	[IDTDCD] [char](1) NOT NULL,
	[IDDDCD] [char](1) NOT NULL,
	[IDPOTP] [char](2) NOT NULL,
	[IDPORN] [numeric](7, 0) NOT NULL,
	[IDPLIN] [numeric](5, 0) NOT NULL,
	[IDPCOD] [char](3) NOT NULL,
	[IDPERI] [numeric](6, 0) NOT NULL,
	[IDSENC] [char](1) NOT NULL,
	[IDOLIN] [numeric](5, 0) NOT NULL,
	[IDGWGT] [numeric](11, 5) NOT NULL,
	[IDNWGT] [numeric](11, 5) NOT NULL,
	[IDGVOL] [numeric](11, 5) NOT NULL,
	[IDNVOL] [numeric](11, 5) NOT NULL,
	[IDICNO] [char](11) NOT NULL,
	[IDSTCF] [numeric](1, 0) NOT NULL,
	[IDSVCC] [char](1) NOT NULL,
	[IDAGMC] [char](1) NOT NULL,
	[IDTECN] [char](10) NOT NULL,
	[IDPTPE] [char](5) NOT NULL,
	[IDODAT] [numeric](8, 0) NOT NULL,
	[IDNOTR] [char](3) NOT NULL,
	[IDPOVA] [char](4) NOT NULL,
	[IDCSNO] [char](18) NOT NULL,
	[IDOCOU] [char](4) NOT NULL,
	[IDNSVA] [numeric](17, 4) NOT NULL,
	[IDDLBU] [char](1) NOT NULL,
	[IDCIPO] [numeric](7, 0) NOT NULL,
	[IDIORD] [char](1) NOT NULL,
	[IDIOTY] [char](2) NOT NULL,
	[IDLCVA] [numeric](17, 4) NOT NULL,
	[IDEDPC] [char](1) NOT NULL,
	[IDBTCC] [char](1) NOT NULL,
	[IDPODR] [char](20) NOT NULL,
	[IDPROD] [char](1) NOT NULL,
	[IDDENO] [char](11) NOT NULL,
	[IDDIS2] [numeric](4, 2) NOT NULL,
	[IDDIS3] [numeric](4, 2) NOT NULL,
	[IDDIS4] [numeric](4, 2) NOT NULL,
	[IDDIS5] [numeric](4, 2) NOT NULL,
	[IDDIS6] [numeric](4, 2) NOT NULL,
	[IDDIS7] [numeric](4, 2) NOT NULL,
	[IDDIS8] [numeric](4, 2) NOT NULL,
	[IDDIS9] [numeric](4, 2) NOT NULL,
	[IDITET] [numeric](17, 3) NOT NULL,
	[IDITIT] [numeric](17, 3) NOT NULL,
	[IDITT] [numeric](17, 3) NOT NULL,
	[IDTAXF] [char](1) NOT NULL,
	[IDUPBA] [numeric](9, 5) NOT NULL,
	[IDVATI] [char](1) NOT NULL,
	[IDLAOC] [numeric](17, 4) NOT NULL,
	[IDVAOC] [numeric](17, 4) NOT NULL,
	[IDTAXC] [char](1) NOT NULL,
	[IDTSRM] [char](3) NOT NULL,
	[IDCIOL] [numeric](5, 0) NOT NULL,
	[IDCCOD] [char](3) NOT NULL,
	[IDHCOD] [char](5) NOT NULL,
	[IDLBCD] [char](3) NOT NULL,
	[IDNCCN] [numeric](7, 0) NOT NULL,
	[IDPCKT] [char](10) NOT NULL,
	[IDREAS] [char](3) NOT NULL,
	[IDIVTP] [char](4) NOT NULL,
	[IDROCO] [char](1) NOT NULL,
	[IDAGMT] [char](12) NOT NULL,
	[IDPDGR] [char](5) NOT NULL,
	[IDINUM] [numeric](7, 0) NOT NULL,
	[IDINLN] [numeric](5, 0) NOT NULL,
	[IDQUNO] [numeric](7, 0) NOT NULL,
	[IDVRNO] [numeric](2, 0) NOT NULL,
	[IDQULN] [numeric](5, 0) NOT NULL,
	[IDDECCH1] [char](6) NOT NULL,
	[IDDECCH2] [char](6) NOT NULL,
	[IDDECCH3] [char](6) NOT NULL,
	[IDDECCH4] [char](6) NOT NULL,
	[IDDECCH5] [char](6) NOT NULL,
	[IDDECCH6] [char](6) NOT NULL,
	[IDDECCH7] [char](6) NOT NULL,
	[IDDECCH8] [char](6) NOT NULL,
	[IDDECCH9] [char](6) NOT NULL,
	[IDDECCF1] [char](6) NOT NULL,
	[IDDECCF2] [char](6) NOT NULL,
	[IDDECCF3] [char](6) NOT NULL,
	[IDDECCF4] [char](6) NOT NULL,
	[IDDECCF5] [char](6) NOT NULL,
	[IDDECCUN] [char](11) NOT NULL,
	[IDDEDCUN] [char](11) NOT NULL,
	[IDDEPST1] [char](5) NOT NULL,
	[IDDEPST2] [char](5) NOT NULL,
	[IDDEPST3] [char](5) NOT NULL,
	[IDDEPST4] [char](5) NOT NULL,
	[IDDEPST5] [char](5) NOT NULL,
	[IDDEPST6] [char](5) NOT NULL,
	[IDDEPST7] [char](5) NOT NULL,
	[IDDEPST8] [char](5) NOT NULL,
	[IDDEPST9] [char](5) NOT NULL,
	[IDAMCF] [numeric](1, 0) NOT NULL,
	[IDCPCF] [numeric](1, 0) NOT NULL,
	[IDPPGR] [char](5) NOT NULL,
	[IDPRFA] [char](5) NOT NULL,
	[IDPRSE] [char](5) NOT NULL,
	[IDPROI] [numeric](7, 0) NOT NULL,
	[IDPRPH] [numeric](3, 0) NOT NULL,
	[IDPROL] [numeric](4, 0) NOT NULL,
	[IDPLAN] [char](10) NOT NULL,
	[IDPRCL] [char](1) NOT NULL,
	[IDPRIL] [char](2) NOT NULL,
	[IDSOPR] [numeric](1, 0) NOT NULL,
	[IDBOPR] [numeric](1, 0) NOT NULL,
	[IDTXKY] [numeric](15, 0) NOT NULL,
	[IDCPRD] [char](35) NOT NULL,
	[IDCPDS] [char](30) NOT NULL,
	[IDCSTS] [char](7) NOT NULL,
	[IDDIVN] [char](8) NOT NULL,
	[IDCOPO] [char](1) NOT NULL,
	[IDIS01] [char](35) NOT NULL,
	[IDIS02] [char](35) NOT NULL,
	[IDIS03] [char](35) NOT NULL,
	[IDIS04] [char](35) NOT NULL,
	[IDIS05] [char](35) NOT NULL,
	[IDIS06] [char](35) NOT NULL,
	[IDISPR] [char](35) NOT NULL,
	[IDAGTP] [char](5) NOT NULL,
	[IDJNBR] [numeric](3, 0) NOT NULL,
	[IDOPRD] [char](35) NOT NULL,
	[IDOSEN] [char](20) NOT NULL,
	[IDRECQ] [numeric](15, 3) NOT NULL,
	[IDREC1] [numeric](15, 3) NOT NULL,
	[IDACQT] [numeric](15, 3) NOT NULL,
	[IDACT1] [numeric](15, 3) NOT NULL,
	[IDIREC] [char](1) NOT NULL,
	[IDPDDT] [numeric](8, 0) NOT NULL,
	[IDPDRD] [numeric](5, 0) NOT NULL,
	[IDDEBI] [numeric](4, 0) NOT NULL,
	[IDRESP] [char](10) NOT NULL,
	[IDCCGR] [char](5) NOT NULL,
	[IDPCGR] [char](5) NOT NULL,
	[IDSPGR] [char](5) NOT NULL,
	[IDSDAG] [char](15) NOT NULL,
	[IDSDCA] [numeric](17, 4) NOT NULL,
	[IDSATX] [char](1) NOT NULL,
	[IDPRME] [char](5) NOT NULL,
	[IDSHPA] [char](11) NOT NULL,
	[IDROUT] [char](10) NOT NULL,
	[IDDEST] [char](10) NOT NULL,
	[IDTPRC] [char](1) NOT NULL,
	[IDDLVD] [numeric](8, 0) NOT NULL,
	[IDRDVD] [numeric](8, 0) NOT NULL,
	[IDTRPT] [numeric](3, 0) NOT NULL,
	[IDDEPA] [char](10) NOT NULL,
	[IDPCKD] [char](1) NOT NULL,
	[IDPTQT] [numeric](15, 3) NOT NULL,
	[IDUSPUNT] [char](5) NOT NULL,
	[IDUSPCNV] [numeric](15, 9) NOT NULL,
	[IDUSPQTY] [numeric](23, 7) NOT NULL,
	[IDUSRRAQ] [numeric](15, 3) NOT NULL,
	[IDUSRRUQ] [numeric](15, 3) NOT NULL,
	[IDUSPRQY] [numeric](15, 3) NOT NULL,
	[IDRBPR] [numeric](17, 4) NOT NULL,
	[IDUSCURB] [numeric](17, 4) NOT NULL,
	[IDUSPACU] [numeric](23, 9) NOT NULL,
	[IDRPAB] [numeric](17, 4) NOT NULL,
	[IDUSPSLN] [numeric](5, 0) NOT NULL,
	[IDGTPE] [char](5) NOT NULL,
	[IDSHPG] [char](5) NOT NULL,
	[IDLTYP] [numeric](2, 0) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_Staging_APIOrder] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APIPricing]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIPricing](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ROW] [bigint] NULL,
	[COMPANY_NO] [numeric](3, 0) NULL,
	[SKU] [varchar](20) NULL,
	[STATUS] [varchar](8) NULL,
	[PRODUCT_ONLINE] [varchar](1) NULL,
	[NAME] [char](30) NULL,
	[CATEGORY_NAME] [varchar](30) NULL,
	[CATEGORY_ID] [char](6) NULL,
	[TOP_CATEGORY_NAME] [varchar](30) NULL,
	[TOP_CATEGORY_ID] [char](6) NULL,
	[NDC] [char](13) NULL,
	[UPC] [char](18) NULL,
	[BARCODE] [char](18) NULL,
	[IS_CONTROL] [varchar](1) NULL,
	[IS_CII_CONTROL] [varchar](1) NULL,
	[IS_REMS_RESTRICTED] [varchar](1) NULL,
	[IS_REFRIGERATED] [varchar](1) NULL,
	[TAX_CLASS_NAME] [varchar](1) NULL,
	[PRICE] [numeric](9, 2) NULL,
	[CREATED] [numeric](8, 0) NULL,
	[UPDATED] [numeric](8, 0) NULL,
	[MSRP] [numeric](9, 2) NULL,
	[RELATED_SKUS] [varchar](1) NULL,
	[UPSELL_SKUS] [varchar](1) NULL,
	[ALLOCATION] [numeric](9, 2) NULL,
	[IMAGE_PATH_LG] [varchar](73) NULL,
	[WEIGHT] [numeric](11, 4) NULL,
	[DESCRIPTION] [char](30) NULL,
	[BRAND_NAME] [char](30) NULL,
	[REBATE_AMT] [numeric](11, 4) NULL,
	[RowCreatedDate] [datetime] NULL,
	[EffectiveDate] [date] NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetail]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetail](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NULL,
	[InvLine] [char](4) NULL,
	[CustNbr] [char](35) NULL,
	[Cust] [char](100) NULL,
	[Item] [char](125) NULL,
	[NDC] [char](50) NULL,
	[Qty] [char](20) NULL,
	[ItemAmt] [char](20) NULL,
	[ItemGrp] [char](10) NULL,
	[AcctGrp] [char](10) NULL,
	[Slsman] [char](4) NULL,
	[InvDate] [char](20) NULL,
	[LineAmt] [char](20) NULL,
	[ExtSales] [char](20) NULL,
	[SalesOrd] [char](20) NULL,
	[DISREBATE] [char](20) NULL,
	[IDTYPP] [char](4) NULL,
	[IDNSVA] [char](20) NULL,
	[REBATE] [char](20) NULL,
	[IDPAGR] [char](4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ItemNo] [varchar](25) NULL,
	[CarrierCode] [varchar](50) NULL,
	[WharehouseNum] [varchar](10) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [CPK_Staging_APISalesDetail] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetail_2]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetail_2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NOT NULL,
	[InvLine] [char](4) NOT NULL,
	[CustNbr] [char](35) NOT NULL,
	[Cust] [char](100) NOT NULL,
	[Item] [char](125) NOT NULL,
	[NDC] [char](50) NOT NULL,
	[Qty] [char](20) NOT NULL,
	[ItemAmt] [char](20) NOT NULL,
	[ItemGrp] [char](10) NOT NULL,
	[AcctGrp] [char](10) NOT NULL,
	[Slsman] [char](4) NOT NULL,
	[InvDate] [char](20) NOT NULL,
	[LineAmt] [char](20) NOT NULL,
	[ExtSales] [char](20) NOT NULL,
	[SalesOrd] [char](20) NOT NULL,
	[DISREBATE] [char](20) NOT NULL,
	[IDTYPP] [char](4) NOT NULL,
	[IDNSVA] [char](20) NOT NULL,
	[REBATE] [char](20) NOT NULL,
	[IDPAGR] [char](4) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetail_MissingInvoices_Oct2020]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetail_MissingInvoices_Oct2020](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NULL,
	[InvLine] [char](4) NULL,
	[CustNbr] [char](35) NULL,
	[Cust] [char](100) NULL,
	[Item] [char](125) NULL,
	[NDC] [char](50) NULL,
	[Qty] [char](20) NULL,
	[ItemAmt] [char](20) NULL,
	[ItemGrp] [char](10) NULL,
	[AcctGrp] [char](10) NULL,
	[Slsman] [char](4) NULL,
	[InvDate] [char](20) NULL,
	[LineAmt] [char](20) NULL,
	[ExtSales] [char](20) NULL,
	[SalesOrd] [char](20) NULL,
	[DISREBATE] [char](20) NULL,
	[IDTYPP] [char](4) NULL,
	[IDNSVA] [char](20) NULL,
	[REBATE] [char](20) NULL,
	[IDPAGR] [char](4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ItemNo] [varchar](25) NULL,
	[CarrierCode] [varchar](50) NULL,
	[WharehouseNum] [varchar](10) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APISalesDetailReload]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APISalesDetailReload](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[InvNbr] [char](35) NULL,
	[InvLine] [char](4) NULL,
	[CustNbr] [char](35) NULL,
	[Cust] [char](100) NULL,
	[Item] [char](125) NULL,
	[NDC] [char](50) NULL,
	[Qty] [char](20) NULL,
	[ItemAmt] [char](20) NULL,
	[ItemGrp] [char](10) NULL,
	[AcctGrp] [char](10) NULL,
	[Slsman] [char](4) NULL,
	[InvDate] [char](20) NULL,
	[LineAmt] [char](20) NULL,
	[ExtSales] [char](20) NULL,
	[SalesOrd] [char](20) NULL,
	[DISREBATE] [char](20) NULL,
	[IDTYPP] [char](4) NULL,
	[IDNSVA] [char](20) NULL,
	[REBATE] [char](20) NULL,
	[IDPAGR] [char](4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[ItemNo] [varchar](25) NULL,
	[CarrierCode] [varchar](50) NULL,
	[WharehouseNum] [varchar](10) NULL,
	[CarrierDesc] [varchar](100) NULL,
	[CustomerRef] [varchar](100) NULL,
	[OrderType] [varchar](100) NULL,
 CONSTRAINT [CPK_Staging_APISalesDetailReload] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CardinalComplete]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CardinalComplete](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[UNITPRODUCT] [varchar](500) NULL,
	[SCANNEDUNITPRODUCTCODE] [varchar](500) NULL,
	[NDC] [varchar](500) NULL,
	[CARDINALITEMNUMBER] [varchar](500) NULL,
	[RXOTCFLAG] [varchar](500) NULL,
	[BRANDNAME] [varchar](500) NULL,
	[GENERICPRODUCTDESCRIPTION] [varchar](500) NULL,
	[AWP] [varchar](500) NULL,
	[CONTRACTPRICE] [varchar](500) NULL,
	[INVOICEPRICE] [varchar](500) NULL,
	[BASEPRICE] [varchar](500) NULL,
	[RETAILPRICE] [varchar](500) NULL,
	[FORM] [varchar](500) NULL,
	[STRENGTH] [varchar](500) NULL,
	[SIZE] [varchar](500) NULL,
	[UNITOFMEASURE] [varchar](500) NULL,
	[VENDORNAME] [varchar](500) NULL,
	[ACCUNETSIZE] [varchar](500) NULL,
	[CASEQUANTITY] [varchar](500) NULL,
	[PACKQUANTITY] [varchar](500) NULL,
	[UNITSIZE] [varchar](500) NULL,
	[DISPENSEQUANTITY] [varchar](500) NULL,
	[THERAPEUTICCLASSCODE] [varchar](500) NULL,
	[CONTRACTNUMBER] [varchar](500) NULL,
	[CONTRACTNAME] [varchar](500) NULL,
	[CONTRACTSTARTDATE] [varchar](500) NULL,
	[CONTRACTENDDATE] [varchar](500) NULL,
	[INVOICEPRICECHANGEDATE] [varchar](500) NULL,
	[BASEPRICECHANGEDATE] [varchar](500) NULL,
	[FINELINECODE] [varchar](500) NULL,
	[PREVIOUSINVOICEPRICE] [varchar](500) NULL,
	[CCAHEADER] [varchar](500) NULL,
	[GENERICCODE] [varchar](500) NULL,
	[GPPCCODE] [varchar](500) NULL,
	[GPI] [varchar](500) NULL,
	[API_Size] [varchar](500) NULL,
	[API ITEM] [varchar](500) NULL,
	[API PRICE] [varchar](500) NULL,
	[Adj Rebate] [varchar](500) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_CardinalComplete_RowID] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CONTRACT]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CONTRACT](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[show] [bit] NOT NULL,
	[ID] [int] NOT NULL,
	[delete] [bit] NOT NULL,
	[Contract Status] [nvarchar](255) NULL,
	[Contract Status 2] [nvarchar](255) NULL,
	[Control Rx] [bit] NOT NULL,
	[API Item #] [nvarchar](255) NULL,
	[REPLACE#] [nvarchar](50) NULL,
	[NDC #] [nvarchar](12) NULL,
	[Brand Reference] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [decimal](8, 2) NULL,
	[Contract] [nvarchar](255) NULL,
	[Program] [nvarchar](255) NULL,
	[Rate] [nvarchar](255) NULL,
	[Invoice Price] [money] NULL,
	[DISCOUNT-RX PRICE] [money] NULL,
	[BW Contract Price] [money] NULL,
	[Contract Price] [money] NULL,
	[API Price] [money] NULL,
	[AWP] [money] NULL,
	[Net Price] [money] NULL,
	[Rebate] [money] NULL,
	[% Rebate] [float] NULL,
	[case pk] [int] NULL,
	[inner pk] [int] NULL,
	[Fee] [nvarchar](255) NULL,
	[MFG Date] [nvarchar](255) NULL,
	[API Date] [datetime] NULL,
	[billable size] [nvarchar](50) NULL,
	[billable cost] [nvarchar](50) NULL,
	[4% of price] [nvarchar](255) NULL,
	[rebate minus 4% of price] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_CONTRACT] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[ContractUp]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ContractUp](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[case pk] [float] NULL,
	[inner pk] [float] NULL,
	[1] [nvarchar](255) NULL,
	[2] [nvarchar](255) NULL,
	[Control Rx] [bit] NULL,
	[API ITEM #] [nvarchar](255) NULL,
	[REPLACE#] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[temp-ndc number] [nvarchar](255) NULL,
	[BRAND REFER] [nvarchar](255) NULL,
	[ITEM DESCRIPTION] [nvarchar](255) NULL,
	[UNIT] [nvarchar](255) NULL,
	[SIZE] [nvarchar](255) NULL,
	[CONTRACT] [nvarchar](255) NULL,
	[INVOICE PRICE] [money] NULL,
	[CONTRACT PRICE] [money] NULL,
	[API PRICE] [money] NULL,
	[FEE SCHED] [float] NULL,
	[AWP] [money] NULL,
	[PROGRAM] [nvarchar](255) NULL,
	[RATE] [nvarchar](255) NULL,
	[MFG Multiple for  Rebate] [float] NULL,
	[NET PRICE] [money] NULL,
	[REBATE] [money] NULL,
	[% REBATE] [float] NULL,
	[Value Add Factor] [float] NULL,
	[Value Add Basis] [nvarchar](255) NULL,
	[ADR Item] [bit] NULL,
	[ADR Expiry] [nvarchar](255) NULL,
	[MFG DATE] [nvarchar](255) NULL,
	[Work Date] [nvarchar](255) NULL,
	[API DATE] [datetime] NULL,
	[REVIEW] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[TempSIZE] [nvarchar](255) NULL,
	[billable size] [nvarchar](255) NULL,
	[billable cost] [nvarchar](255) NULL,
	[4% of price] [nvarchar](255) NULL,
	[rebate minus 4% of price] [nvarchar](255) NULL,
	[Comments] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_ContractUp] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CRM_AccountEntity_User]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CRM_AccountEntity_User](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [uniqueidentifier] NULL,
	[new_aap_account] [nvarchar](100) NULL,
	[new_aap_effective_date] [date] NULL,
	[new_aap_resignation_reason] [int] NULL,
	[new_aap_resignation_reasonname] [nvarchar](250) NULL,
	[new_aapmembershiptype] [int] NULL,
	[new_aapmembershiptypename] [nvarchar](250) NULL,
	[new_aapparent] [nvarchar](4000) NULL,
	[new_aapparenttext] [nvarchar](100) NULL,
	[new_aapquit] [date] NULL,
	[new_aapstatus] [int] NULL,
	[new_aapstatusname] [nvarchar](250) NULL,
	[new_aaptermnotice] [date] NULL,
	[new_account_subtype] [int] NULL,
	[new_account_subtypename] [nvarchar](250) NULL,
	[new_affiliate] [int] NULL,
	[new_affiliateactive] [date] NULL,
	[new_affiliateend] [date] NULL,
	[new_affiliategroup] [int] NULL,
	[new_affiliategroupname] [nvarchar](250) NULL,
	[new_affiliatename] [nvarchar](250) NULL,
	[new_aplicor] [nvarchar](100) NULL,
	[new_applicationfeedate] [date] NULL,
	[new_applicationreceived] [date] NULL,
	[new_at_risk] [int] NULL,
	[new_at_riskname] [nvarchar](250) NULL,
	[new_authorized_voter] [nvarchar](100) NULL,
	[new_authorizedsignature] [nvarchar](100) NULL,
	[new_automation] [int] NULL,
	[new_automationname] [nvarchar](250) NULL,
	[new_averagevolume] [int] NULL,
	[new_businessclass] [int] NULL,
	[new_businessclassname] [nvarchar](250) NULL,
	[new_category] [int] NULL,
	[new_categoryname] [nvarchar](250) NULL,
	[new_combinedvolume] [int] NULL,
	[new_computer_software] [int] NULL,
	[new_computer_softwarename] [nvarchar](250) NULL,
	[new_conference2015] [int] NULL,
	[new_conference2015name] [nvarchar](250) NULL,
	[new_conference2016] [int] NULL,
	[new_conference2016name] [nvarchar](250) NULL,
	[new_conference2017] [int] NULL,
	[new_conference2017name] [nvarchar](250) NULL,
	[new_conference2018] [int] NULL,
	[new_conference2018name] [nvarchar](250) NULL,
	[new_copyphysicaltofinancial] [bit] NULL,
	[new_copyphysicaltofinancialname] [nvarchar](250) NULL,
	[new_copyphysicaltomailing] [bit] NULL,
	[new_copyphysicaltomailingname] [nvarchar](250) NULL,
	[new_copytomarketingemail] [bit] NULL,
	[new_copytomarketingemailname] [nvarchar](250) NULL,
	[new_corporatename] [nvarchar](100) NULL,
	[new_county] [nvarchar](100) NULL,
	[new_dea] [nvarchar](100) NULL,
	[new_deaexpiration] [date] NULL,
	[new_diversionce] [date] NULL,
	[new_docusignsender] [int] NULL,
	[new_docusignsenderemail] [int] NULL,
	[new_docusignsenderemailname] [nvarchar](250) NULL,
	[new_docusignsendername] [nvarchar](250) NULL,
	[new_dunbradstreetno] [nvarchar](100) NULL,
	[new_edi_activation_date] [date] NULL,
	[new_edi_app_received_date] [date] NULL,
	[new_edi_approved_date] [date] NULL,
	[new_fed_tax] [nvarchar](100) NULL,
	[new_fee_paid] [int] NULL,
	[new_fee_paidname] [nvarchar](250) NULL,
	[new_gcr] [decimal](28, 0) NULL,
	[new_generalemail2] [nvarchar](4000) NULL,
	[new_group] [nvarchar](100) NULL,
	[new_groupalliance] [int] NULL,
	[new_groupalliancename] [nvarchar](250) NULL,
	[new_hours_saturday_close] [nvarchar](100) NULL,
	[new_hours_saturday_open] [nvarchar](100) NULL,
	[new_hours_sunday_close] [nvarchar](100) NULL,
	[new_hours_sunday_open] [nvarchar](100) NULL,
	[new_hours_weekdays_close] [nvarchar](100) NULL,
	[new_hours_weekdays_open] [nvarchar](100) NULL,
	[new_iatvtitle] [nvarchar](100) NULL,
	[new_incorporationstate] [nvarchar](2) NULL,
	[new_industrysupportfund] [int] NULL,
	[new_industrysupportfundname] [nvarchar](250) NULL,
	[new_lastsalescall] [date] NULL,
	[new_managedcarenetwork] [int] NULL,
	[new_managedcarenetworkname] [nvarchar](250) NULL,
	[new_marketingemail] [nvarchar](100) NULL,
	[new_mc_affiliation] [int] NULL,
	[new_mc_affiliationname] [nvarchar](250) NULL,
	[new_mc_effective_date] [date] NULL,
	[new_mc_network] [int] NULL,
	[new_mc_networkname] [nvarchar](250) NULL,
	[new_mc_termination_date] [date] NULL,
	[new_memb_received_date] [date] NULL,
	[new_ncpaid] [nvarchar](8) NULL,
	[new_ncpdp] [nvarchar](7) NULL,
	[new_npi] [nvarchar](11) NULL,
	[new_orderingcontact] [nvarchar](100) NULL,
	[new_orderingcontactlookup] [uniqueidentifier] NULL,
	[new_orderingcontactlookupname] [nvarchar](100) NULL,
	[new_orderingcontactlookupyominame] [nvarchar](100) NULL,
	[new_org_type] [int] NULL,
	[new_org_typename] [nvarchar](250) NULL,
	[new_ownertype] [int] NULL,
	[new_ownertypename] [nvarchar](250) NULL,
	[new_parentaccounttext] [nvarchar](100) NULL,
	[new_pharmacist] [nvarchar](100) NULL,
	[new_pharmacistlicense] [nvarchar](100) NULL,
	[new_pharmacistlicenseexpiration] [date] NULL,
	[new_pharmacyowner] [nvarchar](100) NULL,
	[new_pharmacyowneremail] [nvarchar](100) NULL,
	[new_pharmacyownerfax] [nvarchar](12) NULL,
	[new_pharmacyownerlookup] [uniqueidentifier] NULL,
	[new_pharmacyownerlookupname] [nvarchar](100) NULL,
	[new_pharmacyownerlookupyominame] [nvarchar](100) NULL,
	[new_pharmacyownerphone] [nvarchar](12) NULL,
	[new_pharmacyownertitle] [nvarchar](100) NULL,
	[new_pharmacysystem] [int] NULL,
	[new_pharmacysystemname] [nvarchar](250) NULL,
	[new_planogram] [int] NULL,
	[new_planogramname] [nvarchar](250) NULL,
	[new_planogramquit] [date] NULL,
	[new_planogramstart] [date] NULL,
	[new_pmid] [nvarchar](100) NULL,
	[new_previousaapmember] [uniqueidentifier] NULL,
	[new_previousaapmembername] [nvarchar](100) NULL,
	[new_previousaapmemberyominame] [nvarchar](100) NULL,
	[new_previousgroupalliance] [int] NULL,
	[new_previousgroupalliancename] [nvarchar](250) NULL,
	[new_previousprimarywholesaler] [int] NULL,
	[new_previousprimarywholesalername] [nvarchar](250) NULL,
	[new_previouswholesaler] [int] NULL,
	[new_previouswholesaleraccountno] [nvarchar](100) NULL,
	[new_previouswholesalername] [nvarchar](250) NULL,
	[new_primarycontact] [nvarchar](100) NULL,
	[new_primarywholesaleraccountno] [nvarchar](100) NULL,
	[new_primarywholesalernew] [int] NULL,
	[new_primarywholesalernewname] [nvarchar](250) NULL,
	[new_sendapplicationemail] [nvarchar](100) NULL,
	[new_sendapplicationname] [nvarchar](100) NULL,
	[new_softwareliabilitywaiver] [date] NULL,
	[new_startup] [int] NULL,
	[new_startupname] [nvarchar](250) NULL,
	[new_state_lic] [nvarchar](100) NULL,
	[new_state_lic_exp_date] [date] NULL,
	[new_state_tax] [nvarchar](100) NULL,
	[new_stbrandsmartplus] [int] NULL,
	[new_stcloud] [bit] NULL,
	[new_stcloudname] [nvarchar](250) NULL,
	[new_stcloudworkstations] [nvarchar](3) NULL,
	[new_territories] [int] NULL,
	[new_territoriesname] [nvarchar](250) NULL,
	[new_territory] [int] NULL,
	[new_territorymanager] [int] NULL,
	[new_territorymanageremail] [int] NULL,
	[new_territorymanageremailname] [nvarchar](250) NULL,
	[new_territorymanagername] [nvarchar](250) NULL,
	[new_territoryname] [nvarchar](250) NULL,
	[new_wholesaler] [int] NULL,
	[new_wholesalername] [nvarchar](250) NULL,
	[new_businessestablished] [date] NULL,
	[new_controlledsubstancesprofile] [int] NULL,
	[new_controlledsubstancesprofilename] [nvarchar](250) NULL,
	[new_creditreportauth] [int] NULL,
	[new_creditreportauthname] [nvarchar](250) NULL,
	[new_deahinissue] [date] NULL,
	[new_historicalrecord] [bit] NULL,
	[new_lastvisit] [datetime] NULL,
	[new_lastvisitdate] [datetime] NULL,
	[new_lastvisitrollup] [datetime] NULL,
	[new_lastvisitrollup_date] [datetime] NULL,
	[new_lastvisitrollup_state] [int] NULL,
	[new_marketinglevel] [int] NULL,
	[new_marketinglevelname] [nvarchar](250) NULL,
	[new_ownershipchange] [int] NULL,
	[new_ownershipchangename] [nvarchar](250) NULL,
	[new_personalguaranty] [int] NULL,
	[new_personalguarantyname] [nvarchar](250) NULL,
	[new_powerofattorney] [int] NULL,
	[new_powerofattorneyname] [nvarchar](250) NULL,
	[new_rebatepaymentmethod] [int] NULL,
	[new_rebatepaymentmethodname] [nvarchar](250) NULL,
	[new_sendapplicationtitle] [nvarchar](100) NULL,
	[new_triggerapionboarding] [bit] NULL,
	[new_triggerapionboardingname] [nvarchar](250) NULL,
	[new_vai] [nvarchar](7) NULL,
	[new_zone] [int] NULL,
	[new_zonename] [nvarchar](250) NULL,
	[new_conference2019] [int] NULL,
	[new_conference2019name] [nvarchar](250) NULL,
	[new_deapharmacyname] [nvarchar](50) NULL,
	[new_heyrman] [int] NULL,
	[new_heyrmanname] [nvarchar](250) NULL,
	[new_pharmacyownermobilephone] [nvarchar](12) NULL,
	[new_referralincentivedate] [date] NULL,
	[new_referralincentivepaid] [date] NULL,
	[new_referralincentivestatus] [int] NULL,
	[new_referralincentivestatusname] [nvarchar](250) NULL,
	[new_referralstatus] [int] NULL,
	[new_referralstatusname] [nvarchar](250) NULL,
	[new_referralsubmissiondate] [date] NULL,
	[new_referringpharmacy] [uniqueidentifier] NULL,
	[new_referringpharmacyemail] [nvarchar](100) NULL,
	[new_referringpharmacyname] [nvarchar](100) NULL,
	[new_referringpharmacyyominame] [nvarchar](100) NULL,
	[new_secondaryphone] [nvarchar](50) NULL,
	[new_specialty] [int] NULL,
	[new_specialtyname] [nvarchar](250) NULL,
	[new_description] [nvarchar](4000) NULL,
	[new_historicalrecordname] [varchar](500) NULL,
	[DateKey] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[new_cahcsosaccount] [nvarchar](250) NULL,
	[new_cahstaccount] [nvarchar](250) NULL,
	[new_websitelogin] [nvarchar](250) NULL,
	[new_websitepassword] [nvarchar](250) NULL,
 CONSTRAINT [CPK_Staging_CRM_AccountEntity_User] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Staging_CRM_AccountEntity_User] UNIQUE NONCLUSTERED 
(
	[accountid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[KPI_AllyScripts]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[KPI_AllyScripts](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Pharmacy] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[AAPNumber] [varchar](255) NULL,
	[APINumber] [varchar](255) NULL,
	[Date] [varchar](255) NULL,
	[RXReceived] [varchar](255) NULL,
	[RXFilled] [varchar](255) NULL,
	[RowCreateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PatDiv]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PatDiv](
	[PMID] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[UDNo] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAPEffectiveDate] [nvarchar](255) NULL,
	[AAPQuitDate] [nvarchar](255) NULL,
	[Is MC] [nvarchar](255) NULL,
	[MCQuitDate] [nvarchar](255) NULL,
	[MC Contribution] [nvarchar](255) NULL,
	[ML Admin Fee] [nvarchar](255) NULL,
	[HIGH VOL INCENTIVE] [nvarchar](255) NULL,
	[AAP PVA Vol Admin Fee] [nvarchar](255) NULL,
	[AAP PVA Vol Admin Fee Retained] [nvarchar](255) NULL,
	[AAP PVA Gen Admin Fee] [nvarchar](255) NULL,
	[AAP PVA Gen Admin Fee Retained] [nvarchar](255) NULL,
	[Cardinal Annual Rebate] [nvarchar](255) NULL,
	[Subtotal Cardinal] [nvarchar](255) NULL,
	[Cardinal Upfront Admin] [nvarchar](255) NULL,
	[Cardinal HV Total] [nvarchar](255) NULL,
	[AAP Parent Contribution] [nvarchar](255) NULL,
	[WH Brand Year] [nvarchar](255) NULL,
	[WH Gen Year] [nvarchar](255) NULL,
	[WH Gen Contribution] [nvarchar](255) NULL,
	[WH OTC Year] [nvarchar](255) NULL,
	[MC, Cardinal and API Whse Contribution] [nvarchar](255) NULL,
	[Prelim Allocation] [nvarchar](255) NULL,
	[Under $15 deleted] [nvarchar](255) NULL,
	[Final Allocation] [nvarchar](255) NULL,
	[Half of Allocation] [nvarchar](255) NULL,
	[Payment Method] [nvarchar](255) NULL,
	[Check Process Charge] [float] NULL,
	[First Payment] [float] NULL,
	[Second Payment] [float] NULL,
	[Total to be paid] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[Rx30Claims]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Rx30Claims](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FileRowID] [int] NOT NULL,
	[PharmID] [varchar](500) NULL,
	[BINNbr] [varchar](500) NULL,
	[PCN] [varchar](500) NULL,
	[GroupNbr] [varchar](500) NULL,
	[Submitted] [varchar](500) NULL,
	[RxDate] [varchar](500) NULL,
	[QtyDispensed] [varchar](500) NULL,
	[DaySupply] [varchar](500) NULL,
	[NDCDispensed] [varchar](500) NULL,
	[FeeSubmitted] [varchar](500) NULL,
	[CostSubmitted] [varchar](500) NULL,
	[FeePaid] [varchar](500) NULL,
	[CostPaid] [varchar](500) NULL,
	[PlanAmount] [varchar](500) NULL,
	[CoPayAmount] [varchar](500) NULL,
	[UandC] [varchar](500) NULL,
	[TotalPrice] [varchar](500) NULL,
	[BS] [varchar](500) NULL,
	[BR] [varchar](500) NULL,
	[OI] [varchar](500) NULL,
	[DAW] [varchar](500) NULL,
	[DAWDesc] [varchar](500) NULL,
	[PatientPaid] [varchar](500) NULL,
	[GrossAmtDue] [varchar](500) NULL,
	[PlanID] [varchar](500) NULL,
	[RejCode] [varchar](500) NULL,
	[MessageResponse] [varchar](500) NULL,
	[TxResponse] [varchar](500) NULL,
	[RxNbr] [varchar](500) NULL,
	[RfNbr] [varchar](500) NULL,
	[PID_Q] [varchar](500) NULL,
	[PID] [varchar](500) NULL,
	[DoctorName] [varchar](500) NULL,
	[RA] [varchar](500) NULL,
	[NDCWritten] [varchar](500) NULL,
	[OtherAmount] [varchar](500) NULL,
	[TYPE] [varchar](500) NULL,
	[Rx30Lic] [varchar](500) NULL,
	[Compound] [varchar](500) NULL,
	[NetworkReimbID] [varchar](500) NULL,
	[PatientKey] [varchar](500) NULL,
	[PatientName] [varchar](500) NULL,
	[PatLocationCode] [varchar](500) NULL,
	[CardholderID] [varchar](500) NULL,
	[Patient Address] [varchar](500) NULL,
	[PatientCity] [varchar](500) NULL,
	[PatientState] [varchar](500) NULL,
	[PatientZip] [varchar](500) NULL,
	[PatientPhone] [varchar](500) NULL,
	[Birthdate] [varchar](500) NULL,
	[Gender] [varchar](500) NULL,
	[PrescriberPhone] [varchar](500) NULL,
	[RxSource] [varchar](500) NULL,
	[DRDEA] [varchar](500) NULL,
	[UnitAWP] [varchar](500) NULL,
	[PatientLastName] [varchar](500) NULL,
	[PatientFirstName] [varchar](500) NULL,
	[PatientMiddleName] [varchar](500) NULL,
	[FlatTaxPaid] [varchar](500) NULL,
	[PCTTaxPaid] [varchar](500) NULL,
	[PCTTaxRate] [varchar](500) NULL,
	[PCTTaxBasis] [varchar](500) NULL,
	[IncentiveFePaid] [varchar](500) NULL,
	[ProfFeePaid] [varchar](500) NULL,
	[PrescriberNPI] [varchar](500) NULL,
	[RxDiscount] [varchar](500) NULL,
	[ClaimAuthNumber] [varchar](500) NULL,
	[FileProcessed] [varchar](1000) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_Rx30Claims] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[ShipmentInfo]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ShipmentInfo](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ROW_NUM] [bigint] NOT NULL,
	[COMPANY_NO] [numeric](3, 0) NOT NULL,
	[PACKAGE_ID] [numeric](4, 0) NOT NULL,
	[ORDER_ID] [numeric](9, 0) NOT NULL,
	[ORDER_BO_CODE] [numeric](3, 0) NOT NULL,
	[COMPANY_ID] [varchar](25) NOT NULL,
	[TRACKING_NUMBER] [varchar](100) NOT NULL,
	[SHIP_COST] [numeric](11, 2) NOT NULL,
	[SHIP_DATE] [varchar](100) NULL,
	[SHIP_STATUS] [varchar](50) NOT NULL,
	[SHIP_METHOD] [varchar](50) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[SRBSRO]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SRBSRO](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SROPNO] [numeric](2, 0) NOT NULL,
	[SRDEID] [varchar](25) NOT NULL,
	[SRSTAT] [varchar](25) NOT NULL,
	[SRPRDC] [varchar](25) NOT NULL,
	[SRSROM] [varchar](25) NOT NULL,
	[SRZONE] [varchar](25) NOT NULL,
	[SRBIN1] [varchar](25) NOT NULL,
	[SRBIN2] [varchar](25) NOT NULL,
	[SRSTHQ] [numeric](15, 3) NOT NULL,
	[SRTSHQ] [numeric](15, 3) NOT NULL,
	[SRPURQ] [numeric](15, 3) NOT NULL,
	[SRRETQ] [numeric](15, 3) NOT NULL,
	[SRCUSQ] [numeric](15, 3) NOT NULL,
	[SRPICQ] [numeric](15, 3) NOT NULL,
	[SRPUTQ] [numeric](15, 3) NOT NULL,
	[SRCUTQ] [numeric](15, 3) NOT NULL,
	[SRPITQ] [numeric](15, 3) NOT NULL,
	[SRDNIQ] [numeric](15, 3) NOT NULL,
	[SRTDNQ] [numeric](15, 3) NOT NULL,
	[SRSPLQ] [numeric](15, 3) NOT NULL,
	[SRMINQ] [numeric](15, 3) NOT NULL,
	[SRDELQ] [numeric](15, 3) NOT NULL,
	[SRNITY] [numeric](5, 0) NOT NULL,
	[SRNIPY] [numeric](5, 0) NOT NULL,
	[SRIQTY] [numeric](15, 3) NOT NULL,
	[SRIQPY] [numeric](15, 3) NOT NULL,
	[SRIDAT] [numeric](8, 0) NOT NULL,
	[SRNRTY] [numeric](5, 0) NOT NULL,
	[SRNRPY] [numeric](5, 0) NOT NULL,
	[SRRQTY] [numeric](15, 3) NOT NULL,
	[SRRQPY] [numeric](15, 3) NOT NULL,
	[SRRDAT] [numeric](8, 0) NOT NULL,
	[SRNSTY] [numeric](5, 0) NOT NULL,
	[SRNSPY] [numeric](5, 0) NOT NULL,
	[SRQSTY] [numeric](15, 3) NOT NULL,
	[SRQSPY] [numeric](15, 3) NOT NULL,
	[SRAQTY] [numeric](15, 3) NOT NULL,
	[SRAQPY] [numeric](15, 3) NOT NULL,
	[SRSTTC] [varchar](25) NOT NULL,
	[SRSDAT] [numeric](8, 0) NOT NULL,
	[SRBQTY] [numeric](15, 3) NOT NULL,
	[SRBQPY] [numeric](15, 3) NOT NULL,
	[SRNLIS] [numeric](5, 0) NOT NULL,
	[SRNLIP] [numeric](5, 0) NOT NULL,
	[SRQLIS] [numeric](15, 3) NOT NULL,
	[SRQLIP] [numeric](15, 3) NOT NULL,
	[SRUFA3] [varchar](25) NOT NULL,
	[SRUFN3] [numeric](17, 3) NOT NULL,
	[SRTDCD] [varchar](25) NOT NULL,
	[SRDDCD] [varchar](25) NOT NULL,
	[SRQCHQ] [numeric](9, 3) NOT NULL,
	[SRQTQC] [numeric](15, 3) NOT NULL,
	[SRRQNC] [numeric](15, 3) NOT NULL,
	[SRRTNC] [numeric](15, 3) NOT NULL,
	[SRTQQC] [numeric](15, 3) NOT NULL,
	[SRUQNC] [numeric](15, 3) NOT NULL,
	[SRUTNC] [numeric](15, 3) NOT NULL,
	[SRDPNO] [varchar](25) NOT NULL,
	[SRRQDN] [numeric](15, 3) NOT NULL,
	[SRRQIR] [numeric](15, 3) NOT NULL,
	[SRRQPL] [numeric](15, 3) NOT NULL,
	[SRRQRO] [numeric](15, 3) NOT NULL,
	[SRRQSO] [numeric](15, 3) NOT NULL,
	[SRUQDN] [numeric](15, 3) NOT NULL,
	[SRUQIR] [numeric](15, 3) NOT NULL,
	[SRUQPL] [numeric](15, 3) NOT NULL,
	[SRUQRO] [numeric](15, 3) NOT NULL,
	[SRUQSO] [numeric](15, 3) NOT NULL,
	[SRMSUP] [varchar](25) NOT NULL,
	[SRPLAN] [varchar](25) NOT NULL,
	[SRRESP] [varchar](25) NOT NULL,
	[SRPRCL] [varchar](25) NOT NULL,
	[SRPLMD] [varchar](25) NOT NULL,
	[SROVSU] [varchar](25) NOT NULL,
	[SROVPL] [varchar](25) NOT NULL,
	[SROVRE] [varchar](25) NOT NULL,
	[SROVPC] [varchar](25) NOT NULL,
	[SROVRT] [varchar](25) NOT NULL,
	[SROALL] [varchar](25) NOT NULL,
	[SRALCY] [numeric](15, 3) NOT NULL,
	[SRWIPQ] [numeric](17, 3) NOT NULL,
	[SRTWPQ] [numeric](17, 3) NOT NULL,
	[SRSTPU] [numeric](17, 4) NOT NULL,
	[SRLPCO] [numeric](17, 4) NOT NULL,
	[SRTLPC] [numeric](17, 4) NOT NULL,
	[SRAPCO] [numeric](17, 4) NOT NULL,
	[SRTAPC] [numeric](17, 4) NOT NULL,
	[SRSTCO] [numeric](17, 4) NOT NULL,
	[SRCSTC] [numeric](17, 4) NOT NULL,
	[SREFDT] [numeric](8, 0) NOT NULL,
	[SRISDT] [numeric](8, 0) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[StandeferCatalog]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[StandeferCatalog](
	[UPC] [varchar](15) NULL,
	[NDC] [varchar](15) NULL,
	[VIN] [varchar](250) NULL,
	[CONTRACT_CODE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SHORT_DESCRIPTION] [varchar](50) NULL,
	[STRENGTH] [varchar](50) NULL,
	[FORM] [varchar](100) NULL,
	[SIZE] [varchar](50) NULL,
	[RXOTC] [varchar](50) NULL,
	[MINORDER] [varchar](50) NULL,
	[QTY] [varchar](50) NULL,
	[UNITS] [varchar](50) NULL,
	[AWP] [real] NULL,
	[INV] [real] NULL,
	[MSR] [varchar](50) NULL,
	[MANUFACTURER] [varchar](50) NULL,
	[UPDATED] [datetime] NULL,
	[GPI] [varchar](25) NULL,
	[BGO] [varchar](50) NULL,
	[DateKey] [datetime] NULL,
	[CatalogDate] [varchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[UserLogin]    Script Date: 12/22/2020 2:59:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[UserLogin](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[uname] [char](30) NOT NULL,
	[name] [char](30) NOT NULL,
	[pwd] [char](10) NOT NULL,
	[active] [char](1) NOT NULL,
	[api_id] [char](11) NOT NULL,
	[default_pmid] [char](6) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[API_Inventory] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[API_Inventory_2] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[APIOrder] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[APISalesDetail] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
ALTER TABLE [Archive].[CONTRACT] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[ContractUp] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Archive].[KPI_AllyScripts] ADD  DEFAULT (getdate()) FOR [RowCreateDate]
GO
ALTER TABLE [Archive].[UserLogin] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APIInventory] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((0)) FOR [IsWeekDay]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((0)) FOR [IsAAPHoliday]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((0)) FOR [IsAPIHoliday]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((1)) FOR [IsAPIShipDate]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((1)) FOR [IsUPSShipDate]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((1)) FOR [IsFedExShipDate]
GO
ALTER TABLE [dbo].[DateDim] ADD  DEFAULT ((0)) FOR [DayOfQuarter]
GO
ALTER TABLE [dbo].[DBA_ShrinkFile_Log] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[FileCheck] ADD  DEFAULT ((0)) FOR [DoesFileExist]
GO
ALTER TABLE [dbo].[FileCheck] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[FileLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_AnnualRebates_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[S2KAccount_20200805] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Error].[ErrorOutput] ADD  CONSTRAINT [df_RowCreatedDate]  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Error].[ManagedErrorLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Error].[SSIS_ErrorLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[API_Inventory] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APIInvoiceImport] ADD  DEFAULT (getdate()) FOR [DateLoaded]
GO
ALTER TABLE [Staging].[APIInvoiceImport] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APIOrder] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APISalesDetail] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
ALTER TABLE [Staging].[APISalesDetail_2] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APISalesDetailReload] ADD  DEFAULT ((0.00)) FOR [DiscountPercentage]
GO
ALTER TABLE [Staging].[CardinalComplete] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[CONTRACT] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[ContractUp] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[CRM_AccountEntity_User] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[KPI_AllyScripts] ADD  DEFAULT (getdate()) FOR [RowCreateDate]
GO
ALTER TABLE [Staging].[ShipmentInfo] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[SRBSRO] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[UserLogin] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
