USE [Medispan]
GO
/****** Object:  Table [Archive].[DrugMaster]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[DrugMaster](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[Strength] [varchar](25) NULL,
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
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[GPPC] [varchar](25) NULL,
	[NDC_10] [varchar](11) NULL,
	[IDCODE] [varchar](1) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[PackageQuantity] [numeric](37, 0) NULL,
 CONSTRAINT [CPK_Archive_DrugMaster] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[M25_A]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[M25_A](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL,
 CONSTRAINT [PK_NDC] PRIMARY KEY CLUSTERED 
(
	[NDC_UPC_HRI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[M25GPPC_2]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[M25GPPC_2](
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[Package_Size] [numeric](8, 3) NULL,
	[Package_Size_Unit_of_Measure] [varchar](2) NULL,
	[Package_Quantity] [numeric](37, 0) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Package_Description_Code] [varchar](2) NULL,
	[Generic_Product_Identifier] [varchar](14) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](8) NULL,
	[Reserve] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AetnaNADAC]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AetnaNADAC](
	[NCPDP] [nvarchar](50) NULL,
	[Store Name] [nvarchar](200) NULL,
	[State] [nvarchar](50) NULL,
	[GPI] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Drug Type] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](200) NULL,
	[Pkg Size] [nvarchar](50) NULL,
	[Day Supply] [nvarchar](50) NULL,
	[AWP Discount] [nvarchar](50) NULL,
	[DF] [nvarchar](50) NULL,
	[Profit Script] [nvarchar](50) NULL,
	[GM%] [nvarchar](50) NULL,
	[Plan Name] [nvarchar](200) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[Rx Date] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[DAW Desc] [nvarchar](200) NULL,
	[U and C] [nvarchar](50) NULL,
	[FDB AWP] [nvarchar](50) NULL,
	[CoPay] [nvarchar](50) NULL,
	[Cost Submitted] [nvarchar](50) NULL,
	[Cost Paid] [nvarchar](50) NULL,
	[Qty Dispensed] [nvarchar](50) NULL,
	[MacPrice-Generics] [nvarchar](50) NULL,
	[Acquistion Cost] [nvarchar](50) NULL,
	[Total Paid Per Unit] [nvarchar](50) NULL,
	[TotalAcquisitionCost] [nvarchar](50) NULL,
	[Total Paid(Inc DF)] [nvarchar](50) NULL,
	[Profit Loss Unit] [nvarchar](50) NULL,
	[ReimbID] [nvarchar](50) NULL,
	[Column 34] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AWP]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AWP](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[AWP_Indicator_Code] [varchar](1) NULL,
	[AWP_Package_Price] [numeric](10, 2) NULL,
	[AWP_Unit_Price] [numeric](13, 5) NULL,
	[AWP_Effective_Date] [smalldatetime] NULL,
	[Older_AWP_Package_Price] [numeric](10, 2) NULL,
	[Older_AWP_Unit_Price] [numeric](13, 5) NULL,
	[Older_AWP_Effective_Date] [smalldatetime] NULL,
	[Reserve] [varchar](16) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CMS_NADAC]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CMS_NADAC](
	[NDC_Description] [varchar](100) NULL,
	[NDC] [char](11) NULL,
	[NADAC_per_unit] [float] NULL,
	[effective_date] [smalldatetime] NULL,
	[pricing_unit] [char](4) NULL,
	[pharmachy_type_indicator] [varchar](3) NULL,
	[OTC] [char](2) NULL,
	[ExplanationCode] [varchar](10) NULL,
	[classification_for_rate_setting] [char](2) NULL,
	[Corresponding_generic_drug_nadac_per_unit] [float] NULL,
	[corresponding_generic_drug_effective_date] [smalldatetime] NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DosageItems]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DosageItems](
	[API#] [nvarchar](50) NULL,
	[Item] [nvarchar](50) NULL,
	[Description2] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[Strength] [varchar](25) NULL,
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
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[GPPC] [varchar](25) NULL,
	[NDC_10] [varchar](11) NULL,
	[IDCODE] [varchar](1) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[PackageQuantity] [numeric](37, 0) NULL,
 CONSTRAINT [CPK_DrugMaster] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster_20171020]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_20171020](
	[NDC] [varchar](11) NOT NULL,
	[GPI] [nvarchar](14) NULL,
	[DrugName] [nvarchar](30) NULL,
	[MFG] [nvarchar](30) NULL,
	[DrugType] [varchar](50) NULL,
	[DrugTypeShort] [varchar](3) NULL,
	[Unit] [nvarchar](2) NULL,
	[Form] [nvarchar](4) NULL,
	[PS] [decimal](10, 3) NULL,
	[PD] [varchar](50) NULL,
	[RxOTC] [varchar](3) NULL,
	[Repack] [nvarchar](1) NULL,
	[GPIDesc] [nvarchar](60) NULL,
	[Strength] [nvarchar](15) NULL,
	[Strength_Unit_of_Measure] [nvarchar](10) NULL,
	[OBSDTEC] [int] NULL,
	[DEA] [nvarchar](1) NULL,
	[WACPkg] [decimal](18, 5) NULL,
	[WAC] [decimal](18, 5) NULL,
	[WACEffDate] [decimal](19, 0) NULL,
	[AWPPkg] [real] NULL,
	[AWP] [real] NULL,
	[BBDC] [decimal](19, 0) NULL,
	[MSC] [nvarchar](1) NULL,
	[BNC] [nvarchar](1) NULL,
	[CSP] [int] NULL,
	[DESI] [nvarchar](1) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[RouteAdmin] [nvarchar](2) NULL,
	[RX_OTC_Indicator_Code] [nvarchar](1) NULL,
	[Unit_DoseUnit_of_Use_Package] [nvarchar](1) NULL,
	[AHFSCC_Therapeutic_Class_Code] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster_20200626]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_20200626](
	[RowID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster_backup_20200428]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_backup_20200428](
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
	[Strength] [varchar](25) NULL,
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
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[GPPC] [varchar](25) NULL,
	[NDC_10] [varchar](11) NULL,
	[IDCODE] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster_Import]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_Import](
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
/****** Object:  Table [dbo].[DrugMaster_Old_20170824]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_Old_20170824](
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
/****** Object:  Table [dbo].[DrugMaster_old_20200623]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_old_20200623](
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
	[Strength] [varchar](25) NULL,
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
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[GPPC] [varchar](25) NULL,
	[NDC_10] [varchar](11) NULL,
	[IDCODE] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrugMaster2]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[GPPC] [varchar](8) NULL,
 CONSTRAINT [CPK_DrugMaster2] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_A]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL,
 CONSTRAINT [PK_NDC] PRIMARY KEY CLUSTERED 
(
	[NDC_UPC_HRI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_A_A]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A_A](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_A_Import]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A_Import](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL,
 CONSTRAINT [PK_NDC_Old] PRIMARY KEY CLUSTERED 
(
	[NDC_UPC_HRI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_A_Import_20170824]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A_Import_20170824](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_A_Old]    Script Date: 12/22/2020 2:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A_Old](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL,
 CONSTRAINT [PK_NDC_Old2] PRIMARY KEY CLUSTERED 
(
	[NDC_UPC_HRI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_A_Old_20170824]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A_Old_20170824](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_C]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_C](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Old_NDC_UPC_HRI] [varchar](11) NULL,
	[Reserve_1] [varchar](1) NULL,
	[Old_Formatted_Id_Number] [varchar](13) NULL,
	[Old_Eff_Date] [varchar](5) NULL,
	[New_NDC_UPC_HRI] [varchar](11) NULL,
	[Reserve_2] [varchar](1) NULL,
	[New_Formatted_Id_Number] [varchar](13) NULL,
	[New_Eff_Date] [varchar](5) NULL,
	[Reserve_3] [varchar](19) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_E]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_E](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Product_Name] [varchar](25) NULL,
	[Product_Name_Extension] [varchar](35) NULL,
	[Reserve_1] [varchar](8) NULL,
	[Allergy_Pattern_Code] [numeric](37, 0) NULL,
	[Reserve_2] [varchar](2) NULL,
	[PPG_Indicator_Code] [varchar](1) NULL,
	[HFPG_Indicator_Code] [varchar](1) NULL,
	[Labeler_Type_Code] [varchar](1) NULL,
	[Pricing_Spread_Code] [varchar](1) NULL,
	[Reserve_3] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_G]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_G](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Generic_Product_Identifier] [varchar](14) NULL,
	[Reserve] [varchar](5) NULL,
	[GPI_Generic_Name] [varchar](60) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_J]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_J](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Manufacturers_Labeler_Name] [varchar](30) NULL,
	[Manufacturers_Abbreviated_Na] [varchar](10) NULL,
	[Product_Description_Abbreviat] [varchar](25) NULL,
	[Drug_Name_Code] [varchar](6) NULL,
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_L]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_L](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve_1] [varchar](23) NULL,
	[Dosage_Form] [varchar](4) NULL,
	[Package_Size] [numeric](8, 3) NULL,
	[Package_Size_Unit_of_Measure] [varchar](2) NULL,
	[Package_Quantity] [numeric](37, 0) NULL,
	[Repackage_Code] [varchar](1) NULL,
	[Total_Package_Quantity] [numeric](12, 3) NULL,
	[DESI_Code] [varchar](1) NULL,
	[Package_Description] [varchar](10) NULL,
	[Reserve_2] [varchar](6) NULL,
	[Next_Smaller_NDC_Suffix_Numbe] [varchar](2) NULL,
	[Next_Larger_NDC_Suffix_Number] [varchar](2) NULL,
	[Innerpack_Code] [varchar](1) NULL,
	[Clinic_Pack_Code] [varchar](1) NULL,
	[Reserve_3] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_M]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_M](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Strength] [numeric](13, 5) NULL,
	[Strength_Unit_Measure] [varchar](11) NULL,
	[Limited_Dist_Code] [varchar](2) NULL,
	[Extended_AHFS_Thera_Class_Cod] [numeric](37, 0) NULL,
	[Inactive_Date] [smalldatetime] NULL,
	[Reserve] [varchar](37) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_P]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_P](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Ingredient_Generic_ID_Type_Co] [varchar](1) NULL,
	[Ingredient_Generic_ID_Number] [numeric](37, 0) NULL,
	[Ingredient_Strength] [numeric](13, 5) NULL,
	[Strength_Unit_Measure] [varchar](11) NULL,
	[Generic_Ingredient_Name] [varchar](40) NULL,
	[Active_Inactive_Ingredient_Fl] [varchar](1) NULL,
	[Reserve] [varchar](4) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_Q]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_Q](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve_1] [varchar](1) NULL,
	[WAC_Package_Price] [numeric](10, 2) NULL,
	[WAC_Unit_Price] [numeric](13, 5) NULL,
	[Effective_Date] [smalldatetime] NULL,
	[Older_WAC_Pkg_Price] [numeric](10, 2) NULL,
	[Older_WAC_Unit_Price] [numeric](13, 5) NULL,
	[Older_WAC_Eff_Date] [smalldatetime] NULL,
	[Reserve_2] [varchar](16) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_R]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_R](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[AWP_Indicator_Code] [varchar](1) NULL,
	[AWP_Package_Price] [numeric](10, 2) NULL,
	[AWP_Unit_Price] [numeric](13, 5) NULL,
	[AWP_Effective_Date] [smalldatetime] NULL,
	[Older_AWP_Package_Price] [numeric](10, 2) NULL,
	[Older_AWP_Unit_Price] [numeric](13, 5) NULL,
	[Older_AWP_Effective_Date] [smalldatetime] NULL,
	[Reserve] [varchar](16) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_S]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_S](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve_1] [varchar](1) NULL,
	[DP_Package_Price] [numeric](10, 2) NULL,
	[DP_Unit_Price] [numeric](13, 5) NULL,
	[DP_Effective_Date] [smalldatetime] NULL,
	[Older_DP_Package_Price] [numeric](10, 2) NULL,
	[Older_DP_Unit_Price] [numeric](13, 5) NULL,
	[Older_DP_Effective_Date] [smalldatetime] NULL,
	[Reserve_2] [varchar](16) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25_T]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_T](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve_1] [varchar](1) NULL,
	[CMS_FUL_Price] [numeric](13, 5) NULL,
	[CMS_FUL_Price_Eff_Date] [smalldatetime] NULL,
	[first_Oldest_CMS_FUL_Price] [numeric](13, 5) NULL,
	[first_Oldest_CMS_FUL_Eff_Dt] [numeric](37, 0) NULL,
	[second_Oldest_CMS_FUL_Price] [numeric](13, 5) NULL,
	[second_Oldest_CMS_FUL_Eff_Dt] [numeric](37, 0) NULL,
	[Reserve_2] [varchar](15) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25GPPC_2]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25GPPC_2](
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[Package_Size] [numeric](8, 3) NULL,
	[Package_Size_Unit_of_Measure] [varchar](2) NULL,
	[Package_Quantity] [numeric](37, 0) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Package_Description_Code] [varchar](2) NULL,
	[Generic_Product_Identifier] [varchar](14) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](8) NULL,
	[Reserve] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25GPRR_4]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25GPRR_4](
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[GPPC_Price_Code] [varchar](1) NULL,
	[GPPC_Unit_Price] [numeric](13, 5) NULL,
	[GPPC_Eff_Date] [smalldatetime] NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25MOD_1]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25MOD_1](
	[Modifier_Code] [varchar](6) NULL,
	[Modifier_Description] [varchar](25) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](8) NULL,
	[Reserve] [varchar](24) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25NMOD_3]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25NMOD_3](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[Reserve_1] [varchar](1) NULL,
	[Modifier_Code] [varchar](6) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](8) NULL,
	[Reserve_2] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25TCRF_5]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25TCRF_5](
	[Therapeutic_Classification_Co] [varchar](10) NULL,
	[Reserve_1] [varchar](4) NULL,
	[Record_Type_Code] [varchar](1) NULL,
	[TC_GPI_Name] [varchar](60) NULL,
	[Reserve_2] [varchar](19) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M25VAL_Z]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25VAL_Z](
	[Field_Identifier] [varchar](4) NULL,
	[Field_Value] [varchar](15) NULL,
	[Language_Code] [numeric](37, 0) NULL,
	[Value_Description] [varchar](40) NULL,
	[Value_Abbreviation] [varchar](15) NULL,
	[Reserve] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nadacload]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nadacload](
	[NDC_Description] [varchar](100) NULL,
	[NDC] [char](11) NULL,
	[NADAC_per_unit] [float] NULL,
	[effective_date] [smalldatetime] NULL,
	[pricing_unit] [char](4) NULL,
	[pharmachy_type_indicator] [varchar](3) NULL,
	[OTC] [char](2) NULL,
	[ExplanationCode] [varchar](10) NULL,
	[classification_for_rate_setting] [nvarchar](10) NULL,
	[Corresponding_generic_drug_nadac_per_unit] [float] NULL,
	[corresponding_generic_drug_effective_date] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NADACPrice]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NADACPrice](
	[NDC Description] [nvarchar](200) NULL,
	[NDC] [nvarchar](50) NULL,
	["NADAC Per Unit"] [nvarchar](50) NULL,
	["Effective Date"] [nvarchar](50) NULL,
	["Pricing Unit"] [nvarchar](50) NULL,
	["Pharmacy Type Indicator"] [nvarchar](50) NULL,
	[OTC] [nvarchar](50) NULL,
	["Explanation Code"] [nvarchar](50) NULL,
	["Classification for Rate Setting"] [nvarchar](50) NULL,
	["Corresponding Generic Drug NADAC Per Unit"] [nvarchar](50) NULL,
	["Corresponding Generic Drug Effective Date"] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WAClistforIPA]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WAClistforIPA](
	[Drug Name ] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[CAH Price] [nvarchar](50) NULL,
	[WAC] [nvarchar](50) NULL,
	[WAC disc] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Net Bill list] [nvarchar](50) NULL,
	[Notes] [nvarchar](50) NULL,
	[Column 10] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[DrugMaster]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DrugMaster](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[Strength] [varchar](25) NULL,
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
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[GPPC] [varchar](25) NULL,
	[NDC_10] [varchar](11) NULL,
	[IDCODE] [varchar](1) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[PackageQuantity] [numeric](37, 0) NULL,
 CONSTRAINT [CPK_Staging_DrugMaster] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[M25_A]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[M25_A](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL,
 CONSTRAINT [PK_NDC] PRIMARY KEY CLUSTERED 
(
	[NDC_UPC_HRI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[M25GPPC_2]    Script Date: 12/22/2020 2:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[M25GPPC_2](
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[Package_Size] [numeric](8, 3) NULL,
	[Package_Size_Unit_of_Measure] [varchar](2) NULL,
	[Package_Quantity] [numeric](37, 0) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Package_Description_Code] [varchar](2) NULL,
	[Generic_Product_Identifier] [varchar](14) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](8) NULL,
	[Reserve] [varchar](15) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[DrugMaster] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[DrugMaster] ADD  DEFAULT ('N\A') FOR [DEA_Class_Code]
GO
ALTER TABLE [dbo].[DrugMaster] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[DrugMaster_old_20200623] ADD  DEFAULT ('N\A') FOR [DEA_Class_Code]
GO
ALTER TABLE [Staging].[DrugMaster] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
