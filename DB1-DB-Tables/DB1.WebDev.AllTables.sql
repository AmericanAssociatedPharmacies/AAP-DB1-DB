USE [WebDev]
GO
/****** Object:  Table [dbo].[AAPCache]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPCache](
	[Id] [nvarchar](449) NOT NULL,
	[Value] [varbinary](max) NOT NULL,
	[ExpiresAtTime] [datetimeoffset](7) NOT NULL,
	[SlidingExpirationInSeconds] [bigint] NULL,
	[AbsoluteExpiration] [datetimeoffset](7) NULL,
 CONSTRAINT [pk_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPLogs]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](128) NULL,
	[TimeStamp] [datetimeoffset](7) NOT NULL,
	[Exception] [nvarchar](max) NULL,
	[Properties] [xml] NULL,
	[LogEvent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminFunctions]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminFunctions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](100) NULL,
	[FunctionName] [varchar](100) NOT NULL,
	[Description] [varchar](255) NULL,
	[Functiontype] [varchar](50) NULL,
	[Location] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminFunctionUsers]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminFunctionUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[functionid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisementLocations]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementLocations](
	[advertisementLocationID] [int] IDENTITY(1,1) NOT NULL,
	[location] [varchar](64) NOT NULL,
 CONSTRAINT [PK__Advertis__0B5CE25CE572B0FC] PRIMARY KEY CLUSTERED 
(
	[advertisementLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[advertisementID] [int] IDENTITY(1,1) NOT NULL,
	[advertisementLocationID] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[content] [text] NOT NULL,
	[isActive] [bit] NOT NULL,
	[name] [varchar](64) NULL,
 CONSTRAINT [PK__Advertis__4729E91504D0271E] PRIMARY KEY CLUSTERED 
(
	[advertisementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AGAuditTopPlanweb]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGAuditTopPlanweb](
	[PharmID] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[BillCode] [nvarchar](50) NULL,
	[PlanName] [nvarchar](50) NULL,
	[ClaimCount] [int] NULL,
	[Generic] [numeric](18, 2) NULL,
	[ControlledSub] [numeric](18, 2) NULL,
	[DAW1] [numeric](18, 2) NULL,
	[AvgDaySup] [numeric](18, 2) NULL,
	[AvgPaidPer] [numeric](18, 2) NULL,
	[Refills] [numeric](18, 2) NULL,
	[Reversals] [numeric](18, 2) NULL,
	[Compound] [numeric](18, 2) NULL,
	[DAW2] [numeric](18, 2) NULL,
	[DAWMSB] [numeric](18, 4) NULL,
	[DAWSSB] [numeric](18, 4) NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_SalesMTD]    Script Date: 12/22/2020 3:51:25 AM ******/
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
/****** Object:  Table [dbo].[APISalesDetail_Web]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Web](
	[WHAccountid] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC] [varchar](11) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Web_bkp_20201023]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Web_bkp_20201023](
	[WHAccountid] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC] [varchar](11) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesDetail_Web_New]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Web_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountid] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC] [varchar](11) NULL,
	[RowVersionID] [timestamp] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesInvoice_Web]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_Web](
	[WHAccountid] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[CarrierCode] [varchar](15) NULL,
	[CarrierDesc] [varchar](255) NULL,
	[Whsnum] [varchar](2) NULL,
	[Whsname] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesInvoice_Web_backup_RSE_20200825]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_Web_backup_RSE_20200825](
	[WHAccountid] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[CarrierCode] [varchar](15) NULL,
	[CarrierDesc] [varchar](255) NULL,
	[Whsnum] [varchar](2) NULL,
	[Whsname] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APISalesInvoice_Web_New]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesInvoice_Web_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountid] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[CarrierCode] [varchar](15) NULL,
	[CarrierDesc] [varchar](255) NULL,
	[Whsnum] [varchar](2) NULL,
	[Whsname] [varchar](10) NOT NULL,
	[RowVersionID] [timestamp] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticlePositions]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticlePositions](
	[ArticlePositionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_ArticlePosition] PRIMARY KEY CLUSTERED 
(
	[ArticlePositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleStatus]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ArticleStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attestation]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attestation](
	[PMID] [int] NOT NULL,
	[AttestationForYear] [int] NOT NULL,
	[HasFlag] [varchar](1) NOT NULL,
	[Licenses suspended] [nvarchar](500) NULL,
	[Operate on Clear status] [nvarchar](500) NULL,
	[Licenses suspended in past] [nvarchar](500) NULL,
	[Disciplinary action] [nvarchar](500) NULL,
	[Pharmacist not covered Insurance] [nvarchar](500) NULL,
	[Pharmacists unrestricted license] [nvarchar](500) NULL,
	[PharmacyNotExcluded] [nvarchar](500) NULL,
	[PersonnelNotExcluded] [nvarchar](500) NULL,
	[Review Personnel on OIG GSA] [nvarchar](500) NULL,
	[Disclosure of disciplinary actions] [nvarchar](500) NULL,
	[RecordRetention10yr] [nvarchar](500) NULL,
	[FWATraining] [nvarchar](500) NULL,
	[LogPersonnelFWATraining] [nvarchar](500) NULL,
	[PharmacyMaintainsLicensesInsurance] [nvarchar](500) NULL,
	[PersonnelMaintainsLicensesCertifications] [nvarchar](500) NULL,
	[StandardsOfConductInWriting] [nvarchar](500) NULL,
	[Conflict of Interest Policy] [nvarchar](500) NULL,
	[DesignatedComplianceOfficer] [nvarchar](500) NULL,
	[ProceduresToDetectFWA] [nvarchar](500) NULL,
	[OBRA 90 rules compliance] [nvarchar](500) NULL,
	[NCPDP] [nvarchar](500) NULL,
	[Pharmacy Name] [nvarchar](500) NULL,
	[NPI] [nvarchar](500) NULL,
	[Person Attesting] [nvarchar](500) NULL,
	[Compliance Officer name] [nvarchar](500) NULL,
	[Attestation Date] [nvarchar](500) NULL,
 CONSTRAINT [PK_Attestation] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[AttestationForYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auth_User]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_User](
	[USER_ID] [varchar](32) NULL,
	[USERNAME] [varchar](32) NULL,
	[PASSWORD] [varchar](32) NULL,
	[PERMS] [varchar](255) NULL,
	[OPT_IN] [bit] NULL,
	[OPT_IN2] [bit] NULL,
	[MANAGED_CARE] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessAnalysisCalculator]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessAnalysisCalculator](
	[CalculatorID] [int] IDENTITY(1,1) NOT NULL,
	[TotalBrandSpend] [decimal](18, 4) NOT NULL,
	[CogDiscountPercentage] [decimal](18, 4) NOT NULL,
	[AdditionalBrandCogBrandDiscountReceived] [bit] NOT NULL,
	[AdditionalBrandCogBrandDiscountPercentage] [decimal](18, 4) NULL,
	[BrandPurchasedDiscountRate] [bit] NOT NULL,
	[BrandPurchasedDiscountAmount] [decimal](18, 4) NULL,
	[BrandPurchasedDiscountPercentage] [decimal](18, 4) NULL,
	[purchaseAgreementCompliance] [bit] NULL,
	[GenericComplianceRatio] [bit] NOT NULL,
	[GenericBrandRatio] [bit] NOT NULL,
	[KnowRatioPercentage] [bit] NOT NULL,
	[RatioPercentage] [decimal](18, 4) NULL,
	[TiedCogToBrandRxPurchaseRate] [bit] NOT NULL,
	[CogToBrandRxPurchasePercentage] [decimal](18, 4) NULL,
	[BrandToPurchseOfStores] [bit] NOT NULL,
	[BrandToPurchseOfStoresGroup] [nvarchar](200) NULL,
	[AverageTotalMonthlyGenericRxSpend] [decimal](18, 4) NOT NULL,
	[AverageTotalMonthlyGenericRebatePercentage] [decimal](18, 4) NOT NULL,
	[AverageMonthlyGenericRebateReceived] [decimal](18, 4) NOT NULL,
	[MonthlyGenericRxNotEarnRebates] [decimal](18, 4) NOT NULL,
	[GenericRebateToGPR] [bit] NOT NULL,
	[GenericRebateToGPRPercentage] [decimal](18, 4) NULL,
	[PrimeVendorOrPurchaseContract] [bit] NOT NULL,
	[WholesalerPaymentTerms] [varchar](50) NOT NULL,
	[CalBRxCostofInventory] [decimal](18, 4) NOT NULL,
	[CalOtherBRxCostofInventory] [decimal](18, 4) NOT NULL,
	[CalTotalBRxCostofInventory] [decimal](18, 4) NOT NULL,
	[CalRebate] [decimal](18, 4) NOT NULL,
	[CalTotalGRxCostofInventory] [decimal](18, 4) NOT NULL,
	[CalGenericComplianceRatioGCR] [decimal](18, 4) NOT NULL,
	[CalGenericToBrandRatioGBR] [decimal](18, 4) NOT NULL,
	[CalCostofRxInventory] [decimal](18, 4) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[PharmacyName] [varchar](100) NOT NULL,
	[PrimeVendorWholesaler] [varchar](100) NULL,
	[PrimeVendorContractExpireDate] [nvarchar](50) NULL,
	[PrimeVendorUpfrontCash] [decimal](18, 4) NULL,
	[MultiStoreOperation] [bit] NOT NULL,
	[NumberOfMultiStoreOperation] [int] NULL,
 CONSTRAINT [PK__tmp_ms_x__C70B25BA20494AC0] PRIMARY KEY CLUSTERED 
(
	[CalculatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_CheckResultsHistory]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_CheckResultsHistory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[IsOIGListed] [nvarchar](1) NOT NULL,
	[IsSAMListed] [nvarchar](1) NOT NULL,
	[CheckedBy] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CA_CheckResultsHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_EmployeeNameType]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_EmployeeNameType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNameType] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CA_EmployeeNameType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_EmployeeType]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_EmployeeType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeType] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CA_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_OIG]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_OIG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[BUSNAME] [nvarchar](64) NULL,
	[GENERAL] [nvarchar](64) NULL,
	[SPECIALTY] [nvarchar](64) NULL,
	[UPIN] [nvarchar](64) NULL,
	[NPI] [nvarchar](64) NULL,
	[DOB] [nvarchar](64) NULL,
	[ADDRESS] [nvarchar](64) NULL,
	[CITY] [nvarchar](64) NULL,
	[STATE] [nvarchar](64) NULL,
	[ZIP] [nvarchar](64) NULL,
	[EXCLTYPE] [nvarchar](64) NULL,
	[EXCLDATE] [nvarchar](64) NULL,
	[REINDATE] [nvarchar](64) NULL,
	[WAIVERDATE] [nvarchar](64) NULL,
	[WVRSTATE] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_CA_OIG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_OIG_TEMP]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_OIG_TEMP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[BUSNAME] [nvarchar](64) NULL,
	[GENERAL] [nvarchar](64) NULL,
	[SPECIALTY] [nvarchar](64) NULL,
	[UPIN] [nvarchar](64) NULL,
	[NPI] [nvarchar](64) NULL,
	[DOB] [nvarchar](64) NULL,
	[ADDRESS] [nvarchar](64) NULL,
	[CITY] [nvarchar](64) NULL,
	[STATE] [nvarchar](64) NULL,
	[ZIP] [nvarchar](64) NULL,
	[EXCLTYPE] [nvarchar](64) NULL,
	[EXCLDATE] [nvarchar](64) NULL,
	[REINDATE] [nvarchar](64) NULL,
	[WAIVERDATE] [nvarchar](64) NULL,
	[WVRSTATE] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_CA_OIG_TEMP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_ReportEmailedStatus]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_ReportEmailedStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PMID] [bigint] NULL,
	[NCPDP] [nvarchar](7) NULL,
	[AccountName] [nvarchar](max) NULL,
	[ReportType] [int] NULL,
	[IsReportGenerated] [int] NULL,
	[Email] [nvarchar](max) NULL,
	[IsEmailed] [int] NULL,
	[IsSuccess] [int] NULL,
	[IsValidEmail] [int] NULL,
	[DateCreated] [datetime] NULL,
	[FileName] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
 CONSTRAINT [PK_CA_ReportEmailedStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_ReportType]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CA_ReportType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_SAM]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_SAM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Classification] [nvarchar](64) NULL,
	[Name] [nvarchar](max) NULL,
	[Prefix] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[Suffix] [nvarchar](64) NULL,
	[Address1] [nvarchar](256) NULL,
	[Address2] [nvarchar](256) NULL,
	[Address3] [nvarchar](256) NULL,
	[Address4] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[StateOrProvince] [nvarchar](128) NULL,
	[Country] [nvarchar](64) NULL,
	[ZipCode] [nvarchar](64) NULL,
	[DUNS] [nvarchar](64) NULL,
	[ExclusionProgram] [nvarchar](64) NULL,
	[ExcludingAgency] [nvarchar](64) NULL,
	[CTCode] [nvarchar](64) NULL,
	[ExclusionType] [nvarchar](64) NULL,
	[AdditionalComments] [nvarchar](max) NULL,
	[ActiveDate] [nvarchar](64) NULL,
	[TerminationDate] [nvarchar](64) NULL,
	[RecordStatus] [nvarchar](64) NULL,
	[CrossReference] [nvarchar](max) NULL,
	[SAMNumber] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CAGE] [nvarchar](256) NULL,
	[NPI] [nvarchar](64) NULL,
 CONSTRAINT [PK_CA_SAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_SAM_TEMP]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_SAM_TEMP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Classification] [nvarchar](64) NULL,
	[Name] [nvarchar](max) NULL,
	[Prefix] [nvarchar](64) NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[Suffix] [nvarchar](64) NULL,
	[Address1] [nvarchar](256) NULL,
	[Address2] [nvarchar](256) NULL,
	[Address3] [nvarchar](256) NULL,
	[Address4] [nvarchar](256) NULL,
	[City] [nvarchar](256) NULL,
	[StateOrProvince] [nvarchar](128) NULL,
	[Country] [nvarchar](64) NULL,
	[ZipCode] [nvarchar](64) NULL,
	[DUNS] [nvarchar](64) NULL,
	[ExclusionProgram] [nvarchar](64) NULL,
	[ExcludingAgency] [nvarchar](64) NULL,
	[CTCode] [nvarchar](64) NULL,
	[ExclusionType] [nvarchar](64) NULL,
	[AdditionalComments] [nvarchar](max) NULL,
	[ActiveDate] [nvarchar](64) NULL,
	[TerminationDate] [nvarchar](64) NULL,
	[RecordStatus] [nvarchar](64) NULL,
	[CrossReference] [nvarchar](max) NULL,
	[SAMNumber] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CAGE] [nvarchar](256) NULL,
	[NPI] [nvarchar](64) NULL,
 CONSTRAINT [PK_CA_SAM_TEMP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_StoreEmployee]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_StoreEmployee](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](7) NOT NULL,
	[PMID] [int] NOT NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[InActiveDate] [datetime] NULL,
	[EmployeeNameType] [int] NULL,
	[EmployeeType] [int] NULL,
	[IsHIPPATrained] [int] NULL,
	[IsFWATrained] [int] NULL,
 CONSTRAINT [PK_CA_StoreEmployee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_StoreEmployee_TEMP]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_StoreEmployee_TEMP](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](7) NOT NULL,
	[PMID] [int] NOT NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[InActiveDate] [datetime] NULL,
	[EmployeeNameType] [int] NULL,
	[EmployeeType] [int] NULL,
	[IsHIPPATrained] [int] NULL,
	[IsFWATrained] [int] NULL,
	[IsOIGListed] [nvarchar](1) NULL,
	[IsSAMListed] [nvarchar](1) NULL,
 CONSTRAINT [PK_CA_StoreEmployee_TEMP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_StoreStatus]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_StoreStatus](
	[NCPDP] [nvarchar](7) NOT NULL,
	[CA_TaskID] [int] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_CA_StoreStatus] PRIMARY KEY CLUSTERED 
(
	[NCPDP] ASC,
	[CA_TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_Tasks]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_Tasks](
	[CA_TaskID] [int] IDENTITY(1,1) NOT NULL,
	[CATask] [varchar](max) NULL,
 CONSTRAINT [PK_CA_Tasks] PRIMARY KEY CLUSTERED 
(
	[CA_TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_Temp_ComplianceOfficerFromPRS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_Temp_ComplianceOfficerFromPRS](
	[NCPDP] [nvarchar](7) NULL,
	[Compliance Officer] [nvarchar](256) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CGAttestations]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CGAttestations](
	[CGAttestationID] [int] IDENTITY(1,1) NOT NULL,
	[PharmacyNotExcluded] [bit] NOT NULL,
	[PersonnelNotExcluded] [bit] NOT NULL,
	[RecordRetention10yr] [bit] NOT NULL,
	[FWATraining] [bit] NOT NULL,
	[LogPersonnelFWATraining] [bit] NOT NULL,
	[PharmacyMaintainsLicensesInsurance] [bit] NOT NULL,
	[PersonnelMaintainsLicensesCertifications] [bit] NOT NULL,
	[StandardsOfConductInWriting] [bit] NOT NULL,
	[DesignatedComplianceOfficer] [bit] NOT NULL,
	[ProceduresToDetectFWA] [bit] NOT NULL,
	[NCPDP] [nvarchar](50) NOT NULL,
	[NPI] [nvarchar](20) NOT NULL,
	[Attestor] [nvarchar](255) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ComplianceOfficer] [nvarchar](255) NOT NULL,
	[PharmacyName] [nvarchar](255) NOT NULL,
	[pmid] [int] NOT NULL,
	[email] [nvarchar](255) NULL,
 CONSTRAINT [PK_CGAttestations] PRIMARY KEY CLUSTERED 
(
	[CGAttestationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checklist]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checklist](
	[NCPDP] [nchar](10) NULL,
	[RxID] [int] NULL,
	[RxID2] [int] NULL,
	[CatgID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChecklistCatg]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChecklistCatg](
	[CatgID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](200) NULL,
 CONSTRAINT [PK_ChecklistCatg] PRIMARY KEY CLUSTERED 
(
	[CatgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[claims_planbins]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[claims_planbins](
	[BIN] [nvarchar](50) NOT NULL,
	[PlanName] [nvarchar](200) NULL,
	[PlanKey] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[UPC] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyGoalsIII]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyGoalsIII](
	[Year ] [float] NULL,
	[Month ] [float] NULL,
	[Count ] [float] NULL,
	[RowID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compounding]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compounding](
	[PMID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](500) NULL,
	[C1] [nvarchar](500) NULL,
	[C2] [nvarchar](500) NULL,
	[C3] [nvarchar](500) NULL,
	[C4] [nvarchar](500) NULL,
	[C5] [nvarchar](500) NULL,
	[C6] [nvarchar](500) NULL,
	[C7] [nvarchar](500) NULL,
	[C8] [nvarchar](500) NULL,
	[C9] [nvarchar](500) NULL,
	[C10] [nvarchar](500) NULL,
	[C11] [nvarchar](500) NULL,
	[C12] [nvarchar](500) NULL,
	[C13] [nvarchar](500) NULL,
	[C14] [nvarchar](500) NULL,
	[C15] [nvarchar](500) NULL,
	[C16] [nvarchar](500) NULL,
	[C17] [nvarchar](500) NULL,
	[C18] [nvarchar](500) NULL,
	[C19] [nvarchar](500) NULL,
	[C20] [nvarchar](500) NULL,
	[C21] [nvarchar](500) NULL,
	[C22] [nvarchar](500) NULL,
	[C23] [nvarchar](500) NULL,
	[C24] [nvarchar](500) NULL,
	[C25] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompoundingAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompoundingAll](
	[PMID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](500) NULL,
	[C1] [nvarchar](500) NULL,
	[C2] [nvarchar](500) NULL,
	[C3] [nvarchar](500) NULL,
	[C4] [nvarchar](500) NULL,
	[C5] [nvarchar](500) NULL,
	[C6] [nvarchar](500) NULL,
	[C7] [nvarchar](500) NULL,
	[C8] [nvarchar](500) NULL,
	[C9] [nvarchar](500) NULL,
	[C10] [nvarchar](500) NULL,
	[C11] [nvarchar](500) NULL,
	[C12] [nvarchar](500) NULL,
	[C13] [nvarchar](500) NULL,
	[C14] [nvarchar](500) NULL,
	[C15] [nvarchar](500) NULL,
	[C16] [nvarchar](500) NULL,
	[C17] [nvarchar](500) NULL,
	[C18] [nvarchar](500) NULL,
	[C19] [nvarchar](500) NULL,
	[C20] [nvarchar](500) NULL,
	[C21] [nvarchar](500) NULL,
	[C22] [nvarchar](500) NULL,
	[C23] [nvarchar](500) NULL,
	[C24] [nvarchar](500) NULL,
	[C25] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompoundingAll-1]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompoundingAll-1](
	[PMID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](500) NULL,
	[C1] [nvarchar](500) NULL,
	[C2] [nvarchar](500) NULL,
	[C3] [nvarchar](500) NULL,
	[C4] [nvarchar](500) NULL,
	[C5] [nvarchar](500) NULL,
	[C6] [nvarchar](500) NULL,
	[C7] [nvarchar](500) NULL,
	[C8] [nvarchar](500) NULL,
	[C9] [nvarchar](500) NULL,
	[C10] [nvarchar](500) NULL,
	[C11] [nvarchar](500) NULL,
	[C12] [nvarchar](500) NULL,
	[C13] [nvarchar](500) NULL,
	[C14] [nvarchar](500) NULL,
	[C15] [nvarchar](500) NULL,
	[C16] [nvarchar](500) NULL,
	[C17] [nvarchar](500) NULL,
	[C18] [nvarchar](500) NULL,
	[C19] [nvarchar](500) NULL,
	[C20] [nvarchar](500) NULL,
	[C21] [nvarchar](500) NULL,
	[C22] [nvarchar](500) NULL,
	[C23] [nvarchar](500) NULL,
	[C24] [nvarchar](500) NULL,
	[C25] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompoundingS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompoundingS](
	[PMID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](max) NULL,
	[C1] [nvarchar](max) NULL,
	[C2] [nvarchar](max) NULL,
	[C3] [nvarchar](max) NULL,
	[C4] [nvarchar](max) NULL,
	[C5] [nvarchar](max) NULL,
	[C6] [nvarchar](max) NULL,
	[C7] [nvarchar](max) NULL,
	[C8] [nvarchar](max) NULL,
	[C9] [nvarchar](max) NULL,
	[C10] [nvarchar](max) NULL,
	[C11] [nvarchar](max) NULL,
	[C12] [nvarchar](max) NULL,
	[C13] [nvarchar](max) NULL,
	[C14] [nvarchar](max) NULL,
	[C15] [nvarchar](max) NULL,
	[C16] [nvarchar](max) NULL,
	[C17] [nvarchar](max) NULL,
	[C18] [nvarchar](max) NULL,
	[C19] [nvarchar](max) NULL,
	[C20] [nvarchar](max) NULL,
	[C21] [nvarchar](max) NULL,
	[C22] [nvarchar](max) NULL,
	[C23] [nvarchar](max) NULL,
	[C24] [nvarchar](max) NULL,
	[C25] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactMobileInfo]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMobileInfo](
	[pmid] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mobilenumber] [nvarchar](50) NULL,
	[cancontactmobile] [int] NULL,
	[periodicfaxes] [int] NULL,
 CONSTRAINT [PK_ContactMobileInfo] PRIMARY KEY CLUSTERED 
(
	[pmid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_banners_homepage]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_banners_homepage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](255) NOT NULL,
	[linkURL] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[externalLink] [tinyint] NULL,
	[dateAdded] [datetime] NULL,
	[dateExpires] [datetime] NULL,
	[sortorder] [int] NULL,
	[dateStartDisplay] [datetime] NULL,
 CONSTRAINT [PK_content_banners_homepage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_banners_homepage_011215]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_banners_homepage_011215](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](255) NOT NULL,
	[linkURL] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[externalLink] [tinyint] NULL,
	[dateAdded] [datetime] NULL,
	[dateExpires] [datetime] NULL,
	[sortorder] [int] NULL,
	[dateStartDisplay] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_banners_homepage_121213]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_banners_homepage_121213](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](255) NOT NULL,
	[linkURL] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[externalLink] [tinyint] NULL,
	[dateAdded] [datetime] NULL,
	[dateExpires] [datetime] NULL,
	[sortorder] [int] NULL,
	[dateStartDisplay] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_banners_homepage_122216]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_banners_homepage_122216](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](255) NOT NULL,
	[linkURL] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[externalLink] [tinyint] NULL,
	[dateAdded] [datetime] NULL,
	[dateExpires] [datetime] NULL,
	[sortorder] [int] NULL,
	[dateStartDisplay] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_banners_homepage_20141125]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_banners_homepage_20141125](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](255) NOT NULL,
	[linkURL] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[externalLink] [tinyint] NULL,
	[dateAdded] [datetime] NULL,
	[dateExpires] [datetime] NULL,
	[sortorder] [int] NULL,
	[dateStartDisplay] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content_strings]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_strings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](50) NOT NULL,
	[item] [varchar](255) NOT NULL,
	[value] [varchar](255) NULL,
	[modified_date] [datetime] NULL,
	[modified_by] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CredentialDocumentList]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialDocumentList](
	[docid] [int] IDENTITY(1,1) NOT NULL,
	[docdesc] [nvarchar](max) NULL,
	[category] [varchar](100) NULL,
	[questionid] [nvarchar](50) NULL,
 CONSTRAINT [PK_Survey_Docs] PRIMARY KEY CLUSTERED 
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CredentialDocumentTracking]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredentialDocumentTracking](
	[docdetid] [int] IDENTITY(1,1) NOT NULL,
	[docid] [int] NULL,
	[pmid] [nvarchar](50) NULL,
	[filename] [nvarchar](max) NULL,
	[send] [int] NULL,
	[doctype] [nvarchar](50) NULL,
	[uploadedby] [nvarchar](50) NULL,
	[uploadedon] [smalldatetime] NULL,
 CONSTRAINT [PK_SurveyDocDet] PRIMARY KEY CLUSTERED 
(
	[docdetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CredMissingSSN]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredMissingSSN](
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [float] NULL,
	[PhcyName] [nvarchar](255) NULL,
	[EffDate] [datetime] NULL,
	[Re-Credentialing Status] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CredOutstanding]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CredOutstanding](
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [float] NULL,
	[PhcyName] [nvarchar](255) NULL,
	[EffDate] [datetime] NULL,
	[Re-Credentialing Status] [nvarchar](255) NULL,
	[On-Line] [nvarchar](255) NULL,
	[Detail] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVSMissingInfo]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSMissingInfo](
	[pmid] [int] NULL,
	[Note] [varchar](120) NOT NULL,
	[Section] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVSMissingInfoAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSMissingInfoAll](
	[pmid] [int] NULL,
	[Note] [varchar](120) NOT NULL,
	[Section] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVSMissingInfoS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSMissingInfoS](
	[pmid] [int] NULL,
	[Note] [varchar](120) NOT NULL,
	[Section] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVSOutputStatus]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSOutputStatus](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[Phone] [varchar](50) NULL,
	[NCPDP] [varchar](20) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[territory] [varchar](4) NULL,
	[TM_Name] [varchar](71) NULL,
	[TM_Contact] [varchar](25) NULL,
	[MCEffectivedate] [varchar](30) NULL,
	[MCQuitdate] [varchar](30) NULL,
	[isMCnotNPP] [int] NOT NULL,
	[Need Credentialing] [varchar](3) NOT NULL,
	[Status] [varchar](1) NOT NULL,
	[StatusUpdateOn] [datetime] NULL,
	[UDorNewAffiliate] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVSOutputStatusS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSOutputStatusS](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[Phone] [varchar](50) NULL,
	[NCPDP] [varchar](20) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[territory] [varchar](4) NULL,
	[TM_Name] [varchar](71) NULL,
	[TM_Contact] [varchar](25) NULL,
	[MCEffectivedate] [varchar](30) NULL,
	[MCQuitdate] [varchar](30) NULL,
	[isMCnotNPP] [int] NOT NULL,
	[Need Credentialing] [varchar](3) NOT NULL,
	[Status] [varchar](1) NOT NULL,
	[StatusUpdateOn] [datetime] NULL,
	[HQname] [varchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_BINReference]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_BINReference](
	[PLAN] [nvarchar](255) NULL,
	[ANSI BIN#] [nvarchar](255) NULL,
	[PCN] [nvarchar](255) NULL,
	[COMMERCIAL] [nvarchar](255) NULL,
	[MEDICARE D] [nvarchar](255) NULL,
	[HELP DESK PHONE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataGuardian_log]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataGuardian_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[dt] [datetime] NULL,
	[NCPDP] [varchar](15) NULL,
	[name] [varchar](255) NULL,
	[software] [varchar](255) NULL,
	[imagecapture] [int] NULL,
	[contact] [varchar](255) NULL,
	[contact_install] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[NPI] [varchar](15) NULL,
	[HipaaOfficer] [varchar](255) NULL,
	[AAPID] [int] NULL,
	[address] [varchar](255) NULL,
	[hours] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dataguardian_log_backup082814]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataguardian_log_backup082814](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[dt] [datetime] NULL,
	[NCPDP] [varchar](15) NULL,
	[name] [varchar](255) NULL,
	[software] [varchar](255) NULL,
	[imagecapture] [int] NULL,
	[contact] [varchar](255) NULL,
	[contact_install] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[NPI] [varchar](15) NULL,
	[HipaaOfficer] [varchar](255) NULL,
	[AAPID] [int] NULL,
	[address] [varchar](255) NULL,
	[hours] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB1_Count_20180827]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB1_Count_20180827](
	[APIItemNbr] [varchar](50) NULL,
	[C1] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCAllWeb]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCAllWeb](
	[Grp#] [varchar](5) NULL,
	[Disp Fee] [numeric](3, 2) NULL,
	[Reimbursement Indictor] [varchar](50) NOT NULL,
	[Brand] [varchar](9) NULL,
	[Non-MAC Generic] [varchar](10) NULL,
	[MAC] [varchar](65) NULL,
	[Unit Ing.Cost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCGroupsWeb]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCGroupsWeb](
	[Grp#] [varchar](5) NULL,
	[Disp Fee] [numeric](3, 2) NULL,
	[Reimbursement Indictor] [varchar](3) NOT NULL,
	[Brand] [varchar](9) NULL,
	[Non-MAC Generic] [varchar](10) NULL,
	[MAC] [varchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCNonMAC]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCNonMAC](
	[NDC] [varchar](11) NULL,
	[AWP] [numeric](13, 5) NULL,
	[DrugName] [varchar](25) NULL,
	[Reimbursement Indictor] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCPRiceRX05]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCPRiceRX05](
	[NDC] [varchar](11) NULL,
	[AWP] [numeric](13, 5) NULL,
	[DrugName] [varchar](25) NULL,
	[Reimbursement Indictor] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCPriceWeb]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCPriceWeb](
	[NDC] [varchar](11) NULL,
	[Drugname] [varchar](25) NULL,
	[Grp#] [varchar](5) NULL,
	[Disp Fee] [numeric](3, 2) NULL,
	[Unit Ing.Cost] [float] NULL,
	[Reimbursement Indictor] [varchar](3) NOT NULL,
	[Brand] [varchar](9) NULL,
	[Non-MAC Generic] [varchar](10) NULL,
	[MAC] [varchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DCUDIRX4]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DCUDIRX4](
	[NDC] [varchar](11) NULL,
	[AWP] [numeric](13, 5) NULL,
	[DrugName] [varchar](25) NULL,
	[Reimbursement Indictor] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_ESICred061715]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_ESICred061715](
	[CHAIN] [nvarchar](255) NULL,
	[Territory] [nvarchar](255) NULL,
	[Chain Code] [float] NULL,
	[AAP#] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[PHARMACY NAME] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[MembershipOwner] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Mailing Address] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_fairshare]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_fairshare](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [nvarchar](255) NULL,
	[Price] [money] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [nvarchar](255) NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[Expiration Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_plot]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_plot](
	[PMID] [int] NOT NULL,
	[Total_GB] [decimal](38, 2) NULL,
	[Total_C] [decimal](38, 2) NULL,
	[C2] [decimal](38, 2) NULL,
	[description] [varchar](135) NULL,
	[CTotalPct] [decimal](38, 6) NULL,
	[C2Pct] [decimal](38, 6) NULL,
	[isMCorNPP] [int] NULL,
	[isAPIOnly] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_RLGLreport]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_RLGLreport](
	[Date] [datetime] NULL,
	[Login] [nvarchar](50) NULL,
	[Logintype] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[Rx] [nvarchar](50) NULL,
	[RxDate] [nvarchar](50) NULL,
	[Result] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeleteUsers_LJ]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeleteUsers_LJ](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIR_Aetna_2015]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIR_Aetna_2015](
	[NCPDP] [nvarchar](50) NULL,
	[Plan PBM] [varchar](5) NOT NULL,
	[# of Claims] [int] NULL,
	[Per Claim] [varchar](4) NOT NULL,
	[Total] [numeric](14, 2) NULL,
	[Payment 1] [decimal](14, 2) NULL,
	[Payment 2] [varchar](30) NULL,
	[Payment 3] [varchar](30) NULL,
	[Payment 4] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_Aetna]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_Aetna](
	[InvoiceNumber] [nvarchar](50) NULL,
	[InvoiceDate] [nvarchar](50) NULL,
	[NetworkName] [nvarchar](50) NULL,
	[PharmacyNABP] [nvarchar](50) NULL,
	[CMSContract] [nvarchar](50) NULL,
	[CMSPBP] [nvarchar](50) NULL,
	[CardholderId] [nvarchar](50) NULL,
	[RxNumber] [nvarchar](50) NULL,
	[RefillNumber] [nvarchar](50) NULL,
	[DateFilled] [nvarchar](50) NULL,
	[QuantityDispensed] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[ProviderNPI] [nvarchar](50) NULL,
	[DAWIndicator] [nvarchar](50) NULL,
	[PricingSourceCode] [nvarchar](50) NULL,
	[ClaimNumber] [nvarchar](50) NULL,
	[GenericBrandIndication] [nvarchar](50) NULL,
	[DaysSupply] [nvarchar](50) NULL,
	[AverageWholesalePrice] [nvarchar](50) NULL,
	[IngredientCost] [nvarchar](50) NULL,
	[DispensingFeeAmount] [nvarchar](50) NULL,
	[ClaimSourceSystem] [nvarchar](50) NULL,
	[DIRAmount] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_CVSCaremark]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_CVSCaremark](
	[NCPDP] [nvarchar](50) NULL,
	[Pharmacy Name] [nvarchar](50) NULL,
	[Total DIR fee per Trimester] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_Envision]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_Envision](
	[NCPDP #] [nvarchar](50) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Net Claims Count] [nvarchar](50) NULL,
	[Generic Net Rx Count] [nvarchar](50) NULL,
	[GDR %] [nvarchar](50) NULL,
	[DIR Fee] [nvarchar](50) NULL,
	[DIR Fee Owed] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_ESIAnthem]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_ESIAnthem](
	[NABP] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[PharmacyName] [nvarchar](255) NULL,
	[CORPORATE_NAME] [nvarchar](50) NULL,
	[CHAIN_NUMBER] [nvarchar](50) NULL,
	[CORPORATE_ID] [nvarchar](50) NULL,
	[CARRIER_ID] [nvarchar](50) NULL,
	[Carrier_Name] [nvarchar](255) NULL,
	[TOTAL_CLAIMS] [nvarchar](50) NULL,
	[FEE_FOR_PAID_CLAIMS] [nvarchar](50) NULL,
	[TOTAL_FEE ] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
	[Owner] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[TM First] [nvarchar](50) NULL,
	[TM Last] [nvarchar](50) NULL,
	[TM#] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_ESIMedicare]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_ESIMedicare](
	[nabp_nbr] [nvarchar](50) NULL,
	[PHARMACY NAME] [nvarchar](255) NULL,
	[corporate_name] [nvarchar](255) NULL,
	[Carrier] [nvarchar](255) NULL,
	[year_quarter] [nvarchar](50) NULL,
	[year_mo] [nvarchar](50) NULL,
	[GDR] [nvarchar](50) NULL,
	[Total_Claims] [nvarchar](50) NULL,
	[DIRFee] [nvarchar](50) NULL,
	[DIR 1Q2016] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_MagellanRx]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_MagellanRx](
	[pharmacy_npi] [nvarchar](50) NULL,
	[pharmacy_ncpdp] [nvarchar](50) NULL,
	[STORE_NAME] [nvarchar](255) NULL,
	[PHARMACY_GRP_ID] [nvarchar](50) NULL,
	[PHARMACY_GRO_NAME] [nvarchar](255) NULL,
	[PANEL_ID] [nvarchar](50) NULL,
	[PANEL_NAME] [nvarchar](255) NULL,
	[I_RX_SERVICE_REF_NO] [nvarchar](50) NULL,
	[I_SERVICE_DT] [nvarchar](50) NULL,
	[ADJUD_DT] [nvarchar](50) NULL,
	[CLAIM_TYPE_CD] [nvarchar](50) NULL,
	[I_BIN] [nvarchar](50) NULL,
	[I_PROCESSOR_CTRL_NO] [nvarchar](50) NULL,
	[brand_gen] [nvarchar](50) NULL,
	[ADJ_GROUP_ID] [nvarchar](50) NULL,
	[DIR Fee] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRDetails_Prime]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRDetails_Prime](
	[Parent Code] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[RxNbr] [nvarchar](50) NULL,
	[Submit Cost] [nvarchar](50) NULL,
	[Conc Fee] [nvarchar](50) NULL,
	[Fill Date] [nvarchar](50) NULL,
	[NDC 1] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Client] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRFees_AetnaTrueUp]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRFees_AetnaTrueUp](
	[NetworkName] [nvarchar](255) NULL,
	[PharmacyNABP] [nvarchar](50) NULL,
	[CMSContract] [nvarchar](50) NULL,
	[CMSPBP] [nvarchar](50) NULL,
	[CardholderId] [nvarchar](50) NULL,
	[RxNumber] [nvarchar](50) NULL,
	[Refill Number] [nvarchar](50) NULL,
	[Date Filled] [nvarchar](50) NULL,
	[Quantity Dispensed] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Provider NPI] [nvarchar](50) NULL,
	[DAW Indicator] [nvarchar](50) NULL,
	[Pricing Source Code] [nvarchar](50) NULL,
	[Claim Number] [nvarchar](50) NULL,
	[Generic Brand Indication] [nvarchar](50) NULL,
	[Days Supply] [nvarchar](50) NULL,
	[AWP] [nvarchar](50) NULL,
	[Ingredient Cost] [nvarchar](50) NULL,
	[Dispensing Fee Amount] [nvarchar](50) NULL,
	[Claim Source System] [nvarchar](50) NULL,
	[DIR Amount] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRFees_AetnaTrueUp_6digitNCPDPs]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRFees_AetnaTrueUp_6digitNCPDPs](
	[NetworkName] [nvarchar](255) NULL,
	[PharmacyNABP] [nvarchar](50) NULL,
	[CMSContract] [nvarchar](50) NULL,
	[CMSPBP] [nvarchar](50) NULL,
	[CardholderId] [nvarchar](50) NULL,
	[RxNumber] [nvarchar](50) NULL,
	[Refill Number] [nvarchar](50) NULL,
	[Date Filled] [nvarchar](50) NULL,
	[Quantity Dispensed] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Provider NPI] [nvarchar](50) NULL,
	[DAW Indicator] [nvarchar](50) NULL,
	[Pricing Source Code] [nvarchar](50) NULL,
	[Claim Number] [nvarchar](50) NULL,
	[Generic Brand Indication] [nvarchar](50) NULL,
	[Days Supply] [nvarchar](50) NULL,
	[AWP] [nvarchar](50) NULL,
	[Ingredient Cost] [nvarchar](50) NULL,
	[Dispensing Fee Amount] [nvarchar](50) NULL,
	[Claim Source System] [nvarchar](50) NULL,
	[DIR Amount] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRFeesSummary]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRFeesSummary](
	[Plan PBM] [nvarchar](50) NULL,
	[# of Claims] [nvarchar](50) NULL,
	[Total DIR] [nvarchar](50) NULL,
	[DIR or Fee] [nvarchar](50) NULL,
	[Plans Included ] [nvarchar](50) NULL,
	[Program Info  Link] [nvarchar](255) NULL,
	[Collection Schedule] [nvarchar](255) NULL,
	[DIR Fee Basis per Qtr] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentAgreement]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentAgreement](
	[DocumentAgreementID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentAgreementTypeID] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[DateAcknowledged] [datetime2](7) NOT NULL,
	[LoggedInAs] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DocumentAgreement] PRIMARY KEY CLUSTERED 
(
	[DocumentAgreementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentAgreementType]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentAgreementType](
	[DocumentAgreementTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DocumentAgreementType] PRIMARY KEY CLUSTERED 
(
	[DocumentAgreementTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipp_Logins]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipp_Logins](
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[DistributionDate] [nvarchar](50) NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipp_UserList08212014]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipp_UserList08212014](
	[New Username] [nvarchar](50) NULL,
	[Initial Password] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[ProfDesignation] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Level of Access NPI] [nvarchar](50) NULL,
	[Start Date] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippRFOwner06202014]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippRFOwner06202014](
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Level of Access] [nvarchar](50) NULL,
	[EQuIPP Group ID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippRFUser06202014]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippRFUser06202014](
	[New Username] [nvarchar](50) NULL,
	[Initial Password] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[ProfDesignation] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Level of Access NPI] [nvarchar](50) NULL,
	[Notes] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ex_user_data]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ex_user_data](
	[loginid] [int] NOT NULL,
	[login] [nvarchar](50) NULL,
	[roleid] [int] NULL,
	[rolename] [nvarchar](100) NULL,
	[defaultpmid] [int] NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[perms] [varchar](255) NULL,
	[pmid] [int] NULL,
	[pmparentid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[ncpdp] [varchar](20) NULL,
	[dea] [varchar](50) NULL,
	[npi] [datetime] NULL,
	[statelicno] [varchar](50) NULL,
	[statelicexpdate] [varchar](30) NULL,
	[mcquitdate] [datetime] NULL,
	[accountname] [datetime] NULL,
	[corporatename] [varchar](65) NULL,
	[city] [varchar](100) NULL,
	[state] [varchar](50) NULL,
	[zip] [varchar](2) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[isAPI] [varchar](80) NULL,
	[isAAP] [int] NULL,
	[isMC] [int] NULL,
	[isTSROnly] [int] NULL,
	[isElite] [int] NULL,
	[parent_account] [int] NULL,
	[TMName] [varchar](65) NULL,
	[GenLiabCarrier] [varchar](71) NULL,
	[GenInsExpDate] [varchar](50) NULL,
	[ProfLiabCarrier] [varchar](10) NULL,
	[ProfLiabInsExpDate] [varchar](50) NULL,
	[description] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ex_user_programinfo]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ex_user_programinfo](
	[pmid] [int] NOT NULL,
	[programid] [int] NOT NULL,
	[description] [varchar](50) NULL,
	[isInProgram] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalLinksMaster]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalLinksMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LinkName] [nvarchar](50) NOT NULL,
	[RedirectLink] [nvarchar](255) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_ExternalLinksMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FairShare]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FairShare](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [float] NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [datetime] NULL,
	[NDC] [varchar](15) NULL,
	[Expiration Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fairshare_091415]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fairshare_091415](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [float] NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fairshare_121815]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fairshare_121815](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [float] NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fairshare_backup060915]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fairshare_backup060915](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [float] NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fairshare_Dates]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fairshare_Dates](
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ShipWeekOf] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fairshare_delete_tmp]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fairshare_delete_tmp](
	[CustNum] [nvarchar](255) NULL,
	[ProdNum] [nvarchar](255) NULL,
	[ProdDesc] [nvarchar](255) NULL,
	[Count] [float] NULL,
	[Price] [float] NULL,
	[Monthly Qty] [float] NULL,
	[Requested Qty] [nvarchar](255) NULL,
	[Start Date] [datetime] NULL,
	[End Date] [datetime] NULL,
	[Last Updated] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[Expiration Date] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FairShareProgram]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FairShareProgram](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustNum] [varchar](100) NOT NULL,
	[ProdNum] [varchar](100) NOT NULL,
	[ProdDesc] [nvarchar](255) NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[MonthlyQty] [int] NOT NULL,
	[RequestedQty] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[NDC] [varchar](15) NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ShipWeekOf] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[DateKey] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FairShareProgram] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_FairsharProgram] UNIQUE NONCLUSTERED 
(
	[CustNum] ASC,
	[ProdNum] ASC,
	[BeginDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FairShareProgram_20180627]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FairShareProgram_20180627](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustNum] [varchar](100) NOT NULL,
	[ProdNum] [varchar](100) NOT NULL,
	[ProdDesc] [nvarchar](255) NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[MonthlyQty] [int] NOT NULL,
	[RequestedQty] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[NDC] [varchar](15) NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ShipWeekOf] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[DateKey] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeaturedArticles]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturedArticles](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Content] [text] NULL,
	[Image] [varchar](128) NULL,
	[Thumbnail] [varchar](128) NULL,
	[StatusID] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
	[PublishDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[PartnerID] [varchar](128) NULL,
	[PageID] [int] NULL,
	[PositionID] [int] NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_FeaturedArticles] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeaturedMembers]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturedMembers](
	[FeaturedMemberID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [text] NULL,
	[MemberImage] [varchar](128) NULL,
	[MemberName] [varchar](128) NOT NULL,
	[StatusID] [int] NOT NULL,
	[PreviewContent] [text] NULL,
	[MemberCity] [varchar](64) NULL,
	[MemberState] [varchar](2) NULL,
	[PublishDate] [date] NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_FeaturedMembers] PRIMARY KEY CLUSTERED 
(
	[FeaturedMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fileDetails]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileDetails](
	[id] [varchar](40) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[file] [varchar](255) NULL,
	[sort] [varchar](50) NULL,
	[accessRestriction] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[directory] [varchar](255) NULL,
	[date] [datetime] NULL,
	[category] [varchar](255) NULL,
	[deletedate] [datetime] NULL,
	[staledate] [datetime] NULL,
	[owner] [varchar](255) NULL,
	[url] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fileSummary]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileSummary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
	[format] [varchar](50) NULL,
	[allowNewResourses] [bit] NULL,
	[message] [varchar](max) NULL,
	[categoryAlias] [varchar](max) NULL,
	[ownerEmail] [varchar](max) NULL,
	[staleCycle] [varchar](50) NULL,
	[location] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[form_arete_join]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[form_arete_join](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](255) NULL,
	[lastname] [varchar](255) NULL,
	[pharmacyname] [varchar](255) NULL,
	[ncpdp] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[phoneareacode] [varchar](255) NULL,
	[phone1] [varchar](255) NULL,
	[phone2] [varchar](255) NULL,
	[faxareacode] [varchar](255) NULL,
	[fax1] [varchar](255) NULL,
	[fax2] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[comment] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMAvg]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMAvg](
	[AAPAvg] [numeric](18, 2) NOT NULL,
	[Date] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMAvgJun221016]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMAvgJun221016](
	[AAPAvg] [numeric](18, 2) NOT NULL,
	[Date] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMBottomPlans]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMBottomPlans](
	[PharmID] [nvarchar](50) NULL,
	[PlanName] [nvarchar](100) NULL,
	[BIN] [nchar](10) NULL,
	[Rank] [int] NOT NULL,
	[GM] [numeric](18, 2) NULL,
	[GMPercent] [numeric](18, 2) NULL,
	[Claims] [int] NULL,
	[currentdt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMReport_Plannames]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMReport_Plannames](
	[PLANID] [nvarchar](50) NULL,
	[PLANNAME] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[GROUPNBR] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMStoresAvg]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMStoresAvg](
	[NCPDP] [nchar](10) NULL,
	[GMPercent] [numeric](18, 2) NULL,
	[ClaimCount] [int] NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMTopPlans]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMTopPlans](
	[PharmID] [nvarchar](50) NULL,
	[PlanName] [nvarchar](100) NULL,
	[BIN] [nchar](10) NULL,
	[Rank] [int] NOT NULL,
	[GM] [numeric](18, 2) NULL,
	[GMPercent] [numeric](18, 2) NULL,
	[Claims] [int] NULL,
	[currentdt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history_contracts]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history_contracts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[date] [datetime] NULL,
	[contract] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndexFrag_20170619]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexFrag_20170619](
	[database_id] [smallint] NULL,
	[object_id] [int] NULL,
	[index_id] [int] NULL,
	[partition_number] [int] NULL,
	[index_type_desc] [nvarchar](60) NULL,
	[alloc_unit_type_desc] [nvarchar](60) NULL,
	[index_depth] [tinyint] NULL,
	[index_level] [tinyint] NULL,
	[avg_fragmentation_in_percent] [float] NULL,
	[fragment_count] [bigint] NULL,
	[avg_fragment_size_in_pages] [float] NULL,
	[page_count] [bigint] NULL,
	[avg_page_space_used_in_percent] [float] NULL,
	[record_count] [bigint] NULL,
	[ghost_record_count] [bigint] NULL,
	[version_ghost_record_count] [bigint] NULL,
	[min_record_size_in_bytes] [int] NULL,
	[max_record_size_in_bytes] [int] NULL,
	[avg_record_size_in_bytes] [float] NULL,
	[forwarded_record_count] [bigint] NULL,
	[compressed_page_count] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](250) NULL,
	[Callsite] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_QC]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_QC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabname] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[PMID] [int] NULL,
	[date_accessed] [datetime] NULL,
	[userrole] [varchar](15) NULL,
	[IP] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_QC_051315]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_QC_051315](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabname] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[PMID] [int] NULL,
	[date_accessed] [datetime] NULL,
	[userrole] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_SPT]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_SPT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[button] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[PMID] [int] NULL,
	[date_accessed] [datetime] NULL,
	[userrole] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_TSR3]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_TSR3](
	[login] [varchar](50) NULL,
	[PMID] [int] NULL,
	[dt_run] [datetime] NULL,
	[report] [varchar](50) NULL,
	[dt_start] [datetime] NULL,
	[dt_end] [datetime] NULL,
	[notes] [varchar](255) NULL,
	[isDemo] [varchar](5) NULL,
	[parameters] [varchar](255) NULL,
	[source] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_history]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[username] [varchar](255) NULL,
	[login_type] [varchar](25) NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](50) NULL,
	[defaultpmid] [int] NULL,
	[ip] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_history_API]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_API](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[login] [varchar](50) NULL,
	[nslogin] [varchar](50) NULL,
	[PMID] [int] NULL,
	[userrole] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_history_archive_110115]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_archive_110115](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[username] [varchar](255) NULL,
	[login_type] [varchar](25) NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](50) NULL,
	[defaultpmid] [int] NULL,
	[ip] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_history_backup_040115]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_backup_040115](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[username] [varchar](255) NULL,
	[login_type] [varchar](25) NULL,
	[password] [varchar](2550) NULL,
	[role] [varchar](50) NULL,
	[defaultpmid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_history_backup_051515]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_backup_051515](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[username] [varchar](255) NULL,
	[login_type] [varchar](25) NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](50) NULL,
	[defaultpmid] [int] NULL,
	[ip] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MACFileWeb]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MACFileWeb](
	[Client_Name] [varchar](10) NULL,
	[MAC_ID] [varchar](10) NULL,
	[GPI] [varchar](14) NULL,
	[GPPC] [varchar](8) NULL,
	[NDCMFG] [varchar](5) NULL,
	[NDCPDT] [varchar](4) NULL,
	[NDCPKG] [varchar](2) NULL,
	[STATUS] [varchar](1) NULL,
	[MACFROMDATE] [varchar](7) NULL,
	[MACTHRUDATE] [varchar](7) NULL,
	[UNITCOST] [varchar](13) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCCare_MDPreferred2016]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCCare_MDPreferred2016](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Plan Data Sheet ID] [int] NULL,
	[Effective Date] [datetime] NULL,
	[PLAN_NAME] [nvarchar](255) NULL,
	[CMS Name] [nvarchar](255) NULL,
	[UD Chain Code Contracted] [nvarchar](255) NULL,
	[Plan Year 2015] [nvarchar](255) NULL,
	[Plan Year 2016] [nvarchar](255) NULL,
	[BIN] [nvarchar](255) NULL,
	[PCN] [nvarchar](255) NULL,
	[Quality Performance Incentive Program] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCenter_delete071415]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCenter_delete071415](
	[TM] [nvarchar](50) NULL,
	[Whs] [nvarchar](50) NULL,
	[Cust #] [nvarchar](50) NULL,
	[Customer Name] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[MOT] [nvarchar](50) NULL,
	[CUTOFF] [nvarchar](50) NULL,
	[TIME ZONE] [nvarchar](50) NULL,
	[MODE] [nvarchar](50) NULL,
	[CSOS] [nvarchar](50) NULL,
	[PHONE] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[CUST STAT] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCenter_list111814]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCenter_list111814](
	[NABP] [nvarchar](255) NULL,
	[PHARMACY NAME] [nvarchar](255) NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCenter_test]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCenter_test](
	[MessageID] [int] NULL,
	[StrValue] [varchar](255) NULL,
	[IntValue] [int] NULL,
	[FieldName] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCenter_UPSChange_delete071315]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCenter_UPSChange_delete071315](
	[Cust#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageCenter_AccessCodes]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_AccessCodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[access_code] [varchar](15) NOT NULL,
	[description] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageCenter_Log]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[messageid] [int] NOT NULL,
	[login] [varchar](50) NOT NULL,
	[PMID] [int] NULL,
	[date_read] [datetime] NOT NULL,
	[userrole] [varchar](50) NULL,
 CONSTRAINT [PK_MessageCenter_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageCenter_Messages]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_posted] [datetime] NULL,
	[date_expires] [datetime] NULL,
	[title] [varchar](255) NOT NULL,
	[link] [varchar](255) NOT NULL,
	[description] [varchar](max) NULL,
	[access_codes] [varchar](255) NULL,
	[PMIDs] [varchar](255) NULL,
	[query_text] [varchar](max) NULL,
 CONSTRAINT [PK_MessageCenter_Messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageCenter_QC_Log]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_QC_Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[messageid] [int] NOT NULL,
	[login] [varchar](50) NOT NULL,
	[PMID] [int] NULL,
	[date_read] [datetime] NOT NULL,
	[userrole] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageCenter_QC_Messages]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_QC_Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_posted] [datetime] NULL,
	[date_expires] [datetime] NULL,
	[title] [varchar](255) NOT NULL,
	[link] [varchar](255) NOT NULL,
	[description] [varchar](max) NULL,
	[access_codes] [varchar](255) NULL,
	[PMIDs] [varchar](255) NULL,
	[query_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetstoreUsers]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetstoreUsers](
	[ClientID] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Enabled] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[DEA#] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetstoreUsersOld]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetstoreUsersOld](
	[ClientID] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Enabled] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[DEA#] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetstoreUsersTest]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetstoreUsersTest](
	[ClientID] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Enabled] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[DEA#] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherOwnership]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherOwnership](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[OtherNPI] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherOwnershipAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherOwnershipAll](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[OtherNPI] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherOwnershipAll-1]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherOwnershipAll-1](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[OtherNPI] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OtherOwnershipS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtherOwnershipS](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[OtherNPI] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OthersAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OthersAll](
	[PMID] [int] NULL,
	[NPI] [nvarchar](500) NULL,
	[NCPDP] [nvarchar](500) NULL,
	[DBA] [nvarchar](500) NULL,
	[LTC] [nvarchar](500) NULL,
	[Inventory] [nvarchar](500) NULL,
	[Packaging] [nvarchar](500) NULL,
	[IV Medication] [nvarchar](500) NULL,
	[Compounding] [nvarchar](500) NULL,
	[On Call] [nvarchar](500) NULL,
	[Delivery] [nvarchar](500) NULL,
	[Emergency Boxes] [nvarchar](500) NULL,
	[Log Books] [nvarchar](500) NULL,
	[LIS] [nvarchar](500) NULL,
	[Immunization] [nvarchar](500) NULL,
	[MTM Mirixa] [nvarchar](500) NULL,
	[MTM Outcomes] [nvarchar](500) NULL,
	[MTM Catamaran] [nvarchar](500) NULL,
	[MTM Contact] [nvarchar](500) NULL,
	[Pharmacy Software System] [nvarchar](500) NULL,
	[Sell Products Outstate] [nvarchar](500) NULL,
	[Product Sales Detail] [nvarchar](500) NULL,
	[Employ Outstate] [nvarchar](500) NULL,
	[Out State Sales Detail] [nvarchar](500) NULL,
	[Incentive] [nvarchar](500) NULL,
	[Referals Detail] [nvarchar](500) NULL,
	[Have PTAN] [nvarchar](500) NULL,
	[PTAN] [nvarchar](500) NULL,
	[Pharmacist Prescribes] [nvarchar](500) NULL,
	[Have Medi-Cal number] [nvarchar](500) NULL,
	[Medi-Cal number] [nvarchar](500) NULL,
	[Reconciliation] [nvarchar](500) NULL,
	[Reconciliation Service] [nvarchar](500) NULL,
	[ADU] [nvarchar](500) NULL,
	[Refill website] [nvarchar](500) NULL,
	[Sterile] [nvarchar](500) NULL,
	[Sterile compliance number] [nvarchar](500) NULL,
	[Sterile compliance number expiry] [nvarchar](500) NULL,
	[NCPDP Dispenser Class] [nvarchar](500) NULL,
	[Specialize practice] [nvarchar](500) NULL,
	[Speciality Practice Area] [nvarchar](500) NULL,
	[Ebill] [nvarchar](500) NULL,
	[Balance bill] [nvarchar](500) NULL,
	[Sell spirited alcohol] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OthersAll-1]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OthersAll-1](
	[PMID] [int] NULL,
	[NPI] [nvarchar](500) NULL,
	[NCPDP] [nvarchar](500) NULL,
	[DBA] [nvarchar](500) NULL,
	[LTC] [nvarchar](500) NULL,
	[Inventory] [nvarchar](500) NULL,
	[Packaging] [nvarchar](500) NULL,
	[IV Medication] [nvarchar](500) NULL,
	[Compounding] [nvarchar](500) NULL,
	[On Call] [nvarchar](500) NULL,
	[Delivery] [nvarchar](500) NULL,
	[Emergency Boxes] [nvarchar](500) NULL,
	[Log Books] [nvarchar](500) NULL,
	[LIS] [nvarchar](500) NULL,
	[Immunization] [nvarchar](500) NULL,
	[MTM Mirixa] [nvarchar](500) NULL,
	[MTM Outcomes] [nvarchar](500) NULL,
	[MTM Catamaran] [nvarchar](500) NULL,
	[MTM Contact] [nvarchar](500) NULL,
	[Pharmacy Software System] [nvarchar](500) NULL,
	[Sell Products Outstate] [nvarchar](500) NULL,
	[Product Sales Detail] [nvarchar](500) NULL,
	[Employ Outstate] [nvarchar](500) NULL,
	[Out State Sales Detail] [nvarchar](500) NULL,
	[Incentive] [nvarchar](500) NULL,
	[Referals Detail] [nvarchar](500) NULL,
	[Have PTAN] [nvarchar](500) NULL,
	[PTAN] [nvarchar](500) NULL,
	[Pharmacist Prescribes] [nvarchar](500) NULL,
	[Have Medi-Cal number] [nvarchar](500) NULL,
	[Medi-Cal number] [nvarchar](500) NULL,
	[Reconciliation] [nvarchar](500) NULL,
	[Reconciliation Service] [nvarchar](500) NULL,
	[ADU] [nvarchar](500) NULL,
	[Refill website] [nvarchar](500) NULL,
	[Sterile] [nvarchar](500) NULL,
	[Sterile compliance number] [nvarchar](500) NULL,
	[Sterile compliance number expiry] [nvarchar](500) NULL,
	[NCPDP Dispenser Class] [nvarchar](500) NULL,
	[Specialize practice] [nvarchar](500) NULL,
	[Speciality Practice Area] [nvarchar](500) NULL,
	[Ebill] [nvarchar](500) NULL,
	[Balance bill] [nvarchar](500) NULL,
	[Sell spirited alcohol] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OthersS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OthersS](
	[PMID] [int] NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[LTC] [nvarchar](max) NULL,
	[Inventory] [nvarchar](max) NULL,
	[Packaging] [nvarchar](max) NULL,
	[IV Medication] [nvarchar](max) NULL,
	[CompoundingS] [nvarchar](max) NULL,
	[On Call] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Emergency Boxes] [nvarchar](max) NULL,
	[Log Books] [nvarchar](max) NULL,
	[LIS] [nvarchar](max) NULL,
	[Immunization] [nvarchar](max) NULL,
	[MTM Mirixa] [nvarchar](max) NULL,
	[MTM Outcomes] [nvarchar](max) NULL,
	[MTM Catamaran] [nvarchar](max) NULL,
	[MTM Contact] [nvarchar](max) NULL,
	[PharmacyS Software System] [nvarchar](max) NULL,
	[Sell Products Outstate] [nvarchar](max) NULL,
	[Product Sales Detail] [nvarchar](max) NULL,
	[Employ Outstate] [nvarchar](max) NULL,
	[Out State Sales Detail] [nvarchar](max) NULL,
	[Incentive] [nvarchar](max) NULL,
	[Referals Detail] [nvarchar](max) NULL,
	[Have PTAN] [nvarchar](max) NULL,
	[PTAN] [nvarchar](max) NULL,
	[Pharmacist Prescribes] [nvarchar](max) NULL,
	[Have Medi-Cal number] [nvarchar](max) NULL,
	[Medi-Cal number] [nvarchar](max) NULL,
	[Reconciliation] [nvarchar](max) NULL,
	[Reconciliation Service] [nvarchar](max) NULL,
	[ADU] [nvarchar](max) NULL,
	[Refill website] [nvarchar](max) NULL,
	[Sterile] [nvarchar](max) NULL,
	[Sterile compliance number] [nvarchar](max) NULL,
	[Sterile compliance number expiry] [nvarchar](max) NULL,
	[NCPDP Dispenser Class] [nvarchar](max) NULL,
	[Specialize practice] [nvarchar](max) NULL,
	[Speciality Practice Area] [nvarchar](max) NULL,
	[Ebill] [nvarchar](max) NULL,
	[Balance bill] [nvarchar](max) NULL,
	[Sell spririted alcohol] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnershipControl]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControl](
	[PMID] [int] NULL,
	[CID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Title] [nvarchar](max) NULL,
	[Effective Date] [nvarchar](max) NULL,
	[% Ownership] [float] NULL,
	[Pharmacist's License] [nvarchar](max) NULL,
	[Expiration Date] [nvarchar](max) NULL,
	[Entity] [nvarchar](max) NULL,
	[Entity's DBA] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL,
	[SSN] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Reserved21] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Reserved23] [nvarchar](max) NULL,
	[Other Ownership] [nvarchar](max) NULL,
	[Relation] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnershipControlAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControlAll](
	[PMID] [int] NULL,
	[CID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Title] [nvarchar](max) NULL,
	[Effective Date] [nvarchar](max) NULL,
	[% Ownership] [float] NULL,
	[Pharmacist's License] [nvarchar](max) NULL,
	[Expiration Date] [nvarchar](max) NULL,
	[Entity] [nvarchar](max) NULL,
	[Entity's DBA] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL,
	[SSN] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Reserved21] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Reserved23] [nvarchar](max) NULL,
	[Other Ownership] [nvarchar](max) NULL,
	[Relation] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnershipControlAll-1]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControlAll-1](
	[PMID] [int] NULL,
	[CID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Title] [nvarchar](max) NULL,
	[Effective Date] [nvarchar](max) NULL,
	[% Ownership] [float] NULL,
	[Pharmacist's License] [nvarchar](max) NULL,
	[Expiration Date] [nvarchar](max) NULL,
	[Entity] [nvarchar](max) NULL,
	[Entity's DBA] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL,
	[SSN] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Reserved21] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Reserved23] [nvarchar](max) NULL,
	[Other Ownership] [nvarchar](max) NULL,
	[Relation] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnershipControlImport]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControlImport](
	[Location Type] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Effective Date] [nvarchar](255) NULL,
	[% Ownership] [nvarchar](255) NULL,
	[Pharmacist's License] [nvarchar](255) NULL,
	[Expiration Date] [nvarchar](255) NULL,
	[Entity] [nvarchar](255) NULL,
	[Entity's DBA] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Middle Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[SSN] [nvarchar](255) NULL,
	[FEIN] [nvarchar](255) NULL,
	[DOB] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Reserved21] [nvarchar](255) NULL,
	[Criminal Offense] [nvarchar](255) NULL,
	[Reserved23] [nvarchar](255) NULL,
	[Other Ownership] [nvarchar](255) NULL,
	[Relation] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OwnershipControlS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OwnershipControlS](
	[PMID] [int] NULL,
	[CID] [int] NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Title] [nvarchar](max) NULL,
	[Effective Date] [nvarchar](max) NULL,
	[% Ownership] [float] NULL,
	[Pharmacist's License] [nvarchar](max) NULL,
	[Expiration Date] [nvarchar](max) NULL,
	[Entity] [nvarchar](max) NULL,
	[Entity's DBA] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL,
	[SSN] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[DOB] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Reserved21] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Reserved23] [nvarchar](max) NULL,
	[Other Ownership] [nvarchar](max) NULL,
	[Relation] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageMaster]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Page] [nvarchar](100) NOT NULL,
	[PageName] [nvarchar](100) NOT NULL,
	[PageTitle] [nvarchar](255) NOT NULL,
	[PageMediaSelector] [int] NOT NULL,
	[PageContent] [text] NOT NULL,
	[ImageId] [int] NULL,
	[VideoId] [int] NULL,
	[PageFlag] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_PageMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[pageID] [int] IDENTITY(1,1) NOT NULL,
	[route] [varchar](128) NOT NULL,
	[title] [text] NULL,
	[keywords] [text] NULL,
	[description] [text] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[pageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_route] UNIQUE NONCLUSTERED 
(
	[route] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[route] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages_old_RSE_20200415]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages_old_RSE_20200415](
	[pageID] [int] NOT NULL,
	[route] [varchar](128) NOT NULL,
	[title] [text] NULL,
	[keywords] [text] NULL,
	[description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL,
	[Delivery Charges2] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyAll](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyAll1]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyAll1](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL,
	[Delivery Charges2] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyAll12]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyAll12](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL,
	[Delivery Charges2] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyAll19]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyAll19](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL,
	[Delivery Charges2] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyInfoImport]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyInfoImport](
	[Action] [nvarchar](255) NULL,
	[Location Type] [nvarchar](255) NULL,
	[Effective Date] [nvarchar](255) NULL,
	[Legal Name] [nvarchar](255) NULL,
	[DBA] [nvarchar](255) NULL,
	[FEIN] [nvarchar](255) NULL,
	[Store Number] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Mailing Address] [nvarchar](255) NULL,
	[Mailing Address 2] [nvarchar](255) NULL,
	[Mailing City] [nvarchar](255) NULL,
	[Mailing State] [nvarchar](255) NULL,
	[Mailing Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Toll Free ] [nvarchar](255) NULL,
	[TTY/TDD                         ] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[URL] [nvarchar](255) NULL,
	[Authorized Contact] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Contact Phone] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[NCPDP1] [nvarchar](255) NULL,
	[Multiple NCPDP] [nvarchar](255) NULL,
	[NCPDP2] [nvarchar](255) NULL,
	[NCPDP3] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Expiration] [nvarchar](255) NULL,
	[State License] [nvarchar](255) NULL,
	[State License Expiration] [nvarchar](255) NULL,
	[Policy Insurer] [nvarchar](255) NULL,
	[Policy Number] [nvarchar](255) NULL,
	[Policy Expiration] [nvarchar](255) NULL,
	[Policy Limits] [nvarchar](255) NULL,
	[Medicaid ID1] [nvarchar](255) NULL,
	[Medicaid State1] [nvarchar](255) NULL,
	[Medicaid ID2] [nvarchar](255) NULL,
	[Medicaid State2] [nvarchar](255) NULL,
	[Medicaid ID3] [nvarchar](255) NULL,
	[Medicaid State3] [nvarchar](255) NULL,
	[24 Hrs] [nvarchar](255) NULL,
	[7 Days] [nvarchar](255) NULL,
	[Emergency] [nvarchar](255) NULL,
	[Emergency Phone] [nvarchar](255) NULL,
	[Drive Thru ] [nvarchar](255) NULL,
	[Delivery ] [nvarchar](255) NULL,
	[Delivery Charges] [nvarchar](255) NULL,
	[Clinic] [nvarchar](255) NULL,
	[Pressure] [nvarchar](255) NULL,
	[Written Consultation] [nvarchar](255) NULL,
	[Med Consultation] [nvarchar](255) NULL,
	[Compliance ] [nvarchar](255) NULL,
	[Disease] [nvarchar](255) NULL,
	[Infusion] [nvarchar](255) NULL,
	[Vision] [nvarchar](255) NULL,
	[Tobacco] [nvarchar](255) NULL,
	[Monday] [nvarchar](255) NULL,
	[Tuesday] [nvarchar](255) NULL,
	[Wednesday] [nvarchar](255) NULL,
	[Thursday] [nvarchar](255) NULL,
	[Friday] [nvarchar](255) NULL,
	[Saturday] [nvarchar](255) NULL,
	[Sunday] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[Printed] [nvarchar](255) NULL,
	[ASL] [nvarchar](255) NULL,
	[Braille] [nvarchar](255) NULL,
	[Translation] [nvarchar](255) NULL,
	[Dispense 340B] [nvarchar](255) NULL,
	[340B Owned] [nvarchar](255) NULL,
	[340B Contracted] [nvarchar](255) NULL,
	[Accessible] [nvarchar](255) NULL,
	[Distance] [nvarchar](255) NULL,
	[ADA] [nvarchar](255) NULL,
	[DME] [nvarchar](255) NULL,
	[DME Type] [nvarchar](255) NULL,
	[DMEPOS] [nvarchar](255) NULL,
	[VIPPS] [nvarchar](255) NULL,
	[Retail] [nvarchar](255) NULL,
	[Pharm Type] [nvarchar](255) NULL,
	[Mail] [nvarchar](255) NULL,
	[PCAB] [nvarchar](255) NULL,
	[ISMP] [nvarchar](255) NULL,
	[Errors] [nvarchar](255) NULL,
	[MedB] [nvarchar](255) NULL,
	[Assignment] [nvarchar](255) NULL,
	[MedD] [nvarchar](255) NULL,
	[Electronic Coordination] [nvarchar](255) NULL,
	[Long Term Care] [nvarchar](255) NULL,
	[Home Infusion] [nvarchar](255) NULL,
	[Update NCPDP] [nvarchar](255) NULL,
	[Ownership Type] [nvarchar](255) NULL,
	[Ownership Change] [nvarchar](255) NULL,
	[Owner Pharmacist] [nvarchar](255) NULL,
	[Good Standing] [nvarchar](255) NULL,
	[Denied] [nvarchar](255) NULL,
	[Criminal Offense] [nvarchar](255) NULL,
	[Excluded] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyS](
	[PMID] [int] NULL,
	[Action] [varchar](1) NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[Effective Date] [nvarchar](max) NULL,
	[Legal Name] [nvarchar](max) NULL,
	[DBA] [nvarchar](max) NULL,
	[FEIN] [nvarchar](max) NULL,
	[Store Number] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Address 2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Zip] [nvarchar](max) NULL,
	[Mailing Address] [nvarchar](max) NULL,
	[Mailing Address 2] [nvarchar](max) NULL,
	[Mailing City] [nvarchar](max) NULL,
	[Mailing State] [nvarchar](max) NULL,
	[Mailing Zip] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Toll Free] [nvarchar](max) NULL,
	[TTY/TDD] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[URL] [nvarchar](max) NULL,
	[Authorized Contact] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Contact Phone] [nvarchar](max) NULL,
	[NPI] [nvarchar](max) NULL,
	[NCPDP1] [nvarchar](max) NULL,
	[Multiple NCPDP] [nvarchar](max) NULL,
	[NCPDP2] [nvarchar](max) NULL,
	[NCPDP3] [nvarchar](max) NULL,
	[DEA] [nvarchar](max) NULL,
	[DEA Expiration] [nvarchar](max) NULL,
	[State License] [nvarchar](max) NULL,
	[State License Expiration] [nvarchar](max) NULL,
	[Policy Insurer] [nvarchar](max) NULL,
	[Policy Number] [nvarchar](max) NULL,
	[Policy Expiration] [nvarchar](max) NULL,
	[Policy Limits] [nvarchar](max) NULL,
	[Medicaid ID1] [nvarchar](max) NULL,
	[Medicaid State1] [nvarchar](max) NULL,
	[Medicaid ID2] [nvarchar](max) NULL,
	[Medicaid State2] [nvarchar](max) NULL,
	[Medicaid ID3] [nvarchar](max) NULL,
	[Medicaid State3] [nvarchar](max) NULL,
	[24 Hrs] [nvarchar](max) NULL,
	[7 Days] [nvarchar](max) NULL,
	[Emergency] [nvarchar](max) NULL,
	[Emergency Phone] [nvarchar](max) NULL,
	[Drive Thru] [nvarchar](max) NULL,
	[Delivery] [nvarchar](max) NULL,
	[Delivery Charges] [nvarchar](max) NULL,
	[Clinic] [nvarchar](max) NULL,
	[Pressure] [nvarchar](max) NULL,
	[Written Consultation] [nvarchar](max) NULL,
	[Med Consulation] [nvarchar](max) NULL,
	[Compliance] [nvarchar](max) NULL,
	[Disease] [nvarchar](max) NULL,
	[Infusion] [nvarchar](max) NULL,
	[Vision] [nvarchar](max) NULL,
	[Tabacco] [nvarchar](max) NULL,
	[Monday] [nvarchar](max) NULL,
	[Tuesday] [nvarchar](max) NULL,
	[Wednesday] [nvarchar](max) NULL,
	[Thursday] [nvarchar](max) NULL,
	[Friday] [nvarchar](max) NULL,
	[Saturday] [nvarchar](max) NULL,
	[Sunday] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Printed] [nvarchar](max) NULL,
	[ASL] [nvarchar](max) NULL,
	[Braille] [nvarchar](max) NULL,
	[Translation] [nvarchar](max) NULL,
	[Dispense 340B] [nvarchar](max) NULL,
	[340B Owned] [nvarchar](max) NULL,
	[340B Contracted] [nvarchar](max) NULL,
	[Accessible] [nvarchar](max) NULL,
	[Distance] [nvarchar](max) NULL,
	[ADA] [nvarchar](max) NULL,
	[DME] [nvarchar](max) NULL,
	[DME Type] [nvarchar](max) NULL,
	[DMEPOS] [nvarchar](max) NULL,
	[VIPPS] [nvarchar](max) NULL,
	[Retail] [nvarchar](max) NULL,
	[Pharm Type] [nvarchar](max) NULL,
	[Mail] [nvarchar](max) NULL,
	[PCAB] [nvarchar](max) NULL,
	[ISMP] [nvarchar](max) NULL,
	[Errors] [nvarchar](max) NULL,
	[MedB] [nvarchar](max) NULL,
	[Assignment] [nvarchar](max) NULL,
	[MedD] [nvarchar](max) NULL,
	[Electronic Coordination ] [nvarchar](max) NULL,
	[Long Term Care] [nvarchar](max) NULL,
	[Home Infusion] [nvarchar](max) NULL,
	[Update NCPDP] [nvarchar](max) NULL,
	[Ownership Type] [nvarchar](max) NULL,
	[Ownership Change] [nvarchar](max) NULL,
	[Owner Pharmacist] [nvarchar](max) NULL,
	[Good Standing] [nvarchar](max) NULL,
	[Denied] [nvarchar](max) NULL,
	[Criminal Offense] [nvarchar](max) NULL,
	[Excluded] [nvarchar](max) NULL,
	[Delivery Charges2] [char](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPEligibility]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPEligibility](
	[CustomerNumber] [varchar](255) NULL,
	[CustomerName] [varchar](255) NULL,
	[CIN_4354692] [varchar](50) NULL,
	[CIN_4260956] [varchar](50) NULL,
	[CIN_4072062] [varchar](50) NULL,
	[CIN_4309548] [varchar](50) NULL,
	[CIN_3583465] [varchar](50) NULL,
	[CIN_3583481] [varchar](50) NULL,
	[CIN_3583507] [varchar](50) NULL,
	[CIN_3684511] [varchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPItems]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPItems](
	[CIN] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[Size] [varchar](255) NULL,
	[ProtectedSellPrice] [money] NULL,
	[NewSellPrice] [money] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[PIPSavings] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimeDIRDetails]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimeDIRDetails](
	[Parent Code] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[RxNbr] [nvarchar](50) NULL,
	[Submit Cost] [nvarchar](50) NULL,
	[Conc Fee] [numeric](18, 0) NULL,
	[Fill Date] [nvarchar](50) NULL,
	[NDC 1] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Client] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile_links_programinfo]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile_links_programinfo](
	[programid] [int] NOT NULL,
	[link] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Program_log]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Program] [varchar](50) NOT NULL,
	[program_id] [int] NULL,
	[event] [varchar](50) NULL,
	[date] [datetime] NOT NULL,
	[PMID] [int] NULL,
	[field1] [varchar](255) NULL,
	[field2] [varchar](255) NULL,
	[field3] [varchar](255) NULL,
	[field4] [varchar](255) NULL,
	[field5] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QAttestation]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QAttestation](
	[QID] [int] IDENTITY(1,1) NOT NULL,
	[AttestationYear] [int] NOT NULL,
	[AIsMandatory] [bit] NULL,
	[QText] [nvarchar](max) NOT NULL,
	[QSortOrder] [int] NOT NULL,
	[InputType] [nchar](10) NULL,
	[ADataType] [nvarchar](50) NULL,
	[AWidth] [int] NULL,
 CONSTRAINT [PK_QAttestation] PRIMARY KEY CLUSTERED 
(
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CK_QAttestation] UNIQUE NONCLUSTERED 
(
	[AttestationYear] ASC,
	[QSortOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RebateDelayDates]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateDelayDates](
	[RebateDate] [datetime] NOT NULL,
	[DelayUntilDate] [datetime] NOT NULL,
	[RebateType] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RebateLinkedPMIDs]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateLinkedPMIDs](
	[PMID] [int] NOT NULL,
	[LinkedPMIDs] [varchar](255) NULL,
 CONSTRAINT [PK_RebateLinkedPMIDs] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RebateLinkedPMIDs_backup_20181128]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateLinkedPMIDs_backup_20181128](
	[PMID] [int] NOT NULL,
	[LinkedPMIDs] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rebates2015]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebates2015](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[AAP] [money] NULL,
	[API] [money] NULL,
	[CAH] [money] NULL,
	[Total] [money] NULL,
	[Year] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rebates2016]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rebates2016](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[AAP] [money] NULL,
	[API] [money] NULL,
	[CAH] [money] NULL,
	[Total] [money] NULL,
	[Year] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationship](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Relationship] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelationshipAll]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipAll](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Relationship] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelationshipAll-1]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipAll-1](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Relationship] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelationshipS]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationshipS](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Relationship] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rform_claims_research]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rform_claims_research](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[BIN] [nvarchar](10) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[PatName] [nvarchar](100) NULL,
	[PatID] [nvarchar](50) NULL,
	[PatDOB] [smalldatetime] NULL,
	[Wholesaler] [nvarchar](100) NULL,
	[NDC] [nvarchar](11) NULL,
	[FillDate] [smalldatetime] NULL,
	[Quantity] [int] NULL,
	[RxNbr] [nvarchar](20) NULL,
	[DaySupply] [nvarchar](20) NULL,
	[TotalCost] [float] NULL,
	[TotalPaid] [float] NULL,
	[Maced] [bit] NULL,
	[NCPDP] [nvarchar](20) NULL,
	[ContactName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[SendPBM] [int] NULL,
	[Notes] [text] NULL,
	[CreatedOn] [smalldatetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[DispensingFee] [float] NULL,
	[Compound] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rform_claims_research_TPN]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rform_claims_research_TPN](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[BIN] [nvarchar](10) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[PatName] [nvarchar](100) NULL,
	[PatID] [nvarchar](50) NULL,
	[PatDOB] [smalldatetime] NULL,
	[Wholesaler] [nvarchar](100) NULL,
	[NDC] [nvarchar](11) NULL,
	[FillDate] [smalldatetime] NULL,
	[Quantity] [int] NULL,
	[RxNbr] [nvarchar](20) NULL,
	[DaySupply] [nvarchar](20) NULL,
	[TotalCost] [float] NULL,
	[TotalPaid] [float] NULL,
	[Maced] [bit] NULL,
	[NCPDP] [nvarchar](20) NULL,
	[ContactName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[SendPBM] [int] NULL,
	[Notes] [text] NULL,
	[CreatedOn] [smalldatetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[DispensingFee] [float] NULL,
	[Compound] [bit] NULL,
	[MedPartD] [bit] NULL,
	[AWPAmtDispensed] [nvarchar](20) NULL,
	[SubmittedCost] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rform_wholesalers]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rform_wholesalers](
	[ID] [int] NOT NULL,
	[Wholesaler] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rform_wholesalers_hds]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rform_wholesalers_hds](
	[ID] [int] NOT NULL,
	[Wholesaler] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLdemovalues]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLdemovalues](
	[ncpdp] [varchar](7) NULL,
	[rxg] [varchar](50) NULL,
	[rxgd] [varchar](15) NULL,
	[rxr] [varchar](50) NULL,
	[rxrd] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSE_DB1_20180806]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_DB1_20180806](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[NDC] [varchar](11) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSE_DB1_20180813]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_DB1_20180813](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[NDC] [varchar](11) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RxCareParticipation]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxCareParticipation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_registered] [datetime] NULL,
	[Pharmacy] [varchar](255) NULL,
	[NCPDP] [varchar](10) NULL,
	[NPI] [varchar](10) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[Email] [varchar](255) NULL,
	[Alt.Email] [varchar](255) NULL,
	[Address1] [varchar](255) NULL,
	[Address2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](20) NULL,
	[MailAddress1] [varchar](255) NULL,
	[MailAddress2] [varchar](255) NULL,
	[MailCity] [varchar](255) NULL,
	[MailState] [varchar](50) NULL,
	[MailZip] [varchar](20) NULL,
	[PharmacyOwner] [varchar](255) NULL,
	[ManagerName] [varchar](255) NULL,
	[SoftwareSystem] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Title] [varchar](255) NULL,
	[Referral] [varchar](50) NULL,
	[ReferralText] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RxCareParticipationBankInfo]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxCareParticipationBankInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_registered] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[BusinessName] [varchar](255) NULL,
	[BankName] [varchar](255) NULL,
	[BankAddress1] [varchar](255) NULL,
	[BankAddress2] [varchar](255) NULL,
	[BankCity] [varchar](255) NULL,
	[BankState] [varchar](50) NULL,
	[BankZip] [varchar](20) NULL,
	[RoutingNumber] [varchar](25) NULL,
	[AccountNumber] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RxCareSelect]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxCareSelect](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_registered] [datetime] NULL,
	[Firstname] [varchar](50) NULL,
	[Initial] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[Gender] [char](10) NULL,
	[Address1] [varchar](255) NULL,
	[Address2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[Pharmacy] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreCard_Header]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreCard_Header](
	[Id] [smallint] NOT NULL,
	[GroupDisplaySeq] [smallint] NOT NULL,
	[GroupTitle] [varchar](500) NULL,
	[SubGroupDisplaySeq] [smallint] NOT NULL,
	[SubGroupTitle] [varchar](500) NOT NULL,
	[DataColumn] [varchar](500) NULL,
	[Client] [varchar](500) NOT NULL,
	[IsActive] [tinyint] NOT NULL,
	[CreatedBy] [varchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](100) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_ScoreCard_Header] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreCardAnthem_Temp]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreCardAnthem_Temp](
	[NABP#] [float] NULL,
	[Corporate Name] [nvarchar](255) NULL,
	[Pharmacy Name#] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Current: Mean Score] [float] NULL,
	[Previous: Mean Score] [nvarchar](255) NULL,
	[Baseline: Mean Score] [float] NULL,
	[Total # of Patients_(Sample Size, N)] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)] [float] NULL,
	[Current Plan Star  Equivalent] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)] [nvarchar](255) NULL,
	[Previous Quarter Plan Star Equivalent] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)1] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)1] [float] NULL,
	[Current Plan Star  Equivalent1] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars1] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)1] [float] NULL,
	[Previous Quarter Plan Star Equivalent1] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)2] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)2] [float] NULL,
	[Current Plan Star  Equivalent2] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars2] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)2] [float] NULL,
	[Previous Quarter Plan Star Equivalent2] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)3] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)3] [float] NULL,
	[Current Plan Star  Equivalent3] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars3] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)3] [float] NULL,
	[Previous Quarter Plan Star Equivalent3] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)4] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)4] [float] NULL,
	[Current Plan Star  Equivalent4] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars4] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)4] [float] NULL,
	[Previous Quarter Plan Star Equivalent4] [nvarchar](255) NULL,
	[Improvement Value] [float] NULL,
	[Client] [nvarchar](255) NOT NULL,
	[File_Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[search_data]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file] [varchar](255) NULL,
	[url] [varchar](255) NULL,
	[rank] [int] NULL,
	[permission] [int] NULL,
	[title] [varchar](255) NULL,
	[description] [varchar](max) NULL,
	[text] [varchar](max) NULL,
	[date] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[source]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[source](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialty_AuthorizeExceptions]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty_AuthorizeExceptions](
	[PMID] [int] NULL,
	[NCPDP] [varchar](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialty_Software]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty_Software](
	[software] [varchar](80) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffGuard_Names]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffGuard_Names](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[NameFirst] [varchar](255) NULL,
	[NameMI] [varchar](255) NULL,
	[NameLast] [varchar](255) NULL,
	[NameFull] [varchar](255) NULL,
	[dateAdded] [datetime] NULL,
	[dateModified] [datetime] NULL,
	[dateLastChecked] [datetime] NULL,
	[isMatchOIG] [int] NULL,
	[isMatchGSA] [int] NULL,
	[matchOIG] [varchar](255) NULL,
	[matchGSA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[FormText] [nvarchar](max) NULL,
	[Published] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[SaveChangeFunction] [nvarchar](max) NULL,
	[CompletedFunction] [nvarchar](max) NULL,
	[ValidateFunction] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[IsPrintable] [bit] NULL,
	[SurveyScheduleId] [int] NULL,
	[Emails] [nvarchar](max) NULL,
	[EmailSubject] [nvarchar](350) NULL,
	[EmailTemplate] [nvarchar](max) NULL,
	[NotifyWhenCompleted] [bit] NULL,
	[FlagAction] [nvarchar](50) NULL,
	[FlagEmailSubject] [nvarchar](350) NULL,
	[FlagEmailTemplate] [nvarchar](max) NULL,
	[Template] [nvarchar](max) NULL,
	[ApplyToEntity] [nvarchar](50) NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[survey_RetailClinics]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[survey_RetailClinics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountname] [nvarchar](255) NULL,
	[ncpdp] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[zip] [nvarchar](255) NULL,
	[contactName] [nvarchar](100) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[sqFootage] [nvarchar](100) NULL,
	[hasRoom] [bit] NULL,
	[hours] [nvarchar](255) NULL,
	[townPop] [nvarchar](255) NULL,
	[numHospitals] [nvarchar](255) NULL,
	[PMID] [int] NULL,
	[date] [datetime] NULL,
	[topInsCarrier1] [nvarchar](255) NULL,
	[topInsCarrier2] [nvarchar](255) NULL,
	[topInsCarrier3] [nvarchar](255) NULL,
	[topInsCarrier4] [nvarchar](255) NULL,
	[topInsCarrier5] [nvarchar](255) NULL,
	[preferredHealthsSystemNumPatients] [nvarchar](255) NULL,
	[preferredHealthsSystemPersonalPref] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[surveyanswer]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveyanswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[surveyanswer_prodbackup8816]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveyanswer_prodbackup8816](
	[Id] [int] NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[surveyanswer_temp]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[surveyanswer_temp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyAnswer20150406]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyAnswer20150406](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyAnswerCL]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyAnswerCL](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyCert]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyCert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CertName] [nvarchar](150) NULL,
	[Desc] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyCert_20150324]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyCert_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CertName] [nvarchar](150) NULL,
	[Desc] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyControlEntity]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NOT NULL,
	[Type] [nvarchar](150) NULL,
	[LocationType] [nvarchar](50) NULL,
	[npi] [nvarchar](11) NULL,
	[Title] [nvarchar](150) NULL,
	[EffectiveDate] [datetime] NULL,
	[PercentOwnership] [decimal](5, 2) NULL,
	[PharmacistLicense] [nvarchar](50) NULL,
	[StateIssueLicense] [nvarchar](50) NULL,
	[LicenseExpirationDate] [datetime] NULL,
	[Entity] [nvarchar](250) NULL,
	[DBA] [nvarchar](250) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[SSN] [nvarchar](12) NULL,
	[FEIN] [nvarchar](12) NULL,
	[DOB] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[CriminalOffense] [bit] NULL,
	[HasOwnershipWithOtherStore] [bit] NULL,
	[HasRelationshipWithOtherOwner] [bit] NULL,
	[IsPIC] [bit] NULL,
	[IsControlEntity] [bit] NULL,
	[IsTechnician] [bit] NULL,
	[IsCertifiedTechnician] [bit] NULL,
	[IsPharmacist] [bit] NULL,
	[IsStoreManager] [bit] NULL,
	[PharState] [nvarchar](50) NULL,
	[PharExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[IsOwner] [bit] NULL,
 CONSTRAINT [PK_SurveyControlEntity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyControlEntity_prodbackup]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntity_prodbackup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NOT NULL,
	[Type] [nvarchar](150) NULL,
	[LocationType] [nvarchar](50) NULL,
	[npi] [nvarchar](11) NULL,
	[Title] [nvarchar](150) NULL,
	[EffectiveDate] [datetime] NULL,
	[PercentOwnership] [decimal](5, 2) NULL,
	[PharmacistLicense] [nvarchar](50) NULL,
	[StateIssueLicense] [nvarchar](50) NULL,
	[LicenseExpirationDate] [datetime] NULL,
	[Entity] [nvarchar](250) NULL,
	[DBA] [nvarchar](250) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[SSN] [nvarchar](12) NULL,
	[FEIN] [nvarchar](12) NULL,
	[DOB] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[CriminalOffense] [bit] NULL,
	[HasOwnershipWithOtherStore] [bit] NULL,
	[HasRelationshipWithOtherOwner] [bit] NULL,
	[IsPIC] [bit] NULL,
	[IsControlEntity] [bit] NULL,
	[IsTechnician] [bit] NULL,
	[IsCertifiedTechnician] [bit] NULL,
	[IsPharmacist] [bit] NULL,
	[IsStoreManager] [bit] NULL,
	[PharState] [nvarchar](50) NULL,
	[PharExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[IsOwner] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyControlEntity_prodbackup8816]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntity_prodbackup8816](
	[Id] [int] NOT NULL,
	[PMId] [int] NOT NULL,
	[Type] [nvarchar](150) NULL,
	[LocationType] [nvarchar](50) NULL,
	[npi] [nvarchar](11) NULL,
	[Title] [nvarchar](150) NULL,
	[EffectiveDate] [datetime] NULL,
	[PercentOwnership] [decimal](5, 2) NULL,
	[PharmacistLicense] [nvarchar](50) NULL,
	[StateIssueLicense] [nvarchar](50) NULL,
	[LicenseExpirationDate] [datetime] NULL,
	[Entity] [nvarchar](250) NULL,
	[DBA] [nvarchar](250) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[SSN] [nvarchar](12) NULL,
	[FEIN] [nvarchar](12) NULL,
	[DOB] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[CriminalOffense] [bit] NULL,
	[HasOwnershipWithOtherStore] [bit] NULL,
	[HasRelationshipWithOtherOwner] [bit] NULL,
	[IsPIC] [bit] NULL,
	[IsControlEntity] [bit] NULL,
	[IsTechnician] [bit] NULL,
	[IsCertifiedTechnician] [bit] NULL,
	[IsPharmacist] [bit] NULL,
	[IsStoreManager] [bit] NULL,
	[PharState] [nvarchar](50) NULL,
	[PharExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[IsOwner] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyControlEntity_temp]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntity_temp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NOT NULL,
	[Type] [nvarchar](150) NULL,
	[LocationType] [nvarchar](50) NULL,
	[npi] [nvarchar](11) NULL,
	[Title] [nvarchar](150) NULL,
	[EffectiveDate] [datetime] NULL,
	[PercentOwnership] [decimal](5, 2) NULL,
	[PharmacistLicense] [nvarchar](50) NULL,
	[StateIssueLicense] [nvarchar](50) NULL,
	[LicenseExpirationDate] [datetime] NULL,
	[Entity] [nvarchar](250) NULL,
	[DBA] [nvarchar](250) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[SSN] [nvarchar](12) NULL,
	[FEIN] [nvarchar](12) NULL,
	[DOB] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[CriminalOffense] [bit] NULL,
	[HasOwnershipWithOtherStore] [bit] NULL,
	[HasRelationshipWithOtherOwner] [bit] NULL,
	[IsPIC] [bit] NULL,
	[IsControlEntity] [bit] NULL,
	[IsTechnician] [bit] NULL,
	[IsCertifiedTechnician] [bit] NULL,
	[IsPharmacist] [bit] NULL,
	[IsStoreManager] [bit] NULL,
	[PharState] [nvarchar](50) NULL,
	[PharExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[IsOwner] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyControlEntity_webtest]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntity_webtest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NOT NULL,
	[Type] [nvarchar](150) NULL,
	[LocationType] [nvarchar](50) NULL,
	[npi] [nvarchar](11) NULL,
	[Title] [nvarchar](150) NULL,
	[EffectiveDate] [datetime] NULL,
	[PercentOwnership] [decimal](5, 2) NULL,
	[PharmacistLicense] [nvarchar](50) NULL,
	[StateIssueLicense] [nvarchar](50) NULL,
	[LicenseExpirationDate] [datetime] NULL,
	[Entity] [nvarchar](250) NULL,
	[DBA] [nvarchar](250) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[SSN] [nvarchar](12) NULL,
	[FEIN] [nvarchar](12) NULL,
	[DOB] [datetime] NULL,
	[Address] [nvarchar](250) NULL,
	[Address2] [nvarchar](250) NULL,
	[City] [nvarchar](250) NULL,
	[State] [nvarchar](15) NULL,
	[Zip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[CriminalOffense] [bit] NULL,
	[HasOwnershipWithOtherStore] [bit] NULL,
	[HasRelationshipWithOtherOwner] [bit] NULL,
	[IsPIC] [bit] NULL,
	[IsControlEntity] [bit] NULL,
	[IsTechnician] [bit] NULL,
	[IsCertifiedTechnician] [bit] NULL,
	[IsPharmacist] [bit] NULL,
	[IsStoreManager] [bit] NULL,
	[PharState] [nvarchar](50) NULL,
	[PharExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[IsOwner] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyControlEntityCert]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyControlEntityCert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ControlEntityId] [int] NULL,
	[CertName] [nvarchar](150) NULL,
	[CertType] [nvarchar](150) NULL,
	[CertProfession] [nvarchar](150) NULL,
	[CertNumber] [nvarchar](150) NULL,
	[IssuedDate] [smalldatetime] NULL,
	[ExpiredDate] [smalldatetime] NULL,
	[StateIssued] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_SurveyControlEntityCert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyDocument]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](150) NULL,
	[Section] [nvarchar](150) NULL,
	[Index] [int] NULL,
	[ColumnName] [nvarchar](250) NULL,
	[QuestionId] [int] NULL,
	[OptionId] [int] NULL,
	[DefaultValue] [nvarchar](max) NULL,
	[Format] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_SurveyDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyDocument_20150324]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyDocument_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[QuestionId] [int] NULL,
	[OptionId] [int] NULL,
	[Source] [nvarchar](max) NULL,
	[DocumentName] [nvarchar](150) NULL,
	[FieldNumber] [nvarchar](50) NULL,
	[FieldName] [nvarchar](250) NULL,
	[Format] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyDownloadOpts]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyDownloadOpts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[jsonOptions] [nvarchar](max) NULL,
	[ParentEntityId] [nvarchar](50) NULL,
	[EntityType] [nvarchar](350) NULL,
	[EntityIdName] [nvarchar](350) NULL,
	[EntityId] [nvarchar](50) NULL,
	[Section] [nvarchar](350) NULL,
	[SurveyId] [int] NULL,
	[QuestionId] [int] NULL,
	[PMId] [int] NULL,
	[IsActive] [bit] NULL,
	[DefaultColumns] [nvarchar](max) NULL,
 CONSTRAINT [PK_SurveyDownloadOpts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyEditor]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyEditor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logins] [nvarchar](500) NULL,
	[SurveyId] [int] NULL,
 CONSTRAINT [PK_Editors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyFlag]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyFlag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[FlagName] [nvarchar](50) NULL,
	[OptionIds] [nvarchar](500) NULL,
	[OptionValues] [nvarchar](max) NULL,
	[Emails] [nvarchar](500) NULL,
	[EmailSubject] [nvarchar](350) NULL,
	[EmailContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[EntityIds] [nvarchar](max) NULL,
 CONSTRAINT [PK_SurveyFlag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyFlag_20150324]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyFlag_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[FlagName] [nvarchar](50) NULL,
	[OptionIds] [nvarchar](500) NULL,
	[OptionValues] [nvarchar](max) NULL,
	[Emails] [nvarchar](500) NULL,
	[EmailSubject] [nvarchar](350) NULL,
	[EmailContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[EntityIds] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyOption]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOption](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Index] [smallint] NULL,
	[Html] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsTrackChange] [bit] NULL,
	[IsReadOnly] [bit] NULL,
	[DefaultValue] [nvarchar](max) NULL,
	[EnableQIds] [nvarchar](50) NULL,
	[DisableQIds] [nvarchar](50) NULL,
	[ScopeName] [nvarchar](250) NULL,
	[opFormat] [nvarchar](50) NULL,
	[MaxLength] [smallint] NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyOwnerRelationship]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOwnerRelationship](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyControlEntityId] [int] NOT NULL,
	[Relationship] [nvarchar](150) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_SurveyOwnerRelationship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyOwnership]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOwnership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyControlEntityId] [int] NOT NULL,
	[OtherLegalName] [nvarchar](250) NULL,
	[OtherNPI] [nvarchar](11) NULL,
	[OtherDBA] [nvarchar](250) NULL,
	[OtherNCPDP] [nvarchar](8) NULL,
	[OtherAddress] [nvarchar](250) NULL,
	[OtherAddress2] [nvarchar](250) NULL,
	[OtherCity] [nvarchar](250) NULL,
	[OtherState] [nvarchar](15) NULL,
	[OtherZip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_OtherOwnerShipDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyParticipator]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyParticipator](
	[PMId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Participators] PRIMARY KEY CLUSTERED 
(
	[PMId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyQuestion]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Index] [smallint] NULL,
	[IsEnable] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[IsRequired] [bit] NULL,
	[RequiredValue] [nvarchar](max) NULL,
	[ShowFunction] [nvarchar](max) NULL,
	[ValidateFunction] [nvarchar](200) NULL,
	[ShowSurveyOptionId] [int] NULL,
	[Type] [nvarchar](250) NOT NULL,
	[ChildIds] [nvarchar](550) NULL,
	[ParentId] [int] NULL,
	[IsMultipleAnswers] [bit] NULL,
	[Section] [nvarchar](350) NULL,
	[qHtml] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveySchedule]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveySchedule](
	[Id] [int] NOT NULL,
	[SurveyIds] [nvarchar](300) NULL,
	[ParticipatorPMId] [int] NULL,
	[IsCompleted] [bit] NULL,
	[IsStarted] [bit] NULL,
	[NotifyStartDate] [datetime] NULL,
	[NotifyEndDate] [datetime] NULL,
 CONSTRAINT [PK_SurveySchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveySetting]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveySetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_SurveySetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyTrackChange]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyTrackChange](
	[Id] [int] NOT NULL,
	[SurveyId] [int] NULL,
	[OptionId] [int] NULL,
 CONSTRAINT [PK_TrackChange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyTrackNote]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyTrackNote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrackChangeId] [int] NULL,
	[PMId] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_SurveyTrackNote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_pmid]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_pmid](
	[pmid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tempSpecialty]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempSpecialty](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[Member Status] [varchar](41) NOT NULL,
	[PM Contact] [varchar](255) NOT NULL,
	[Email] [varchar](255) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NOT NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NOT NULL,
	[ComputerSoftware] [varchar](255) NOT NULL,
	[TMFirstName] [varchar](35) NULL,
	[TMLastName] [varchar](35) NULL,
	[Enrollment completed?] [varchar](3) NOT NULL,
	[Enrollment date] [varchar](10) NULL,
	[Enrollment contact] [nvarchar](500) NULL,
	[Training completed?] [varchar](3) NOT NULL,
	[Training completion date] [varchar](10) NULL,
	[Person completing training] [nvarchar](500) NULL,
	[Post test completed?] [varchar](3) NOT NULL,
	[Requested Start date] [nvarchar](500) NULL,
	[Go live date] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_RCRebate_2013]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_RCRebate_2013](
	[TM] [varchar](20) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](25) NULL,
	[Parent#] [varchar](25) NULL,
	[API#] [varchar](25) NULL,
	[AAP Eff] [varchar](25) NULL,
	[AAP Quit] [varchar](25) NULL,
	[Description] [varchar](100) NULL,
	[Affiliate] [varchar](100) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[St] [varchar](100) NULL,
	[Contact] [varchar](150) NULL,
	[MC Network] [varchar](150) NULL,
	[PP Volume 2013Q1] [float] NULL,
	[PP Rebate 2013Q1] [float] NULL,
	[PP Volume 2013Q2] [float] NULL,
	[PP Rebate 2013Q2] [float] NULL,
	[PP Volume 2013Q3] [float] NULL,
	[PP Rebate 2013Q3] [float] NULL,
	[PP Volume 2013Q4] [float] NULL,
	[PP Rebate 2013Q4] [float] NULL,
	[Total PP Rebate 2013] [float] NULL,
	[Q1 API Whse Rebate] [float] NULL,
	[Q1 API Generic Rebate%] [float] NULL,
	[Q1 API Brand Credits Disbursed] [float] NULL,
	[Q1 API Accelerated Pay Discount] [float] NULL,
	[Q2 API Whse Rebate] [float] NULL,
	[Q2 API Generic Rebate%] [float] NULL,
	[Q2 API Brand Credits Disbursed] [float] NULL,
	[Q2 API Accelerated Pay Discount] [float] NULL,
	[Q3 API Whse Rebate] [float] NULL,
	[Q3 API Generic Rebate%] [float] NULL,
	[Q3 API Brand Credits Disbursed] [float] NULL,
	[Q3 API Accelerated Pay Discount] [float] NULL,
	[Q4 API Whse Rebate] [float] NULL,
	[Q4 API Generic Rebate%] [float] NULL,
	[Q4 API Brand Credits Disbursed] [float] NULL,
	[Q4 API Accelerated Pay Discount] [float] NULL,
	[Total API Whse Rebate 2013] [float] NULL,
	[Total API Brand Credits Disbursed 2013] [float] NULL,
	[Total API Accelerated Pay Discount 2013] [float] NULL,
	[HV Incentive 0113] [float] NULL,
	[HV COG Reduction 0113] [float] NULL,
	[HV Incentive 0213] [float] NULL,
	[HV COG Reduction 0213] [float] NULL,
	[HV Incentive 0313] [float] NULL,
	[HV COG Reduction 0313] [float] NULL,
	[HV Incentive 0413] [float] NULL,
	[HV COG Reduction 0413] [float] NULL,
	[HV Incentive 0513] [float] NULL,
	[HV COG Reduction 0513] [float] NULL,
	[HV Incentive 0613] [float] NULL,
	[HV COG Reduction 0613] [float] NULL,
	[HV Incentive 0713] [float] NULL,
	[HV COG Reduction 0713] [float] NULL,
	[HV Incentive 0813] [float] NULL,
	[HV COG Reduction 0813] [float] NULL,
	[HV Incentive 0913] [float] NULL,
	[HV COG Reduction 0913] [float] NULL,
	[HV Incentive 1013] [float] NULL,
	[HV COG Reduction 1013] [float] NULL,
	[HV Incentive 1113] [float] NULL,
	[HV COG Reduction 1113] [float] NULL,
	[HV Incentive 1213] [float] NULL,
	[HV COG Reduction 1213] [float] NULL,
	[Total HV Incentive 2013] [float] NULL,
	[Conf Volume 0413] [float] NULL,
	[Conf Rebate 0413] [float] NULL,
	[Conf Volume 0513] [float] NULL,
	[Conf Rebate 0513] [float] NULL,
	[Total Conf Volume 2013] [float] NULL,
	[Total Conf Rebate 2013] [float] NULL,
	[Cardinal Rebates 2013Q1] [float] NULL,
	[Cardinal Rebates 2013Q2] [float] NULL,
	[Cardinal Rebates 2013Q3] [float] NULL,
	[Cardinal Rebates 2013Q4] [float] NULL,
	[Total Cardinal Rebates 2013] [float] NULL,
	[01/13 Source Sales] [float] NULL,
	[01/13 AAP Gen Rebate] [float] NULL,
	[01/13 Avg%] [float] NULL,
	[01/13 HRTA%] [float] NULL,
	[01/13 PaymentMethod] [varchar](50) NULL,
	[02/13 Source Sales] [float] NULL,
	[02/13 AAP Gen Rebate] [float] NULL,
	[02/13 Avg%] [float] NULL,
	[02/13 HRTA%] [float] NULL,
	[02/13 PaymentMethod] [varchar](50) NULL,
	[03/13 Source Sales] [float] NULL,
	[03/13 AAP Gen Rebate] [float] NULL,
	[03/13 Avg%] [float] NULL,
	[03/13 HRTA%] [float] NULL,
	[03/13 PaymentMethod] [varchar](50) NULL,
	[04/13 Source Sales] [float] NULL,
	[04/13 AAP Gen Rebate] [float] NULL,
	[04/13 Avg%] [float] NULL,
	[04/13 HRTA%] [float] NULL,
	[04/13 PaymentMethod] [varchar](50) NULL,
	[05/13 Source Sales] [float] NULL,
	[05/13 AAP Gen Rebate] [float] NULL,
	[05/13 Avg%] [float] NULL,
	[05/13 HRTA%] [float] NULL,
	[05/13 PaymentMethod] [varchar](50) NULL,
	[06/13 Source Sales] [float] NULL,
	[06/13 AAP Gen Rebate] [float] NULL,
	[06/13 Avg%] [float] NULL,
	[06/13 HRTA%] [float] NULL,
	[06/13 PaymentMethod] [varchar](50) NULL,
	[07/13 Source Sales] [float] NULL,
	[07/13 AAP Gen Rebate] [float] NULL,
	[07/13 Avg%] [float] NULL,
	[07/13 HRTA%] [float] NULL,
	[07/13 PaymentMethod] [varchar](50) NULL,
	[08/13 Source Sales] [float] NULL,
	[08/13 AAP Gen Rebate] [float] NULL,
	[08/13 Avg%] [float] NULL,
	[08/13 HRTA%] [float] NULL,
	[08/13 PaymentMethod] [varchar](50) NULL,
	[09/13 Source Sales] [float] NULL,
	[09/13 AAP Gen Rebate] [float] NULL,
	[09/13 Avg%] [float] NULL,
	[09/13 HRTA%] [float] NULL,
	[09/13 PaymentMethod] [varchar](50) NULL,
	[10/13 Source Sales] [float] NULL,
	[10/13 AAP Gen Rebate] [float] NULL,
	[10/13 Avg%] [float] NULL,
	[10/13 HRTA%] [float] NULL,
	[10/13 PaymentMethod] [varchar](50) NULL,
	[11/13 Source Sales] [float] NULL,
	[11/13 AAP Gen Rebate] [float] NULL,
	[11/13 Avg%] [float] NULL,
	[11/13 HRTA%] [float] NULL,
	[11/13 PaymentMethod] [varchar](50) NULL,
	[12/13 Source Sales] [float] NULL,
	[12/13 AAP Gen Rebate] [float] NULL,
	[12/13 Avg%] [float] NULL,
	[12/13 HRTA%] [float] NULL,
	[12/13 PaymentMethod] [varchar](50) NULL,
	[Total CH AAP Gen Rebate 2013] [float] NULL,
	[Contract Performance Rebate 2013] [float] NULL,
	[Planogram Rebate 2013] [float] NULL,
	[API Generic Incentive 2013] [float] NULL,
	[AAP Patronage Dividend 2013] [float] NULL,
	[Total YTD All Rebates 2013] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_RCVolume_2013]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_RCVolume_2013](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](10) NULL,
	[AAP Quit] [varchar](10) NULL,
	[AAP Elite] [varchar](10) NULL,
	[AAP Elite Termed] [varchar](10) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](200) NULL,
	[ChainCode] [varchar](20) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[Contact] [varchar](100) NULL,
	[Whse Acct Date Opened] [varchar](10) NULL,
	[Status] [varchar](100) NULL,
	[Wholesaler] [varchar](100) NULL,
	[API Jan 13 Brand] [float] NULL,
	[API Jan 13 Generic] [float] NULL,
	[API Jan 13 OTC] [float] NULL,
	[API Jan 13 Total Whse] [float] NULL,
	[API Feb 13 Brand] [float] NULL,
	[API Feb 13 Generic] [float] NULL,
	[API Feb 13 OTC] [float] NULL,
	[API Feb 13 Total Whse] [float] NULL,
	[API Mar 13 Brand] [float] NULL,
	[API Mar 13 Generic] [float] NULL,
	[API Mar 13 OTC] [float] NULL,
	[API Mar 13 Total Whse] [float] NULL,
	[API Apr 13 Brand] [float] NULL,
	[API Apr 13 Generic] [float] NULL,
	[API Apr 13 OTC] [float] NULL,
	[API Apr 13 Total Whse] [float] NULL,
	[API May 13 Brand] [float] NULL,
	[API May 13 Generic] [float] NULL,
	[API May 13 OTC] [float] NULL,
	[API May 13 Total Whse] [float] NULL,
	[API Jun 13 Brand] [float] NULL,
	[API Jun 13 Generic] [float] NULL,
	[API Jun 13 OTC] [float] NULL,
	[API Jun 13 Total Whse] [float] NULL,
	[API Jul 13 Brand] [float] NULL,
	[API Jul 13 Generic] [float] NULL,
	[API Jul 13 OTC] [float] NULL,
	[API Jul 13 Total Whse] [float] NULL,
	[API Aug 13 Brand] [float] NULL,
	[API Aug 13 Generic] [float] NULL,
	[API Aug 13 OTC] [float] NULL,
	[API Aug 13 Total Whse] [float] NULL,
	[API Sep 13 Brand] [float] NULL,
	[API Sep 13 Generic] [float] NULL,
	[API Sep 13 OTC] [float] NULL,
	[API Sep 13 Total Whse] [float] NULL,
	[API Oct 13 Brand] [float] NULL,
	[API Oct 13 Generic] [float] NULL,
	[API Oct 13 OTC] [float] NULL,
	[API Oct 13 Total Whse] [float] NULL,
	[API Nov 13 Brand] [float] NULL,
	[API Nov 13 Generic] [float] NULL,
	[API Nov 13 OTC] [float] NULL,
	[API Nov 13 Total Whse] [float] NULL,
	[API Dec 13 Brand] [float] NULL,
	[API Dec 13 Generic] [float] NULL,
	[API Dec 13 OTC] [float] NULL,
	[API Dec 13 Total Whse] [float] NULL,
	[API Jan 14 Brand] [float] NULL,
	[API Jan 14 Generic] [float] NULL,
	[API Jan 14 OTC] [float] NULL,
	[API Jan 14 Total Whse] [float] NULL,
	[API Total Brand Sales] [float] NULL,
	[API Total Generic Sales] [float] NULL,
	[API Total OTC Sales] [float] NULL,
	[API TOTAL SALES] [float] NULL,
	[CAH Dec 12 AAP Brand] [float] NULL,
	[CAH Dec 12 AAP Src Generics] [float] NULL,
	[CAH Dec 12 AAP Other Sales] [float] NULL,
	[CAH Dec 12 AAP Total Sales] [float] NULL,
	[CAH Jan 13 AAP Brand] [float] NULL,
	[CAH Jan 13 AAP Src Generics] [float] NULL,
	[CAH Jan 13 AAP Other Sales] [float] NULL,
	[CAH Jan 13 AAP Total Sales] [float] NULL,
	[CAH Feb 13 AAP Brand] [float] NULL,
	[CAH Feb 13 AAP Src Generics] [float] NULL,
	[CAH Feb 13 AAP Other Sales] [float] NULL,
	[CAH Feb 13 AAP Total Sales] [float] NULL,
	[CAH Mar 13 AAP Brand] [float] NULL,
	[CAH Mar 13 AAP Src Generics] [float] NULL,
	[CAH Mar 13 AAP Other Sales] [float] NULL,
	[CAH Mar 13 AAP Total Sales] [float] NULL,
	[CAH Apr 13 AAP Brand] [float] NULL,
	[CAH Apr 13 AAP Src Generics] [float] NULL,
	[CAH Apr 13 AAP Other Sales] [float] NULL,
	[CAH Apr 13 AAP Total Sales] [float] NULL,
	[CAH May 13 AAP Brand] [float] NULL,
	[CAH May 13 AAP Src Generics] [float] NULL,
	[CAH May 13 AAP Other Sales] [float] NULL,
	[CAH May 13 AAP Total Sales] [float] NULL,
	[CAH Jun 13 AAP Brand] [float] NULL,
	[CAH Jun 13 AAP Src Generics] [float] NULL,
	[CAH Jun 13 AAP Other Sales] [float] NULL,
	[CAH Jun 13 AAP Total Sales] [float] NULL,
	[CAH Jul 13 AAP Brand] [float] NULL,
	[CAH Jul 13 AAP Src Generics] [float] NULL,
	[CAH Jul 13 AAP Other Sales] [float] NULL,
	[CAH Jul 13 AAP Total Sales] [float] NULL,
	[CAH Aug 13 AAP Brand] [float] NULL,
	[CAH Aug 13 AAP Src Generics] [float] NULL,
	[CAH Aug 13 AAP Other Sales] [float] NULL,
	[CAH Aug 13 AAP Total Sales] [float] NULL,
	[CAH Sep 13 AAP Brand] [float] NULL,
	[CAH Sep 13 AAP Src Generics] [float] NULL,
	[CAH Sep 13 AAP Other Sales] [float] NULL,
	[CAH Sep 13 AAP Total Sales] [float] NULL,
	[CAH Oct 13 AAP Brand] [float] NULL,
	[CAH Oct 13 AAP Src Generics] [float] NULL,
	[CAH Oct 13 AAP Other Sales] [float] NULL,
	[CAH Oct 13 AAP Total Sales] [float] NULL,
	[CAH Nov 13 AAP Brand] [float] NULL,
	[CAH Nov 13 AAP Src Generics] [float] NULL,
	[CAH Nov 13 AAP Other Sales] [float] NULL,
	[CAH Nov 13 AAP Total Sales] [float] NULL,
	[CAH Dec 13 AAP Brand] [float] NULL,
	[CAH Dec 13 AAP Src Generics] [float] NULL,
	[CAH Dec 13 AAP Other Sales] [float] NULL,
	[CAH Dec 13 AAP Total Sales] [float] NULL,
	[CAH Total Brand Sales] [float] NULL,
	[CAH Total Src Generic Sales] [float] NULL,
	[CAH Total Other Sales] [float] NULL,
	[CAH TOTAL SALES] [float] NULL,
	[ML Dec 12 Volume] [float] NULL,
	[ML Jan 13 Volume] [float] NULL,
	[ML Feb 13 Volume] [float] NULL,
	[ML Mar 13 Volume] [float] NULL,
	[ML Apr 13 Volume] [float] NULL,
	[ML May 13 Volume] [float] NULL,
	[ML Jun 13 Volume] [float] NULL,
	[ML Jul 13 Volume] [float] NULL,
	[ML Aug 13 Volume] [float] NULL,
	[ML Sep 13 Volume] [float] NULL,
	[ML Oct 13 Volume] [float] NULL,
	[ML Nov 13 Volume] [float] NULL,
	[ML Dec 13 Volume] [float] NULL,
	[ML TOTAL SALES] [float] NULL,
	[Total Dec 12 Combined Mthly Sales] [float] NULL,
	[Total Jan 13 Combined Mthly Sales] [float] NULL,
	[Total Feb 13 Combined Mthly Sales] [float] NULL,
	[Total Mar 13 Combined Mthly Sales] [float] NULL,
	[Total Apr 13 Combined Mthly Sales] [float] NULL,
	[Total May 13 Combined Mthly Sales] [float] NULL,
	[Total Jun 13 Combined Mthly Sales] [float] NULL,
	[Total Jul 13 Combined Mthly Sales] [float] NULL,
	[Total Aug 13 Combined Mthly Sales] [float] NULL,
	[Total Sep 13 Combined Mthly Sales] [float] NULL,
	[Total Oct 13 Combined Mthly Sales] [float] NULL,
	[Total Nov 13 Combined Mthly Sales] [float] NULL,
	[Total Dec 13 Combined Mthly Sales] [float] NULL,
	[Total Jan 14 Combined Mthly Sales] [float] NULL,
	[TOTAL COMBINED SALES] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MCenter_Credentialing043015]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCenter_Credentialing043015](
	[NCPDP] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[Account DBA] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Territory] [nvarchar](255) NULL,
	[TM Name] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MCenter_Credentialling042915]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCenter_Credentialling042915](
	[NCPDP] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Accountname] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM2] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MCenter_Notvoted042215]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCenter_Notvoted042215](
	[Username] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[Department] [int] NULL,
	[FAX] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_RLGLReport2_100814]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RLGLReport2_100814](
	[UPC] [int] NOT NULL,
	[RLGL] [varchar](1) NOT NULL,
	[LossGross] [float] NULL,
	[LossNet] [float] NULL,
	[test] [varchar](4) NOT NULL,
	[APIGrossPerUnit] [numeric](18, 4) NULL,
	[APINetPerUnit] [numeric](21, 6) NULL,
	[CAHGrossPerUnit] [float] NULL,
	[CAHNetPerUnit] [float] NULL,
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [datetime] NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[Day Supply] [int] NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[Tx Response] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[RfNbr] [int] NULL,
	[desi2] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UpdatedOn] [datetime] NULL,
	[BB] [numeric](11, 5) NULL,
	[WHN] [numeric](11, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_RLGLReport2_100814_test1000]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RLGLReport2_100814_test1000](
	[UPC] [int] NOT NULL,
	[RedLight] [int] NOT NULL,
	[LossGross] [float] NULL,
	[LossNet] [float] NULL,
	[test] [varchar](4) NOT NULL,
	[APIGrossPerUnit] [numeric](18, 4) NULL,
	[APINetPerUnit] [numeric](21, 6) NULL,
	[CAHGrossPerUnit] [float] NULL,
	[CAHNetPerUnit] [float] NULL,
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [datetime] NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[Day Supply] [int] NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[Tx Response] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[RfNbr] [int] NULL,
	[desi2] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UpdatedOn] [datetime] NULL,
	[BB] [numeric](11, 5) NULL,
	[WHN] [numeric](11, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_UPStatus_withRLGL]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UPStatus_withRLGL](
	[RLGL] [varchar](15) NULL,
	[PharmID] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PlanName] [nvarchar](200) NULL,
	[NDC] [nvarchar](20) NULL,
	[RxNbr] [nvarchar](50) NULL,
	[RxDate] [datetime] NULL,
	[DrugName] [varchar](25) NULL,
	[Result] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NULL,
	[Source] [varchar](18) NOT NULL,
	[CreatedOn] [smalldatetime] NULL,
	[CAHPriceStatus] [varchar](14) NOT NULL,
	[APIPriceStatus] [varchar](14) NOT NULL,
	[UpdatedOn] [smalldatetime] NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpCompletedPMID]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpCompletedPMID](
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpResultPharmacy]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpResultPharmacy](
	[PMID] [int] NOT NULL,
	[NCPDP] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[OwnerName] [varchar](200) NULL,
	[IsStoreComplianceGuardian] [int] NULL,
	[IsStoreStaffGuard] [int] NULL,
	[IsStoreAAP] [int] NULL,
	[IsStoreManagedCare] [int] NULL,
	[IsStoreNonManagedCare] [int] NULL,
	[IsStoreNPP] [int] NULL,
	[Employees] [int] NULL,
	[EmployeeLastModifiedDate] [datetime] NULL,
	[EmployeeLastCreatedDate] [datetime] NULL,
	[ExclusionLastFoundDate] [datetime] NULL,
	[Exclusions] [int] NULL,
	[ComplianceGuardianStartDate] [datetime] NULL,
	[ComplianceGuardianEndDate] [datetime] NULL,
	[StaffGuardStartDate] [datetime] NULL,
	[StaffGuardEndDate] [datetime] NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[Address] [varchar](201) NULL,
	[State] [varchar](2) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[NPI] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[ChainCode] [int] NULL,
	[MCQuitDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[IsNPP] [smallint] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[TMFirstName] [varchar](35) NULL,
	[TMLastName] [varchar](35) NULL,
	[TM] [varchar](2) NULL,
	[EmployeeCheckListStatus] [int] NOT NULL,
	[HIPAAManualStatus] [int] NULL,
	[FWAManualStatus] [int] NULL,
	[HIPAATrainingStatus] [int] NULL,
	[FWATrainingStatus] [int] NULL,
	[EmployeesWithOutAliasNames] [int] NULL,
	[HIPAATrainedEmployees] [int] NULL,
	[FWATrainedEmployees] [int] NULL,
	[AttestationStatus] [int] NOT NULL,
	[Attestation Date] [varchar](30) NULL,
	[Licenses suspended] [nvarchar](500) NULL,
	[Operate on Clear status] [nvarchar](500) NULL,
	[Licenses suspended in past] [nvarchar](500) NULL,
	[Disciplinary action] [nvarchar](500) NULL,
	[Pharmacist not covered Insurance] [nvarchar](500) NULL,
	[Pharmacists unrestricted license] [nvarchar](500) NULL,
	[PharmacyNotExcluded] [nvarchar](500) NULL,
	[PersonnelNotExcluded] [nvarchar](500) NULL,
	[Review Personnel on OIG GSA] [nvarchar](500) NULL,
	[Disclosure of disciplinary actions] [nvarchar](500) NULL,
	[RecordRetention10yr] [nvarchar](500) NULL,
	[FWATraining] [nvarchar](500) NULL,
	[LogPersonnelFWATraining] [nvarchar](500) NULL,
	[PharmacyMaintainsLicensesInsurance] [nvarchar](500) NULL,
	[PersonnelMaintainsLicensesCertifications] [nvarchar](500) NULL,
	[StandardsOfConductInWriting] [nvarchar](500) NULL,
	[Conflict of Interest Policy] [nvarchar](500) NULL,
	[DesignatedComplianceOfficer] [nvarchar](500) NULL,
	[ProceduresToDetectFWA] [nvarchar](500) NULL,
	[OBRA 90 rules compliance] [nvarchar](500) NULL,
	[Pharmacy Name] [nvarchar](500) NULL,
	[Person Attesting] [nvarchar](500) NULL,
	[Compliance Officer name] [nvarchar](500) NULL,
	[HasFlag] [varchar](1) NULL,
	[IsOigGsaReportGenerated] [int] NULL,
	[IsOigGsaReportEmailed] [int] NULL,
	[IsOigGsaReportSuccess] [int] NULL,
	[IsOigGsaReportValidEmail] [int] NULL,
	[LastOigGsaReportGenerationAttemptedDate] [datetime] NULL,
	[AttestationFlagStr] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UPStateMAC]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPStateMAC](
	[State] [char](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UPStatus]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UPStatus](
	[PharmID] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PlanName] [nvarchar](200) NULL,
	[NDC] [nvarchar](20) NULL,
	[RxNbr] [nvarchar](50) NULL,
	[RxDate] [datetime] NULL,
	[DrugName] [varchar](25) NULL,
	[Result] [nvarchar](100) NULL,
	[Status] [nvarchar](50) NULL,
	[Source] [varchar](18) NOT NULL,
	[CreatedOn] [smalldatetime] NULL,
	[CAHPriceStatus] [varchar](14) NOT NULL,
	[APIPriceStatus] [varchar](14) NOT NULL,
	[UpdatedOn] [smalldatetime] NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userdata_noPMID]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userdata_noPMID](
	[login] [nvarchar](50) NULL,
	[roleid] [int] NULL,
	[execpassword] [nvarchar](50) NULL,
	[rolename] [nvarchar](100) NULL,
	[defaultpmid] [int] NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[perms] [varchar](255) NULL,
	[pmid] [int] NULL,
	[pmparentid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[ncpdp] [varchar](20) NULL,
	[dea] [varchar](50) NULL,
	[deaexp] [varchar](10) NULL,
	[npi] [varchar](50) NULL,
	[statelicno] [varchar](30) NULL,
	[statelicexpdate] [datetime] NULL,
	[mcquitdate] [datetime] NULL,
	[accountname] [varchar](65) NULL,
	[corporatename] [varchar](100) NULL,
	[addr1] [varchar](100) NULL,
	[addr2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[isAPI] [int] NULL,
	[isAAP] [int] NULL,
	[isMC] [int] NULL,
	[isTSROnly] [int] NULL,
	[isElite] [int] NULL,
	[parent_account] [varchar](65) NULL,
	[TMName] [varchar](71) NULL,
	[GenLiabCarrier] [varchar](50) NULL,
	[GenInsExpDate] [varchar](10) NULL,
	[ProfLiabCarrier] [varchar](50) NULL,
	[ProfLiabInsExpDate] [varchar](10) NULL,
	[software] [nvarchar](255) NULL,
	[isClaimData] [int] NULL,
	[wholesaler] [varchar](2) NULL,
	[description] [varchar](255) NULL,
	[CommunicationPreference] [varchar](5) NULL,
	[affiliate] [varchar](125) NULL,
	[affiliate_directpay] [int] NULL,
	[chaincode] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usergroup]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergroup](
	[usergroupid] [int] IDENTITY(1,1) NOT NULL,
	[login_parent] [varchar](50) NOT NULL,
	[login_child] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlogin_new]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlogin_new](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL,
	[execpassword] [nvarchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_userlogin_new] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlogin_old_20190319]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlogin_old_20190319](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL,
	[execpassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_userlogin_1] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userloginbak]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userloginbak](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL,
	[execpassword] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userloginnew]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userloginnew](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL,
 CONSTRAINT [PK_userlogin] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrole]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [nvarchar](100) NULL,
 CONSTRAINT [PK_userrole] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userstore]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userstore](
	[loginid] [int] NOT NULL,
	[pmid] [int] NOT NULL,
 CONSTRAINT [PK_userstore] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC,
	[pmid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebLogAudit]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLogAudit](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[WebPage] [varchar](8000) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_WebLogAudit_RowID] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[FairShareProgram]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[FairShareProgram](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustNum] [varchar](100) NOT NULL,
	[ProdNum] [varchar](100) NOT NULL,
	[ProdDesc] [nvarchar](255) NOT NULL,
	[Count] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[MonthlyQty] [int] NOT NULL,
	[RequestedQty] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
	[NDC] [varchar](15) NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[ShipWeekOf] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
	[DateKey] [int] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Staging_FairShareProgram] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_Staging_FairshareProgram] UNIQUE NONCLUSTERED 
(
	[CustNum] ASC,
	[ProdNum] ASC,
	[BeginDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[userlogin]    Script Date: 12/22/2020 3:51:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[userlogin](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL,
	[execpassword] [nvarchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Staging_userlogin] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APISalesDetail_Web_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APISalesInvoice_Web_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[BusinessAnalysisCalculator] ADD  CONSTRAINT [DF__tmp_ms_xx__RowCr__54C30A1C]  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[BusinessAnalysisCalculator] ADD  CONSTRAINT [DF_BusinessAnalysisCalculator_NumberOfMultiStoreOperation]  DEFAULT ((0)) FOR [NumberOfMultiStoreOperation]
GO
ALTER TABLE [dbo].[CA_CheckResultsHistory] ADD  CONSTRAINT [DF_CA_CheckResultsHistory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_CheckResultsHistory] ADD  CONSTRAINT [DF_CA_CheckResultsHistory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_OIG] ADD  CONSTRAINT [DF_CA_OIG_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_OIG] ADD  CONSTRAINT [DF_CA_OIG_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_OIG_TEMP] ADD  CONSTRAINT [DF_CA_OIG_TEMP_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_OIG_TEMP] ADD  CONSTRAINT [DF_CA_OIG_TEMP_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_SAM] ADD  CONSTRAINT [DF_CA_SAM_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_SAM] ADD  CONSTRAINT [DF_CA_SAM_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_SAM_TEMP] ADD  CONSTRAINT [DF_CA_SAM_TEMP_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_SAM_TEMP] ADD  CONSTRAINT [DF_CA_SAM_TEMP_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_IsHIPPATrained]  DEFAULT ((0)) FOR [IsHIPPATrained]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_IsFWATrained]  DEFAULT ((0)) FOR [IsFWATrained]
GO
ALTER TABLE [dbo].[CA_StoreEmployee_TEMP] ADD  CONSTRAINT [DF_CA_StoreEmployee_TEMP_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee_TEMP] ADD  CONSTRAINT [DF_CA_StoreEmployee_TEMP_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee_TEMP] ADD  CONSTRAINT [DF_CA_StoreEmployee_TEMP_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CA_StoreEmployee_TEMP] ADD  CONSTRAINT [DF_CA_StoreEmployee_TEMP_IsHIPPATrained]  DEFAULT ((0)) FOR [IsHIPPATrained]
GO
ALTER TABLE [dbo].[CA_StoreEmployee_TEMP] ADD  CONSTRAINT [DF_CA_StoreEmployee_TEMP_IsFWATrained]  DEFAULT ((0)) FOR [IsFWATrained]
GO
ALTER TABLE [dbo].[content_banners_homepage] ADD  CONSTRAINT [DF_content_banners_homepage_externalLink]  DEFAULT ((0)) FOR [externalLink]
GO
ALTER TABLE [dbo].[content_banners_homepage] ADD  CONSTRAINT [DF_content_banners_homepage_dateAdded]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[CredentialDocumentTracking] ADD  CONSTRAINT [DF_SurveyDocDet_send]  DEFAULT ((0)) FOR [send]
GO
ALTER TABLE [dbo].[FairShare] ADD  CONSTRAINT [DF_FairShare_Last Updated]  DEFAULT (getdate()) FOR [Last Updated]
GO
ALTER TABLE [dbo].[FairShareProgram] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[FeaturedArticles] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FeaturedMembers] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[login_history_API] ADD  CONSTRAINT [DF_login_history_API_dt]  DEFAULT (getdate()) FOR [dt]
GO
ALTER TABLE [dbo].[MessageCenter_Log] ADD  CONSTRAINT [DF_MessageCenter_Log_date_read]  DEFAULT (getdate()) FOR [date_read]
GO
ALTER TABLE [dbo].[MessageCenter_Messages] ADD  CONSTRAINT [DF_MessageCenter_Messages_date_posted]  DEFAULT (getdate()) FOR [date_posted]
GO
ALTER TABLE [dbo].[PageMaster] ADD  CONSTRAINT [DF_PageMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Program_log] ADD  CONSTRAINT [DF_Program_log_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Rebates2015] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Rebates2016] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[RxCareParticipation] ADD  CONSTRAINT [DF_RxCareParticipation_date_registered]  DEFAULT (getdate()) FOR [date_registered]
GO
ALTER TABLE [dbo].[RxCareParticipationBankInfo] ADD  CONSTRAINT [DF_RxCareParticipationBankInfo_date_registered]  DEFAULT (getdate()) FOR [date_registered]
GO
ALTER TABLE [dbo].[RxCareSelect] ADD  CONSTRAINT [DF_RxCareSelect_date_registered]  DEFAULT (getdate()) FOR [date_registered]
GO
ALTER TABLE [dbo].[ScoreCard_Header] ADD  CONSTRAINT [DF_ScoreCard_Header_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ScoreCard_Header] ADD  CONSTRAINT [DF_ScoreCard_Header_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ScoreCard_Header] ADD  CONSTRAINT [DF_ScoreCard_Header_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ScoreCard_Header] ADD  CONSTRAINT [DF_ScoreCard_Header_ModifiedBy]  DEFAULT (suser_sname()) FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[ScoreCard_Header] ADD  CONSTRAINT [DF_ScoreCard_Header_ModifiedOn]  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[ScoreCardAnthem_Temp] ADD  CONSTRAINT [DF__'ScoreCar__Clien__3EC8DC05]  DEFAULT ('ANTHEM') FOR [Client]
GO
ALTER TABLE [dbo].[ScoreCardAnthem_Temp] ADD  CONSTRAINT [DF__'ScoreCar__File___3FBD003E]  DEFAULT (getdate()) FOR [File_Date]
GO
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_Published]  DEFAULT ((0)) FOR [Published]
GO
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_NotifyWhenCompleted]  DEFAULT ((1)) FOR [NotifyWhenCompleted]
GO
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_FlagAction]  DEFAULT (N'email') FOR [FlagAction]
GO
ALTER TABLE [dbo].[survey_RetailClinics] ADD  CONSTRAINT [DF_survey_RetailClinics_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[SurveyAnswerCL] ADD  CONSTRAINT [DF_SurveyAnswer_IsSubmited]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[SurveyAnswerCL] ADD  CONSTRAINT [DF_SurveyAnswer_CollectionId]  DEFAULT ((0)) FOR [CollectionId]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsPIC]  DEFAULT ((0)) FOR [IsPIC]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsControlEntity]  DEFAULT ((0)) FOR [IsControlEntity]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsTechnician]  DEFAULT ((0)) FOR [IsTechnician]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsCertifiedTechnician]  DEFAULT ((0)) FOR [IsCertifiedTechnician]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsPharmacist]  DEFAULT ((0)) FOR [IsPharmacist]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsStoreManager]  DEFAULT ((0)) FOR [IsStoreManager]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[SurveyControlEntity] ADD  CONSTRAINT [DF_SurveyControlEntity_IsOwner]  DEFAULT ((0)) FOR [IsOwner]
GO
ALTER TABLE [dbo].[SurveyControlEntityCert] ADD  CONSTRAINT [DF_SurveyControlEntityCert_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyControlEntityCert] ADD  CONSTRAINT [DF_SurveyControlEntityCert_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[SurveyDocument] ADD  CONSTRAINT [DF_SurveyDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyDownloadOpts] ADD  CONSTRAINT [DF_SurveyDownloadOpts_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyOption] ADD  CONSTRAINT [DF_SurveyOption_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyOption] ADD  CONSTRAINT [DF_SurveyOption_IsTrackChange]  DEFAULT ((0)) FOR [IsTrackChange]
GO
ALTER TABLE [dbo].[SurveyOption] ADD  CONSTRAINT [DF_SurveyOption_IsReadOnly]  DEFAULT ((0)) FOR [IsReadOnly]
GO
ALTER TABLE [dbo].[SurveyOwnerRelationship] ADD  CONSTRAINT [DF_SurveyOwnerRelationship_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyOwnerRelationship] ADD  CONSTRAINT [DF_SurveyOwnerRelationship_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[SurveyOwnership] ADD  CONSTRAINT [DF_SurveyOwnership_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyOwnership] ADD  CONSTRAINT [DF_SurveyOwnership_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[SurveyQuestion] ADD  CONSTRAINT [DF_SurveyQuestion_IsActive]  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[SurveyQuestion] ADD  CONSTRAINT [DF_SurveyQuestion_IsEnable]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyQuestion] ADD  CONSTRAINT [DF_SurveyQuestion_IsRequired]  DEFAULT ((1)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[SurveyQuestion] ADD  CONSTRAINT [DF_SurveyQuestion_IsMultipleOps]  DEFAULT ((0)) FOR [IsMultipleAnswers]
GO
ALTER TABLE [dbo].[userlogin_new] ADD  CONSTRAINT [DF_userlogin_active_new]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[userlogin_new] ADD  CONSTRAINT [DF_userlogin_execpassword_new]  DEFAULT (N'AAP43617') FOR [execpassword]
GO
ALTER TABLE [dbo].[userlogin_new] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[userlogin_old_20190319] ADD  CONSTRAINT [DF_userlogin_active_1]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[userlogin_old_20190319] ADD  CONSTRAINT [DF_userlogin_execpassword]  DEFAULT (N'AAP43617') FOR [execpassword]
GO
ALTER TABLE [dbo].[userloginnew] ADD  CONSTRAINT [DF_userlogin1_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[WebLogAudit] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[FairShareProgram] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[userlogin] ADD  CONSTRAINT [DF_userlogin_active_1]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [Staging].[userlogin] ADD  CONSTRAINT [DF_Staging_userlogin_execpassword]  DEFAULT (N'AAP43617') FOR [execpassword]
GO
ALTER TABLE [Staging].[userlogin] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AdvertisementLocations] FOREIGN KEY([advertisementLocationID])
REFERENCES [dbo].[AdvertisementLocations] ([advertisementLocationID])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AdvertisementLocations]
GO
ALTER TABLE [dbo].[CredentialDocumentTracking]  WITH CHECK ADD  CONSTRAINT [FK_SurveyDocDet_SurveyDoc] FOREIGN KEY([docid])
REFERENCES [dbo].[CredentialDocumentList] ([docid])
GO
ALTER TABLE [dbo].[CredentialDocumentTracking] CHECK CONSTRAINT [FK_SurveyDocDet_SurveyDoc]
GO
ALTER TABLE [dbo].[DocumentAgreement]  WITH CHECK ADD  CONSTRAINT [FK_DocumentAgreement_DocumentAgreementType] FOREIGN KEY([DocumentAgreementTypeID])
REFERENCES [dbo].[DocumentAgreementType] ([DocumentAgreementTypeID])
GO
ALTER TABLE [dbo].[DocumentAgreement] CHECK CONSTRAINT [FK_DocumentAgreement_DocumentAgreementType]
GO
ALTER TABLE [dbo].[FeaturedArticles]  WITH CHECK ADD  CONSTRAINT [FK_FeaturedArticles_ArticleStatus] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[FeaturedArticles] ([ArticleID])
GO
ALTER TABLE [dbo].[FeaturedArticles] CHECK CONSTRAINT [FK_FeaturedArticles_ArticleStatus]
GO
ALTER TABLE [dbo].[Survey]  WITH NOCHECK ADD  CONSTRAINT [FK_Survey_SurveySchedule] FOREIGN KEY([SurveyScheduleId])
REFERENCES [dbo].[SurveySchedule] ([Id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_SurveySchedule]
GO
ALTER TABLE [dbo].[SurveyAnswerCL]  WITH NOCHECK ADD  CONSTRAINT [FK_OptionAnswer] FOREIGN KEY([OptionId])
REFERENCES [dbo].[SurveyOption] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyAnswerCL] CHECK CONSTRAINT [FK_OptionAnswer]
GO
ALTER TABLE [dbo].[SurveyEditor]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyEditor_Survey] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[SurveyEditor] CHECK CONSTRAINT [FK_SurveyEditor_Survey]
GO
ALTER TABLE [dbo].[SurveyFlag]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyFlag_Surveys] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[SurveyFlag] CHECK CONSTRAINT [FK_SurveyFlag_Surveys]
GO
ALTER TABLE [dbo].[SurveyOption]  WITH NOCHECK ADD  CONSTRAINT [FK_QuestionOption] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[SurveyQuestion] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyOption] CHECK CONSTRAINT [FK_QuestionOption]
GO
ALTER TABLE [dbo].[SurveyQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyQuestion] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyQuestion] CHECK CONSTRAINT [FK_SurveyQuestion]
GO
ALTER TABLE [dbo].[SurveySchedule]  WITH CHECK ADD  CONSTRAINT [FK_SurveySchedule_Participators] FOREIGN KEY([ParticipatorPMId])
REFERENCES [dbo].[SurveyParticipator] ([PMId])
GO
ALTER TABLE [dbo].[SurveySchedule] CHECK CONSTRAINT [FK_SurveySchedule_Participators]
GO
ALTER TABLE [dbo].[SurveyTrackNote]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyTrackNote_SurveyTrackChange] FOREIGN KEY([TrackChangeId])
REFERENCES [dbo].[SurveyTrackChange] ([Id])
GO
ALTER TABLE [dbo].[SurveyTrackNote] CHECK CONSTRAINT [FK_SurveyTrackNote_SurveyTrackChange]
GO
