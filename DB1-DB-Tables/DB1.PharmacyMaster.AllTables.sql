USE [PharmacyMaster]
GO
/****** Object:  Table [Archive].[APItoPMID_LifeTime]    Script Date: 12/22/2020 3:01:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APItoPMID_LifeTime](
	[APIAccountNo] [varchar](20) NULL,
	[PMID] [int] NOT NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NOT NULL,
	[DateOpened] [datetime] NULL,
	[FirstOrderDate] [datetime2](3) NULL,
	[API_PMID_EffectiveDate] [datetime2](3) NULL,
	[API_PMID_QuitDate] [datetime] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[LastOrderDate] [datetime2](3) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[PM_AnnualRebates_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[PM_AnnualRebates_New](
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
 CONSTRAINT [CPK_Archive_PM_AnnualRebates_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[PM_CHAccounts_ADJ]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[PM_CHAccounts_ADJ](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [CPK_Staging_PMCHAccounts] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Audit].[PM_AddressMaster]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit].[PM_AddressMaster](
	[AuditRowID] [int] IDENTITY(1,1) NOT NULL,
	[PK_AddressMaster] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[DMLAction] [varchar](5) NULL,
	[ColumnsUpdated] [varchar](4000) NULL,
	[OriginalLogin] [varchar](255) NULL,
	[CurrentLogin] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[IsSentToCRM] [bit] NOT NULL,
	[IsUpdatedInCRM] [bit] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_Audit_PM_AddressMaster] PRIMARY KEY CLUSTERED 
(
	[AuditRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].['AAP Members$']    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['AAP Members$'](
	[ID] [float] NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[addr1] [nvarchar](255) NULL,
	[addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAP_BOD]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP_BOD](
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPCorporateMailList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPCorporateMailList](
	[CorpID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL,
 CONSTRAINT [PK_AAPCorporateMailList] PRIMARY KEY CLUSTERED 
(
	[CorpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPCorporateMailListB4Delete]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPCorporateMailListB4Delete](
	[CorpID] [int] IDENTITY(1,1) NOT NULL,
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
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPDiplomat]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPDiplomat](
	[NCPDP] [varchar](20) NULL,
	[Store] [nvarchar](250) NULL,
	[State] [varchar](2) NULL,
	[GoLive] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPMonthlyCardinalRebate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPMonthlyCardinalRebate](
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
	[COG Rebate] [money] NULL,
	[COG Rebate %] [float] NULL,
	[Florida Phcy Assoc Deduct] [money] NULL,
	[Leader Rebate] [money] NULL,
	[MSI Rebate] [money] NULL,
	[Price Protection Rebate] [money] NULL,
	[Price Protection Adjustment] [money] NULL,
	[Prescribed Wellness Fee] [money] NULL,
	[NCPA Membership Fee] [money] NULL,
	[Arete Eligible] [bit] NULL,
	[Arete Performance Rebate] [money] NULL,
	[Check Fee] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL,
	[Sort Code] [nvarchar](255) NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Matrix] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccessVendors]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessVendors](
	[vendor_id] [int] NOT NULL,
	[PPFeeNote] [nvarchar](max) NULL,
	[VENDOR] [nvarchar](150) NULL,
	[Website Program Description] [nvarchar](max) NULL,
	[MemberDeal] [nvarchar](max) NULL,
	[PurchaseIncentive] [nvarchar](max) NULL,
	[PPContract Billed] [nvarchar](50) NULL,
	[PPContract Pd] [nvarchar](50) NULL,
	[Contract Pricing Start Date] [nvarchar](50) NULL,
	[Contract Pricing End Date] [nvarchar](50) NULL,
	[Corporate Rebate] [nvarchar](255) NULL,
	[Pat Rebate] [nvarchar](3) NULL,
	[Rebate To FPN] [nvarchar](200) NULL,
	[Rebate From FPN to United] [nvarchar](200) NULL,
	[CustomerServicePhone] [nvarchar](50) NULL,
	[Customer Service Toll Free] [nvarchar](50) NULL,
	[Customer Service Fax] [nvarchar](50) NULL,
	[CustomerServiceE-mail] [nvarchar](100) NULL,
	[WEBSITE] [nvarchar](100) NULL,
	[CorpAddr1] [nvarchar](50) NULL,
	[CorpAddr2] [nvarchar](50) NULL,
	[CorpCity] [nvarchar](50) NULL,
	[CorpSt] [nvarchar](50) NULL,
	[CorpZip] [nvarchar](50) NULL,
	[CORP800] [nvarchar](50) NULL,
	[CorpPhone] [nvarchar](50) NULL,
	[CorpFax] [nvarchar](50) NULL,
	[Last Modified] [datetime] NULL,
	[Why Modified] [nvarchar](255) NULL,
	[PPContract/ Effective] [datetime] NULL,
	[PPContract/ Expiration] [datetime] NULL,
	[Marketing Package] [nvarchar](50) NULL,
	[Tier] [nvarchar](255) NULL,
	[PreferedPartnerSince] [int] NULL,
	[Contract Term Date] [datetime] NULL,
	[Active] [nvarchar](3) NULL,
	[PIPCo Program] [nvarchar](3) NULL,
	[United/PIPCoUses] [nvarchar](3) NULL,
	[NotesPPPStatus] [nvarchar](max) NULL,
	[Vendor Type] [nvarchar](50) NULL,
	[Annual Renewal LetterSent] [nvarchar](50) NULL,
	[Welcome E-mail Infor Form] [nvarchar](50) NULL,
	[InfoFormReturned] [nvarchar](5) NULL,
	[WelcomeLetterMarketingCalendar] [nvarchar](50) NULL,
	[MKt BannerStart Date] [datetime] NULL,
	[Mkt BannerEnd Date] [datetime] NULL,
	[SSI] [nvarchar](3) NULL,
	[Spin Reports United] [nvarchar](3) NULL,
	[Spin Reports Partner] [nvarchar](3) NULL,
	[Spin Report Notes] [nvarchar](max) NULL,
	[Spin Reports N/A] [nvarchar](3) NULL,
	[Spin Reports FPN] [nvarchar](50) NULL,
	[DirectorySent] [nvarchar](50) NULL,
	[LinkedURL] [nvarchar](255) NULL,
	[Phone Website] [nvarchar](50) NULL,
	[RFP] [nvarchar](50) NULL,
	[Purchase From] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActiveServiceProviderID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveServiceProviderID](
	[ServiceProviderID] [varchar](50) NULL,
	[AccountName] [varchar](65) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdherisOct_Dec2014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdherisOct_Dec2014](
	[NCPDP] [nvarchar](50) NULL,
	[Volume] [nvarchar](50) NULL,
	[Rebate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdherisRpt]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdherisRpt](
	[NCPDP] [nvarchar](50) NULL,
	[Volume] [nvarchar](50) NULL,
	[Rebate] [nvarchar](50) NULL,
	[Column 3] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AffiliateHistory_20201005]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffiliateHistory_20201005](
	[PMID] [nvarchar](100) NULL,
	[GroupName] [nvarchar](250) NULL,
	[new_affiliationstart] [date] NULL,
	[new_affiliationend] [date] NULL,
	[new_reason] [nvarchar](100) NULL,
	[statuscodename] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_20181024]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_20181024](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_ALL_Volume_New_20181024] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_backup_20191001]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_backup_20191001](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_backup_May2019_20191231]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_backup_May2019_20191231](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_backup_RSE_20180901to20191001_20191126]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_backup_RSE_20180901to20191001_20191126](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_backup_RSE_20201122]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_backup_RSE_20201122](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_bkp_20201006]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_bkp_20201006](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_bkp050517]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_bkp050517](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_bkp111413]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_bkp111413](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_bkp120716]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_bkp120716](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_bkp20180307]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_bkp20180307](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_bkp20180327]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_bkp20180327](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_ALL_Volume_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_All_Volume_New] UNIQUE NONCLUSTERED 
(
	[Date] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_backup_20191106]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_backup_20191106](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_backup_20200317]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_backup_20200317](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_backup_Dups_20191108]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_backup_Dups_20191108](
	[RowID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_Backup_May_201901001]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_Backup_May_201901001](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_backup_RSE_20181115]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_backup_RSE_20181115](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_backup_RSE_20200917]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_backup_RSE_20200917](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_New_bkp_20200901]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_New_bkp_20200901](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_Nov_backup_20201202]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_Nov_backup_20201202](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_New_Oct2020_20201130]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_New_Oct2020_20201130](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_Octbackup_20201125]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_Octbackup_20201125](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_RSE_20191122]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_RSE_20191122](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_All_Volume_RSE_20191124] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_New_RSE_Backup_20181212]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New_RSE_Backup_20181212](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_Oct202020201124]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_Oct202020201124](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_old_RSE_20180821]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_old_RSE_20180821](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_RSE_20191122_backup_20191124]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_RSE_20191122_backup_20191124](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_usesAPILifetime]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_usesAPILifetime](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volumeBKP050216]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volumeBKP050216](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllVolumnePMID_20191001]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllVolumnePMID_20191001](
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllVolumnePMID_DeDuped_20191001]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllVolumnePMID_DeDuped_20191001](
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APICustomerList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICustomerList](
	[TM] [nvarchar](50) NULL,
	[Acct#] [nvarchar](50) NULL,
	[Pharmacy Name] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[ST] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[WHS] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
	[BUSCLS] [nvarchar](50) NULL,
	[MOT] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIMailAddress]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIMailAddress](
	[APIAccountNo] [varchar](20) NULL,
	[AddressNo] [float] NULL,
	[AccountName] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](65) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIPVA_WH_RebatesAdminFee2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPVA_WH_RebatesAdminFee2010](
	[Timeframe] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[Net Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Cardinal Program Rebate] [money] NULL,
	[API Program Rebate] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APITaxID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APITaxID](
	[Status] [varchar](32) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[TaxID] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APItoPMID_LifeTime]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APItoPMID_LifeTime](
	[APIAccountNo] [varchar](20) NULL,
	[PMID] [int] NOT NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NOT NULL,
	[DateOpened] [datetime] NULL,
	[FirstOrderDate] [datetime2](3) NULL,
	[API_PMID_EffectiveDate] [datetime2](3) NULL,
	[API_PMID_QuitDate] [datetime] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[LastOrderDate] [datetime2](3) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIWHCHAcctInfo]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIWHCHAcctInfo](
	[Marker] [bit] NULL,
	[PMID] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[AAP Number] [nvarchar](255) NULL,
	[AAP Parent#] [nvarchar](255) NULL,
	[UD#] [nvarchar](255) NULL,
	[MCA on File] [bit] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[AAP Affiliate] [nvarchar](255) NULL,
	[CA Parent Code] [nvarchar](255) NULL,
	[Cardinal Division#] [nvarchar](255) NULL,
	[Cardinal DC] [nvarchar](255) NULL,
	[Primary CA Acct#] [nvarchar](255) NULL,
	[2nd Cardinal cust] [nvarchar](255) NULL,
	[3rd Cardinal cust] [nvarchar](255) NULL,
	[POS Acct] [nvarchar](255) NULL,
	[Scan-Toss Acct] [nvarchar](255) NULL,
	[CSOS Acct] [nvarchar](255) NULL,
	[AAP Contract Date] [datetime] NULL,
	[Termination Date] [nvarchar](255) NULL,
	[Multiple Store] [bit] NULL,
	[Multiple Store Code] [nvarchar](255) NULL,
	[Group Code] [nvarchar](255) NULL,
	[Current Est Mo Sales] [money] NULL,
	[Current Grp Total] [money] NULL,
	[Est Volume at Load] [money] NULL,
	[Last Review Date] [datetime] NULL,
	[Current API COG] [float] NULL,
	[Current CA COG] [float] NULL,
	[QPS Store] [bit] NULL,
	[Payment Terms description] [nvarchar](255) NULL,
	[Payment Terms Code] [nvarchar](255) NULL,
	[Pending Changes] [bit] NULL,
	[Change Pending] [nvarchar](255) NULL,
	[Notes COG Differences] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[AAP Rep] [nvarchar](255) NULL,
	[Excpt to Matrix] [bit] NULL,
	[Optional Pay Terms] [bit] NULL,
	[Front Load-No Reb] [bit] NULL,
	[WAPD] [float] NULL,
	[DSO] [float] NULL,
	[Last Update] [datetime] NULL,
	[WAPD 2nd Acct] [float] NULL,
	[DSO 2nd Acct] [float] NULL,
	[Sublogic Change] [bit] NULL,
	[Notes on Terms] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AplicorPMIDMapping]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AplicorPMIDMapping](
	[Account Name] [nvarchar](255) NULL,
	[Account Code] [nvarchar](50) NULL,
	[SL Account No ] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SysUser] [varchar](250) NULL,
	[Application] [varchar](250) NULL,
	[TableName] [nvarchar](250) NULL,
	[Operation] [char](1) NOT NULL,
	[PrimaryKey] [nvarchar](max) NOT NULL,
	[PrimaryKey2] [nvarchar](max) NULL,
	[PrimaryKey3] [nvarchar](max) NULL,
	[PrimaryKey4] [nvarchar](max) NULL,
	[PrimaryKey5] [nvarchar](max) NULL,
	[RowDescription] [varchar](250) NULL,
	[SecondaryRow] [varchar](250) NULL,
	[ColumnName] [nvarchar](250) NULL,
	[OldValue] [varchar](250) NULL,
	[NewValue] [varchar](250) NULL,
 CONSTRAINT [PK__Audit__65AC084E] PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_PriceProtection]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_PriceProtection](
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
/****** Object:  Table [dbo].[CA_PriceProtection_bk20200820]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_PriceProtection_bk20200820](
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
/****** Object:  Table [dbo].[CA_PriceProtectionII]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_PriceProtectionII](
	[Date] [varchar](10) NULL,
	[Misc] [varchar](50) NULL,
	[Division] [varchar](50) NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[LastMonthPriceProtectionDue] [money] NULL,
	[CurrentToRemoveFromRebate] [money] NULL,
	[Misc2] [nvarchar](255) NULL,
	[RowLabels] [varchar](50) NULL,
	[CustomerNumber2] [varchar](50) NULL,
	[PriceProtectionDueToDate2] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_PriceProtectionNotes]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_PriceProtectionNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Notes] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_PriceProtectionPayments]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_PriceProtectionPayments](
	[Date] [varchar](10) NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[State] [varchar](255) NULL,
	[SubAffiliation] [varchar](255) NULL,
	[DC] [float] NULL,
	[Protection] [money] NULL,
	[AdjForPriorNegBal] [money] NULL,
	[AmountDue] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CA_PriceProtectionRebatePerc]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_PriceProtectionRebatePerc](
	[Date] [datetime] NULL,
	[UnKnown] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[SubAffiliation] [varchar](255) NULL,
	[CustomerUnique] [varchar](255) NULL,
	[L01AfltnName] [varchar](255) NULL,
	[DC] [float] NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[CorporateItemNumber] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Supplier] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[OldSell] [money] NULL,
	[NewSell] [money] NULL,
	[PercChange] [float] NULL,
	[ProtectionStartDate] [datetime] NULL,
	[ProtectionEndDate] [datetime] NULL,
	[Previous3MonthsHistoricalUsage] [float] NULL,
	[AverageMonthlyUsage] [float] NULL,
	[UnitSellDlr] [money] NULL,
	[Usage] [float] NULL,
	[Returns] [float] NULL,
	[TotalUsage] [float] NULL,
	[PriorMonthUsage] [float] NULL,
	[AvailableFromLastMonth] [float] NULL,
	[OverageLastMonth] [float] NULL,
	[TotalOwed] [float] NULL,
	[UsageForCalculation] [float] NULL,
	[PriceProtectionDue] [money] NULL,
	[Comments] [varchar](255) NULL,
	[RebatePerc] [float] NULL,
	[FinalPriceProtectionDue] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASourceContractMO]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASourceContractMO](
	[Date] [datetime] NULL,
	[ChangeType] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
	[Form] [varchar](255) NULL,
	[UM] [varchar](255) NULL,
	[Supplier] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[CIN] [float] NULL,
	[DP] [float] NULL,
	[OldPrice] [money] NULL,
	[NewPrice] [money] NULL,
	[WAC] [money] NULL,
	[F12] [varchar](50) NULL,
	[BrandName] [nvarchar](255) NULL,
	[ReasonCode] [nvarchar](255) NULL,
	[EffectDte] [datetime] NULL,
	[UOM] [nvarchar](255) NULL,
	[20Percent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_ALLPVA_SALES]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_ALLPVA_SALES](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[COGEligibleSales] [money] NULL,
	[NonContractGenericSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL,
	[RebateEligibleSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_ALLPVA_SALES_bak20200129]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_ALLPVA_SALES_bak20200129](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[COGEligibleSales] [money] NULL,
	[NonContractGenericSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_ALLPVA_SALES_BKP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_ALLPVA_SALES_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[COGEligibleSales] [money] NULL,
	[NonContractGenericSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL,
	[RebateEligibleSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_ALLPVA_SALES_bkp_20201006]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_ALLPVA_SALES_bkp_20201006](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[COGEligibleSales] [money] NULL,
	[NonContractGenericSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL,
	[RebateEligibleSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_ALLPVA_SALES_RSE_20181030]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_ALLPVA_SALES_RSE_20181030](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[COGEligibleSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_ALLPVA_SALES_tmphold]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_ALLPVA_SALES_tmphold](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[COGEligibleSales] [money] NULL,
	[NonContractGenericSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL,
	[RebateEligibleSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COG_Jul_Dec_2016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COG_Jul_Dec_2016](
	[PMID] [int] NULL,
	[COG] [decimal](18, 4) NULL,
	[TableName] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_ADMIN]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_ADMIN](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENExcl] [float] NULL,
	[GENTotal] [float] NULL,
	[Brand] [float] NULL,
	[Extended] [float] NULL,
	[VolAdminFee] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_ADMIN_BKP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_ADMIN_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENExcl] [float] NULL,
	[GENTotal] [float] NULL,
	[Brand] [float] NULL,
	[Extended] [float] NULL,
	[VolAdminFee] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_GENRebate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_GENRebate](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENRebate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_GENRebate_BKP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_GENRebate_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENRebate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_SALES]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_SALES](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[COGAppliedSales] [float] NULL,
	[NetSales] [float] NULL,
	[GENTotal] [float] NULL,
	[GENExcl] [float] NULL,
	[GENSrc] [float] NULL,
	[GENSrcTop] [float] NULL,
	[Brand] [float] NULL,
	[GENCHPreSrcBU] [float] NULL,
	[OTC] [float] NULL,
	[Other] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_SALES_BKP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_SALES_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[COGAppliedSales] [float] NULL,
	[NetSales] [float] NULL,
	[GENTotal] [float] NULL,
	[GENExcl] [float] NULL,
	[GENSrc] [float] NULL,
	[GENSrcTop] [float] NULL,
	[Brand] [float] NULL,
	[GENCHPreSrcBU] [float] NULL,
	[OTC] [float] NULL,
	[Other] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAcct_PMID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAcct_PMID](
	[CHAccount] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAPI_SALES]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAPI_SALES](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[COGEligibleSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL,
	[RebateEligibleSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAPI_SALES_bak20200129]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAPI_SALES_bak20200129](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[COGEligibleSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAPI_SALES_BKP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAPI_SALES_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[COGEligibleSales] [money] NULL,
	[NetSourceGenerics] [money] NOT NULL,
	[RebateEligibleSourceGenerics] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAPI_SALES_RSE_20181030]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAPI_SALES_RSE_20181030](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[COGEligibleSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHRebate_AAP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebate_AAP](
	[PMID] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[Sort Code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clint]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clint](
	[Customer] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[Amount] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_CheckList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_CheckList](
	[Id] [int] NOT NULL,
	[Group] [nvarchar](200) NULL,
	[Name] [nvarchar](200) NOT NULL,
	[GroupTitle] [nvarchar](200) NULL,
	[IsHeaderGroup] [bit] NULL,
	[Select] [bit] NULL,
	[Query] [nvarchar](300) NULL,
	[Tags] [nvarchar](300) NULL,
	[ListOrder] [int] NULL,
	[DisableCheckLists] [nvarchar](300) NULL,
	[EnableDependCheckLists] [nvarchar](300) NULL,
	[ToolTip] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_com_CheckList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_DistributionEmail]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_DistributionEmail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](150) NOT NULL,
	[DistributionEmails] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CM_DistributedEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_DistributionList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_DistributionList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[ListType] [nvarchar](50) NOT NULL,
	[Ids] [nvarchar](max) NOT NULL,
	[Exceptions] [nvarchar](max) NULL,
 CONSTRAINT [PK_com_DistributionList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_QueryMaster]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_QueryMaster](
	[Id] [int] NOT NULL,
	[FromTable] [nvarchar](200) NULL,
	[Term] [nvarchar](250) NULL,
	[WhereTerm] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tmp_Com_QueryMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CM_SendoutRequest]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_SendoutRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GeneratedQuery] [nvarchar](max) NULL,
	[RequestedOptionIds] [nvarchar](500) NULL,
	[RequestedOptionQueries] [nvarchar](1000) NULL,
	[OtherText] [nvarchar](200) NULL,
	[DateToSendRequest] [datetime] NULL,
	[Title] [nvarchar](100) NULL,
	[RequestUser] [nvarchar](150) NULL,
	[RequestEmail] [nvarchar](250) NULL,
	[CreatedTime] [timestamp] NULL,
	[Comments] [nvarchar](max) NULL,
	[Files] [nvarchar](max) NULL,
	[SubmittedBy] [nvarchar](150) NULL,
	[SubmittedTime] [datetime] NULL,
	[MarketingApprovalBy] [nvarchar](150) NULL,
	[MarketingApprovalTime] [datetime] NULL,
	[FinalApprovalBy] [nvarchar](150) NULL,
	[FinalApprovalTime] [datetime] NULL,
	[SentByUser] [nvarchar](150) NULL,
	[SentByTime] [datetime] NULL,
	[SaleApprovalBy] [nvarchar](150) NULL,
	[SaleApprovalTime] [datetime] NULL,
	[isActive] [bit] NULL,
	[ExternalFaxLstOther] [nvarchar](max) NULL,
	[ExternalEmailLstOther] [nvarchar](max) NULL,
	[InternalEmailLstOther] [nvarchar](max) NULL,
	[ContentApprovalBy] [nvarchar](150) NULL,
	[PMAndCorpIdRecipients] [nvarchar](max) NULL,
	[RequestHistories] [nvarchar](max) NULL,
 CONSTRAINT [PK_com_RequestSentOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COG]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COG](
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Division Name] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[DEA Registration Number] [nvarchar](50) NULL,
	[Default Buy Plan %] [numeric](18, 4) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[AR2000 Terms Code Description] [nvarchar](50) NULL,
	[Contract Group Number] [nvarchar](50) NULL,
	[Contract Group Effective Date] [nvarchar](50) NULL,
	[Actual WAPD 90 days] [nvarchar](50) NULL,
	[MMP DSO 90 days] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conf2013Listing_Betty]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conf2013Listing_Betty](
	[PMID] [int] NOT NULL,
	[Individual Authorized to Vote] [nvarchar](50) NULL,
	[Account DBA] [varchar](65) NULL,
	[AAP Effective Date] [datetime] NULL,
	[AAP Quit Date] [datetime] NULL,
	[AAP Store #] [varchar](20) NULL,
	[AAP Parent Store #] [varchar](20) NULL,
	[Mailing Address 1] [varchar](100) NULL,
	[Mailing Address 2] [varchar](100) NULL,
	[Mailing City] [varchar](50) NULL,
	[Mailing State] [varchar](2) NULL,
	[Mailing Zip] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrConfProgramID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrConfProgramID](
	[PID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataSharingAuthorization]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSharingAuthorization](
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[DEA] [varchar](20) NULL,
	[PharmacySystem] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[SystemId] [varchar](50) NULL,
	[DateSigned] [smalldatetime] NULL,
	[Comments] [varchar](500) NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_MLReport]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_MLReport](
	[pmid] [int] NULL,
	[MLTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_RLGL081216]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_RLGL081216](
	[Date0] [nvarchar](255) NULL,
	[Date] [datetime] NULL,
	[Login] [nvarchar](255) NULL,
	[role] [nvarchar](255) NULL,
	[data] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_SpecialtyActive101314]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_SpecialtyActive101314](
	[#] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](15) NULL,
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_SpecialtyActive101314_report]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_SpecialtyActive101314_report](
	[pmid] [int] NULL,
	[date_webrequest] [varchar](30) NULL,
	[software] [varchar](255) NULL,
	[contact] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[Active] [varchar](3) NOT NULL,
	[active_ncpdp] [nvarchar](15) NULL,
	[rank] [bigint] NULL,
	[accountname] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[date_pm_programs] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DGStoreList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DGStoreList](
	[NCPDP] [nvarchar](50) NULL,
	[RequestsCount] [nvarchar](50) NULL,
	[LatestRequestDate] [nvarchar](50) NULL,
	[AccountName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[PharmacySystem] [nvarchar](50) NULL,
	[% of Total] [nvarchar](50) NULL,
	[DG Candidate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DirectDepositDurationLog]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DirectDepositDurationLog](
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DynamicSQL]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicSQL](
	[C1] [varchar](max) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipp_Affiliates]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipp_Affiliates](
	[Name] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone Number] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipp_Logins]    Script Date: 12/22/2020 3:01:06 AM ******/
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
	[DistributionDate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippLoginHistory]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippLoginHistory](
	[NPI] [nvarchar](50) NULL,
	[Group Name] [nvarchar](50) NULL,
	[Participant Name] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Action Time] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippLoginHistory_10162014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippLoginHistory_10162014](
	[NPI] [nvarchar](50) NULL,
	[Group Name] [nvarchar](50) NULL,
	[Participant Name] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
	[Action Time] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_April]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_April](
	[ParentPMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_April15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_April15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_April16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_April16](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Aug]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Aug](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Aug15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Aug15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Dec]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Dec](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Dec15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Dec15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Feb]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Feb](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Feb16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Feb16](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Jan]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Jan](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Jan16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Jan16](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_July]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_July](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_July15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_July15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_July16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_July16](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Jun2016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Jun2016](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_June]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_June](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_June15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_June15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_March]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_March](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_March16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_March16](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_May]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_May](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_May15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_May15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_May16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_May16](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Nov]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Nov](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Nov15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Nov15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Oct]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Oct](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Oct15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Oct15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Sep]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Sep](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipHist_Sep15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipHist_Sep15](
	[ParentPMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippOwnershipUserlist]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippOwnershipUserlist](
	[Username] [float] NULL,
	[Password] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Level of Access] [float] NULL,
	[EQuIPP Group ID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippRFOwner06202014]    Script Date: 12/22/2020 3:01:06 AM ******/
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
/****** Object:  Table [dbo].[EquippRFUser06202014]    Script Date: 12/22/2020 3:01:06 AM ******/
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
/****** Object:  Table [dbo].[EquippStoreHist]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_April]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_April](
	[StoreID] [nvarchar](50) NULL,
	[StoreName] [nvarchar](50) NULL,
	[Grouping1] [nvarchar](50) NULL,
	[Grouping2] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_April15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_April15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_April16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_April16](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Aug]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Aug](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Aug15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Aug15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Dec]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Dec](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Dec15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Dec15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Feb]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Feb](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Feb16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Feb16](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Jan]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Jan](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Jan0516]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Jan0516](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Jan16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Jan16](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_July]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_July](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_July15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_July15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_July16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_July16](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Jun2016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Jun2016](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_June]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_June](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_June15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_June15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_March]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_March](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_March16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_March16](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_May]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_May](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_May15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_May15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_May16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_May16](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Nov]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Nov](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Nov15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Nov15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Oct]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Oct](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Oct15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Oct15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Sep]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Sep](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippStoreHist_Sep15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippStoreHist_Sep15](
	[StoreID] [int] NOT NULL,
	[StoreName] [varchar](65) NULL,
	[Grouping1] [varchar](200) NULL,
	[Grouping2] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserList](
	[New Username] [nvarchar](255) NULL,
	[Initial Password] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[ProfDesignation] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Level of Access/NPI] [float] NULL,
	[Start Date] [datetime] NULL,
	[EQuIPP Group ID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserList_09232014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserList_09232014](
	[New Username] [nvarchar](50) NULL,
	[Initial Password] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[ProfDesignation] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Level of Access NPI] [nvarchar](50) NULL,
	[Start Date] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserlistHist_April]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserlistHist_April](
	[NCPDP] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_April15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_April15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_April16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_April16](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Aug15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Aug15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Dec]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Dec](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Dec15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Dec15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Feb]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Feb](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Feb16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Feb16](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Jan]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Jan](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Jan16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Jan16](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_July]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_July](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_July15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_July15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_July16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_July16](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Jun2016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Jun2016](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_June]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_June](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_June15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_June15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_March]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_March](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_March16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_March16](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserlistHist_May]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserlistHist_May](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_May15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_May15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_May16]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_May16](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Nov]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Nov](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Nov15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Nov15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Oct]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Oct](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Oct15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Oct15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Sep]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Sep](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist_Sep15]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist_Sep15](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EquippUserListHist-Aug]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquippUserListHist-Aug](
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorNumber] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorProcedure] [nvarchar](500) NULL,
	[ErrorMessage] [nvarchar](4000) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exclude_tables]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exclude_tables](
	[table_name] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeaturedWebPartner]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturedWebPartner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[ImageLink] [nvarchar](255) NOT NULL,
	[Link] [nvarchar](255) NULL,
	[FeatureDescription] [varchar](8000) NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Featured__3214EC0793D6848B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesInds]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesInds](
	[NAME] [nvarchar](200) NULL,
	[ADDRESS] [nvarchar](200) NULL,
	[MAIL] [nvarchar](200) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[PHONE] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
	[COUNTY] [nvarchar](50) NULL,
	[POP] [nvarchar](50) NULL,
	[CHAIN] [nvarchar](50) NULL,
	[CHQ] [nvarchar](50) NULL,
	[STORENUM] [nvarchar](50) NULL,
	[BRANCH] [nvarchar](50) NULL,
	[OTHER] [nvarchar](200) NULL,
	[FULLSTATE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesList](
	[NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[PHONE] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
	[COUNTY] [nvarchar](50) NULL,
	[POP] [nvarchar](50) NULL,
	[CHAIN] [nvarchar](50) NULL,
	[CHQ] [nvarchar](50) NULL,
	[STORENUM] [nvarchar](50) NULL,
	[BRANCH] [nvarchar](50) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_pm_servicessurvey]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_pm_servicessurvey](
	[PMID] [int] NULL,
	[NCPDP] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[DiabetesEducatorCertified] [smallint] NULL,
	[DiabetesEducatorNonCertified] [smallint] NULL,
	[HypertensionTesting] [smallint] NULL,
	[AsthmaServices] [smallint] NULL,
	[CholesterolServices] [smallint] NULL,
	[CompoundingLevel1thru3] [smallint] NULL,
	[CompoundingLevel4Sterile] [smallint] NULL,
	[DMELight] [smallint] NULL,
	[DMEHeavy] [smallint] NULL,
	[DMEAccreditedPharmacy] [smallint] NULL,
	[Contracted340BSelfAdministered] [smallint] NULL,
	[Contracted340BThirdPartyAdministered] [smallint] NULL,
	[Contracted340BExplain] [varchar](500) NULL,
	[ImmunizationsFLUVaccines] [smallint] NULL,
	[ImmunizationsTravelVaccines] [smallint] NULL,
	[ImmunizationsOtherExplain] [varchar](500) NULL,
	[WeightLossClinics] [smallint] NULL,
	[NutritionServices] [smallint] NULL,
	[OtherRetirementCommunities] [smallint] NULL,
	[OtherAssistedLivingFacilities] [smallint] NULL,
	[OtherHospiceCenters] [smallint] NULL,
	[OtherSkilledNursingFacilities] [smallint] NULL,
	[DeliveryServicesNoCharge] [smallint] NULL,
	[DeliveryServicesChargeFee] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntranetReport]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReport](
	[IntranetReportID] [int] IDENTITY(1,1) NOT NULL,
	[ServerID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](255) NULL,
	[IsAdminMode] [bit] NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
	[AddedBy] [varchar](50) NOT NULL,
	[DateModified] [datetime2](7) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ReportPathOrGuid] [varchar](255) NOT NULL,
 CONSTRAINT [PK_IntranetReport] PRIMARY KEY CLUSTERED 
(
	[IntranetReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntranetReportAdminReason]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReportAdminReason](
	[IntranetReportID] [int] NOT NULL,
	[AdminDate] [datetime2](7) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Reason] [varchar](255) NOT NULL,
	[AdminMode] [bit] NOT NULL,
 CONSTRAINT [PK_IntranetReportAdminReason] PRIMARY KEY CLUSTERED 
(
	[IntranetReportID] ASC,
	[AdminDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntranetReportRole]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReportRole](
	[IntranetReportID] [int] NOT NULL,
	[IntranetRoleID] [int] NOT NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_IntranetReportRole] PRIMARY KEY CLUSTERED 
(
	[IntranetReportID] ASC,
	[IntranetRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntranetReportServer]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetReportServer](
	[ServerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_IntranetReportServer] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntranetRole]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntranetRole](
	[IntranetRoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_IntranetRole_1] PRIMARY KEY CLUSTERED 
(
	[IntranetRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lb]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lb](
	[Account Name] [nvarchar](255) NULL,
	[Mailing Address 1] [nvarchar](255) NULL,
	[Mailing Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Contact Full Name] [nvarchar](255) NULL,
	[Terr#] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[AAP Account No] [float] NULL,
	[DEA] [nvarchar](255) NULL,
	[NCPDP] [float] NULL,
	[NPI] [float] NULL,
	[State Lic# No#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiamiLuken]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiamiLuken](
	[MLID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[UDAccountNo] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[TotalSales] [float] NULL,
	[RxSales] [float] NULL,
	[GenericSales] [float] NULL,
	[RebatePerc] [varchar](50) NULL,
	[TotalRebate] [float] NULL,
	[AdminRebate] [float] NULL,
	[GenericRebate] [float] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_MiamiLuken] PRIMARY KEY CLUSTERED 
(
	[MLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiamiLuken_Hold]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiamiLuken_Hold](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[UDAccountNo] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[TotalSales] [float] NULL,
	[RxSales] [float] NULL,
	[GenericSales] [float] NULL,
	[RebatePerc] [varchar](50) NULL,
	[TotalRebate] [float] NULL,
	[AdminRebate] [float] NULL,
	[GenericRebate] [float] NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[missy_optin]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[missy_optin](
	[PMID] [float] NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[MCNews_EmailAddress] [nvarchar](255) NULL,
	[ContactFullName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPA_List]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPA_List](
	[PMID] [nvarchar](50) NULL,
	[AAPAccountno] [nvarchar](50) NULL,
	[Contact] [nvarchar](50) NULL,
	[AAPParentNo] [nvarchar](50) NULL,
	[ncpaid] [nvarchar](50) NULL,
	[membertype] [nvarchar](50) NULL,
	[paidthru] [nvarchar](50) NULL,
	[sourcecode] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[Accountname] [nvarchar](50) NULL,
	[Addr1] [nvarchar](50) NULL,
	[Addr2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[contactfullname] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_ChangeOfOwnershipInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ChangeOfOwnershipInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Old NCPDP Provider ID] [nvarchar](7) NULL,
	[Old Store Close Date] [nvarchar](8) NULL,
	[Change of Ownership Effective Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](120) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_ePrescribingInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ePrescribingInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[ePrescribing Network Identifier] [nvarchar](3) NULL,
	[ePrescribing Service Level Codes] [nvarchar](100) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Effective Through Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](24) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_MedicaidInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_MedicaidInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[State Code] [nvarchar](2) NULL,
	[Medicaid ID] [nvarchar](20) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](113) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_ParentOrganizationInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ParentOrganizationInformation](
	[Parent Organization ID] [nvarchar](6) NULL,
	[Parent Organization Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Parent Organization NPI] [nvarchar](10) NULL,
	[Parent Organization Federal Tax ID] [nvarchar](15) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact E-mail] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_PaymentCenterInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_PaymentCenterInformation](
	[Payment Center ID] [nvarchar](6) NULL,
	[Payment Center Name] [nvarchar](35) NULL,
	[Payment Center Address 1] [nvarchar](55) NULL,
	[Payment Center Address 2] [nvarchar](55) NULL,
	[Payment Center City] [nvarchar](30) NULL,
	[Payment Center State Code] [nvarchar](2) NULL,
	[Payment Center Zip Code] [nvarchar](9) NULL,
	[Payment Center Phone Number] [nvarchar](10) NULL,
	[Payment Center Extension] [nvarchar](5) NULL,
	[Payment Center FAX Number] [nvarchar](10) NULL,
	[Payment Center NPI] [nvarchar](10) NULL,
	[Payment Center Federal Tax ID] [nvarchar](15) NULL,
	[Payment Center  Name] [nvarchar](30) NULL,
	[Payment Center  Title] [nvarchar](30) NULL,
	[Payment Center  E-mail Address] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_Provider]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_Provider](
	[ProviderID] [nvarchar](7) NULL,
	[Legal Business Name] [nvarchar](60) NULL,
	[Name] [nvarchar](60) NULL,
	[Doctors Name] [nvarchar](60) NULL,
	[Store Number] [nvarchar](10) NULL,
	[Physical Location Address 1] [nvarchar](55) NULL,
	[Physical Location Address 2] [nvarchar](55) NULL,
	[Physical Location City] [nvarchar](30) NULL,
	[Physical Location State Code] [nvarchar](2) NULL,
	[Physical Location Zip Code] [nvarchar](9) NULL,
	[Physical Location Phone Number] [nvarchar](10) NULL,
	[Physical Location Extension] [nvarchar](5) NULL,
	[Physical Location FAX Number] [nvarchar](10) NULL,
	[Physical Location E-Mail Address] [nvarchar](50) NULL,
	[Physical Location Cross Street or Directions] [nvarchar](50) NULL,
	[Physical Location County/Parish] [nvarchar](5) NULL,
	[Physical Location MSA] [nvarchar](4) NULL,
	[Physical Location PMSA] [nvarchar](4) NULL,
	[Physical Location 24 Hour Operation Flag] [nvarchar](1) NULL,
	[Physical Location Provider Hours] [nvarchar](35) NULL,
	[Physical Location Congressional Voting District] [nvarchar](4) NULL,
	[Physical Location Language Code 1] [nvarchar](2) NULL,
	[Physical Location Language Code 2] [nvarchar](2) NULL,
	[Physical Location Language Code 3] [nvarchar](2) NULL,
	[Physical Location Language Code 4] [nvarchar](2) NULL,
	[Physical Location Language Code 5] [nvarchar](2) NULL,
	[Physical Location Store Open Date] [nvarchar](8) NULL,
	[Physical Location Store Closure Date] [nvarchar](8) NULL,
	[Mailing Address 1] [nvarchar](55) NULL,
	[Mailing Address 2] [nvarchar](55) NULL,
	[Mailing City] [nvarchar](30) NULL,
	[Mailing State Code] [nvarchar](2) NULL,
	[Mailing Zip Code] [nvarchar](9) NULL,
	[Contact Last Name] [nvarchar](20) NULL,
	[Contact First Name] [nvarchar](20) NULL,
	[Contact Middle Initial] [nvarchar](1) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact Phone Number] [nvarchar](10) NULL,
	[Contact Extension] [nvarchar](5) NULL,
	[Contact E-Mail Address] [nvarchar](50) NULL,
	[Dispenser Class Code] [nvarchar](2) NULL,
	[Primary Provider Type Code] [nvarchar](2) NULL,
	[Secondary Provider Type Code] [nvarchar](2) NULL,
	[Tertiary Provider Type Code] [nvarchar](2) NULL,
	[Medicare Provider (Supplier) ID] [nvarchar](10) NULL,
	[NPI] [nvarchar](10) NULL,
	[DEA] [nvarchar](12) NULL,
	[DEA Expiration Date] [nvarchar](8) NULL,
	[Federal Tax ID Number] [nvarchar](15) NULL,
	[State Income Tax ID Number] [nvarchar](15) NULL,
	[Deactivation Code] [nvarchar](2) NULL,
	[Reinstatement Code] [nvarchar](2) NULL,
	[Reinstatement Date] [nvarchar](8) NULL,
	[Transaction Code] [nvarchar](1) NULL,
	[Transaction Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](62) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_ProviderRelationship]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ProviderRelationship](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Relationship ID] [nvarchar](3) NULL,
	[Payment Center ID] [nvarchar](6) NULL,
	[Remit and Reconciliation ID] [nvarchar](6) NULL,
	[Provider Type] [nvarchar](2) NULL,
	[Is Primary] [nvarchar](1) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Effective Through Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](109) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_RelationshipDemographicInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_RelationshipDemographicInformation](
	[RelationshipID] [nvarchar](3) NULL,
	[Relationship Type] [nvarchar](2) NULL,
	[Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Relationship NPI] [nvarchar](10) NULL,
	[Relationship Federal Tax ID] [nvarchar](15) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact E-mail] [nvarchar](50) NULL,
	[Contractual Name] [nvarchar](30) NULL,
	[Contractual Title] [nvarchar](30) NULL,
	[Contractual E-mail] [nvarchar](50) NULL,
	[Operational Name] [nvarchar](30) NULL,
	[Operational Title] [nvarchar](30) NULL,
	[Operational E-mail] [nvarchar](50) NULL,
	[Technical Name] [nvarchar](30) NULL,
	[Technical Title] [nvarchar](30) NULL,
	[Technical E-mail] [nvarchar](50) NULL,
	[Audit Name] [nvarchar](30) NULL,
	[Audit Title] [nvarchar](30) NULL,
	[Audit E-mail] [nvarchar](50) NULL,
	[Parent Organization ID] [nvarchar](6) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](187) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_RelationshipType_Affiliates]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_RelationshipType_Affiliates](
	[RelationshipType] [varchar](2) NOT NULL,
	[TypeName] [varchar](max) NULL,
 CONSTRAINT [PK_NCPDP_RelationshipType_Affiliates] PRIMARY KEY CLUSTERED 
(
	[RelationshipType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_RemitAndReconciliationInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_RemitAndReconciliationInformation](
	[Remit and Reconciliation ID] [nvarchar](6) NULL,
	[Remit and Reconciliation Name] [nvarchar](35) NULL,
	[Remit and Reconciliation Address 1] [nvarchar](55) NULL,
	[Remit and Reconciliation Address 2] [nvarchar](55) NULL,
	[Remit and Reconciliation City] [nvarchar](30) NULL,
	[Remit and Reconciliation State Code] [nvarchar](2) NULL,
	[Remit and Reconciliation Zip Code] [nvarchar](9) NULL,
	[Remit and Reconciliation Phone Number] [nvarchar](10) NULL,
	[Remit and Reconciliation Extension] [nvarchar](5) NULL,
	[Remit and Reconciliation FAX Number] [nvarchar](10) NULL,
	[Remit and Reconciliation NPI] [nvarchar](10) NULL,
	[Remit and Reconciliation Federal Tax ID] [nvarchar](15) NULL,
	[Remit and Reconciliation Contact Name] [nvarchar](30) NULL,
	[Remit and Reconciliation Contact Title] [nvarchar](30) NULL,
	[Remit and Reconciliation Contact E-mail Address] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_ServicesInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ServicesInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Accepts ePrescriptions Indicator] [nvarchar](1) NULL,
	[Accepts ePrescriptions Code] [nvarchar](2) NULL,
	[Delivery Service Indicator] [nvarchar](1) NULL,
	[Delivery Service Code] [nvarchar](2) NULL,
	[Compounding Service Indicator] [nvarchar](1) NULL,
	[Compounding Service Code] [nvarchar](2) NULL,
	[Drive-Up Window Indicator] [nvarchar](1) NULL,
	[Drive-Up Window Code] [nvarchar](2) NULL,
	[DME Indicator] [nvarchar](1) NULL,
	[DME Code] [nvarchar](2) NULL,
	[Walk-In Clinic Indicator] [nvarchar](1) NULL,
	[Walk-In Clinic Code] [nvarchar](2) NULL,
	[24-Hour Emergency Indicator] [nvarchar](1) NULL,
	[24-Hour Emergency Code] [nvarchar](2) NULL,
	[Multi-Dose Compliance Packaging Indicator] [nvarchar](1) NULL,
	[Multi-Dose Compliance Packaging Code] [nvarchar](2) NULL,
	[Immunizations Provided Indicator] [nvarchar](1) NULL,
	[Immunizations Provided Code] [nvarchar](2) NULL,
	[Handicapped Accessible Indicator] [nvarchar](1) NULL,
	[Handicapped Accessible Code] [nvarchar](2) NULL,
	[340B Status Indicator] [nvarchar](1) NULL,
	[340B Status Code] [nvarchar](2) NULL,
	[Closed Door Facility Indicator] [nvarchar](1) NULL,
	[Closed Door Facility Code] [nvarchar](2) NULL,
	[Filler] [nvarchar](107) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_StateLicenseInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_StateLicenseInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[License State Code] [nvarchar](2) NULL,
	[State License Number] [nvarchar](20) NULL,
	[State License Expiration Date] [nvarchar](8) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_TaxonomyInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_TaxonomyInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Taxonomy Code] [nvarchar](10) NULL,
	[Provider Type Code] [nvarchar](2) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](123) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPChangeOfOwnershipInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPChangeOfOwnershipInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Old NCPDP Provider ID] [nvarchar](7) NULL,
	[Old Store Close Date] [nvarchar](8) NULL,
	[Change of Ownership Effective Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](120) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPEPrescribingInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPEPrescribingInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[ePrescribing Network Identifier] [nvarchar](3) NULL,
	[ePrescribing Service Level Codes] [nvarchar](100) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Effective Through Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](24) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPMedicaidInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPMedicaidInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[State Code] [nvarchar](2) NULL,
	[Medicaid ID] [nvarchar](20) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](113) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPParentOrganizationInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPParentOrganizationInformation](
	[Parent Organization ID] [nvarchar](6) NULL,
	[Parent Organization Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Parent Organization NPI] [nvarchar](10) NULL,
	[Parent Organization Federal Tax ID] [nvarchar](15) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact E-mail] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPPaymentCenter]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPPaymentCenter](
	[Payment Center ID] [nvarchar](6) NULL,
	[Payment Center Name] [nvarchar](35) NULL,
	[Remittance Address 1] [nvarchar](55) NULL,
	[Remittance Address 2] [nvarchar](55) NULL,
	[Remittance City] [nvarchar](30) NULL,
	[Remittance State Code] [nvarchar](2) NULL,
	[Remittance Zip Code] [nvarchar](9) NULL,
	[Remittance Phone Number] [nvarchar](10) NULL,
	[Remittance Extension] [nvarchar](5) NULL,
	[Remittance FAX Number] [nvarchar](10) NULL,
	[Remittance Contact Name] [nvarchar](30) NULL,
	[Remittance Contact Title] [nvarchar](30) NULL,
	[Remittance E-Mail Address] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPPaymentCenterInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPPaymentCenterInformation](
	[Payment Center ID] [nvarchar](6) NULL,
	[Payment Center Name] [nvarchar](35) NULL,
	[Payment Center Address 1] [nvarchar](55) NULL,
	[Payment Center Address 2] [nvarchar](55) NULL,
	[Payment Center City] [nvarchar](30) NULL,
	[Payment Center State Code] [nvarchar](2) NULL,
	[Payment Center Zip Code] [nvarchar](9) NULL,
	[Payment Center Phone Number] [nvarchar](10) NULL,
	[Payment Center Extension] [nvarchar](5) NULL,
	[Payment Center FAX Number] [nvarchar](10) NULL,
	[Payment Center NPI] [nvarchar](10) NULL,
	[Payment Center Federal Tax ID] [nvarchar](15) NULL,
	[Payment Center  Name] [nvarchar](30) NULL,
	[Payment Center  Title] [nvarchar](30) NULL,
	[Payment Center  E-mail Address] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPProvider]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPProvider](
	[ProviderID] [nvarchar](7) NULL,
	[Legal Business Name] [nvarchar](60) NULL,
	[Name] [nvarchar](60) NULL,
	[Doctors Name] [nvarchar](60) NULL,
	[Store Number] [nvarchar](10) NULL,
	[Physical Location Address 1] [nvarchar](55) NULL,
	[Physical Location Address 2] [nvarchar](55) NULL,
	[Physical Location City] [nvarchar](30) NULL,
	[Physical Location State Code] [nvarchar](2) NULL,
	[Physical Location Zip Code] [nvarchar](9) NULL,
	[Physical Location Phone Number] [nvarchar](10) NULL,
	[Physical Location Extension] [nvarchar](5) NULL,
	[Physical Location FAX Number] [nvarchar](10) NULL,
	[Physical Location E-Mail Address] [nvarchar](50) NULL,
	[Physical Location Cross Street or Directions] [nvarchar](50) NULL,
	[Physical Location County/Parish] [nvarchar](5) NULL,
	[Physical Location MSA] [nvarchar](4) NULL,
	[Physical Location PMSA] [nvarchar](4) NULL,
	[Physical Location 24 Hour Operation Flag] [nvarchar](1) NULL,
	[Physical Location Provider Hours] [nvarchar](35) NULL,
	[Physical Location Congressional Voting District] [nvarchar](4) NULL,
	[Physical Location Language Code 1] [nvarchar](2) NULL,
	[Physical Location Language Code 2] [nvarchar](2) NULL,
	[Physical Location Language Code 3] [nvarchar](2) NULL,
	[Physical Location Language Code 4] [nvarchar](2) NULL,
	[Physical Location Language Code 5] [nvarchar](2) NULL,
	[Physical Location Store Open Date] [nvarchar](8) NULL,
	[Physical Location Store Closure Date] [nvarchar](8) NULL,
	[Mailing Address 1] [nvarchar](55) NULL,
	[Mailing Address 2] [nvarchar](55) NULL,
	[Mailing City] [nvarchar](30) NULL,
	[Mailing State Code] [nvarchar](2) NULL,
	[Mailing Zip Code] [nvarchar](9) NULL,
	[Contact Last Name] [nvarchar](20) NULL,
	[Contact First Name] [nvarchar](20) NULL,
	[Contact Middle Initial] [nvarchar](1) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact Phone Number] [nvarchar](10) NULL,
	[Contact Extension] [nvarchar](5) NULL,
	[Contact E-Mail Address] [nvarchar](50) NULL,
	[Dispenser Class Code] [nvarchar](2) NULL,
	[Primary Provider Type Code] [nvarchar](2) NULL,
	[Secondary Provider Type Code] [nvarchar](2) NULL,
	[Tertiary Provider Type Code] [nvarchar](2) NULL,
	[Medicare Provider (Supplier) ID] [nvarchar](10) NULL,
	[NPI] [nvarchar](10) NULL,
	[DEA] [nvarchar](12) NULL,
	[DEA Expiration Date] [nvarchar](8) NULL,
	[Federal Tax ID Number] [nvarchar](15) NULL,
	[State Income Tax ID Number] [nvarchar](15) NULL,
	[Deactivation Code] [nvarchar](2) NULL,
	[Reinstatement Code] [nvarchar](2) NULL,
	[Reinstatement Date] [nvarchar](8) NULL,
	[Transaction Code] [nvarchar](1) NULL,
	[Transaction Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](62) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPProviderInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPProviderInformation](
	[NCPDP] [nvarchar](7) NULL,
	[Legal Business Name] [nvarchar](60) NULL,
	[Name] [nvarchar](60) NULL,
	[Store Number] [nvarchar](10) NULL,
	[Physical Location Address 1] [nvarchar](55) NULL,
	[Physical Location Address 2] [nvarchar](55) NULL,
	[Physical Location City] [nvarchar](30) NULL,
	[Physical Location State Code] [nvarchar](2) NULL,
	[Physical Location Zip code] [nvarchar](9) NULL,
	[Physical Location Phone Number] [nvarchar](10) NULL,
	[Physical Location Extension] [nvarchar](5) NULL,
	[Physical Location FAX] [nvarchar](10) NULL,
	[Physical Location E-Mail Address] [nvarchar](50) NULL,
	[Physical Location Cross Street or Directions] [nvarchar](50) NULL,
	[Physical Location County or Parish] [nvarchar](5) NULL,
	[Physical Location MSA] [nvarchar](4) NULL,
	[Physical Location PMSA] [nvarchar](4) NULL,
	[Physical Location 24 Hour Operation Flag] [nvarchar](1) NULL,
	[Physical Location Provider Hours] [nvarchar](35) NULL,
	[Physical Location Accepts E-Prescriptions] [nvarchar](1) NULL,
	[Physical Location Delivery Service] [nvarchar](1) NULL,
	[Physical Location Compounding Service] [nvarchar](1) NULL,
	[Physical Location Drive-up Window] [nvarchar](1) NULL,
	[Physical Location Durable Medical Equipment] [nvarchar](1) NULL,
	[Physical Location Congressional Voting District] [nvarchar](4) NULL,
	[Physical Location Language Code 1] [nvarchar](2) NULL,
	[Physical Location Language Code 2] [nvarchar](2) NULL,
	[Physical Location Language Code 3] [nvarchar](2) NULL,
	[Physical Location Language Code 4] [nvarchar](2) NULL,
	[Physical Location Language Code 5] [nvarchar](2) NULL,
	[Physical Location Handicap Access Flag] [nvarchar](1) NULL,
	[Physical Location Store Open Date] [nvarchar](8) NULL,
	[Physical Location Store Closure Date] [nvarchar](8) NULL,
	[Mailing Address 1] [nvarchar](55) NULL,
	[Mailing Address 2] [nvarchar](55) NULL,
	[Mailing Address City] [nvarchar](30) NULL,
	[Mailing Address State Code] [nvarchar](2) NULL,
	[Mailing Address Zip Code] [nvarchar](9) NULL,
	[Contact Last Name] [nvarchar](20) NULL,
	[Contact First Name] [nvarchar](20) NULL,
	[Contact Middle Initial] [nvarchar](1) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact Phone Number] [nvarchar](10) NULL,
	[Contact Extension] [nvarchar](5) NULL,
	[Contact E-mail Address] [nvarchar](50) NULL,
	[Dispenser Class Code] [nvarchar](2) NULL,
	[Primary Dispenser Type Code] [nvarchar](2) NULL,
	[Secondary Dispenser Type Code] [nvarchar](2) NULL,
	[Tertiary Dispenser Type Code] [nvarchar](2) NULL,
	[Medicare Provider (supplier) ID] [nvarchar](10) NULL,
	[NPI] [nvarchar](10) NULL,
	[DEA] [nvarchar](12) NULL,
	[Federal Tax ID Number] [nvarchar](15) NULL,
	[State License Number] [nvarchar](20) NULL,
	[State Income Tax ID NUmber] [nvarchar](15) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Transaction Code] [nvarchar](1) NULL,
	[Transaction Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](108) NULL,
	[EndLine] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPProviderRelationship]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPProviderRelationship](
	[NCPDP] [nvarchar](7) NULL,
	[Relationship ID] [nvarchar](3) NULL,
	[Payment Center ID] [nvarchar](6) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Effective Through Date] [nvarchar](8) NULL,
	[filler] [nvarchar](118) NULL,
	[endline] [nvarchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPRelationshipDemographic]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPRelationshipDemographic](
	[Relationship ID] [nvarchar](3) NULL,
	[Relationship Type] [nvarchar](2) NULL,
	[Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[E-mail Address] [nvarchar](50) NULL,
	[Parent Organization ID] [nvarchar](6) NULL,
	[Delete Date] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPRelationshipDemographicInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPRelationshipDemographicInformation](
	[RelationshipID] [nvarchar](3) NULL,
	[Relationship Type] [nvarchar](2) NULL,
	[Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Relationship NPI] [nvarchar](10) NULL,
	[Relationship Federal Tax ID] [nvarchar](15) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact E-mail] [nvarchar](50) NULL,
	[Contractual Name] [nvarchar](30) NULL,
	[Contractual Title] [nvarchar](30) NULL,
	[Contractual E-mail] [nvarchar](50) NULL,
	[Operational Name] [nvarchar](30) NULL,
	[Operational Title] [nvarchar](30) NULL,
	[Operational E-mail] [nvarchar](50) NULL,
	[Technical Name] [nvarchar](30) NULL,
	[Technical Title] [nvarchar](30) NULL,
	[Technical E-mail] [nvarchar](50) NULL,
	[Audit Name] [nvarchar](30) NULL,
	[Audit Title] [nvarchar](30) NULL,
	[Audit E-mail] [nvarchar](50) NULL,
	[Parent Organization ID] [nvarchar](6) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](187) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPRemitAndReconciliationInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPRemitAndReconciliationInformation](
	[Remit and Reconciliation ID] [nvarchar](6) NULL,
	[Remit and Reconciliation Name] [nvarchar](35) NULL,
	[Remit and Reconciliation Address 1] [nvarchar](55) NULL,
	[Remit and Reconciliation Address 2] [nvarchar](55) NULL,
	[Remit and Reconciliation City] [nvarchar](30) NULL,
	[Remit and Reconciliation State Code] [nvarchar](2) NULL,
	[Remit and Reconciliation Zip Code] [nvarchar](9) NULL,
	[Remit and Reconciliation Phone Number] [nvarchar](10) NULL,
	[Remit and Reconciliation Extension] [nvarchar](5) NULL,
	[Remit and Reconciliation FAX Number] [nvarchar](10) NULL,
	[Remit and Reconciliation NPI] [nvarchar](10) NULL,
	[Remit and Reconciliation Federal Tax ID] [nvarchar](15) NULL,
	[Remit and Reconciliation Contact Name] [nvarchar](30) NULL,
	[Remit and Reconciliation Contact Title] [nvarchar](30) NULL,
	[Remit and Reconciliation Contact E-mail Address] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPServicesInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPServicesInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Accepts ePrescriptions Indicator] [nvarchar](1) NULL,
	[Accepts ePrescriptions Code] [nvarchar](2) NULL,
	[Delivery Service Indicator] [nvarchar](1) NULL,
	[Delivery Service Code] [nvarchar](2) NULL,
	[Compounding Service Indicator] [nvarchar](1) NULL,
	[Compounding Service Code] [nvarchar](2) NULL,
	[Drive-Up Window Indicator] [nvarchar](1) NULL,
	[Drive-Up Window Code] [nvarchar](2) NULL,
	[DME Indicator] [nvarchar](1) NULL,
	[DME Code] [nvarchar](2) NULL,
	[Walk-In Clinic Indicator] [nvarchar](1) NULL,
	[Walk-In Clinic Code] [nvarchar](2) NULL,
	[24-Hour Emergency Indicator] [nvarchar](1) NULL,
	[24-Hour Emergency Code] [nvarchar](2) NULL,
	[Multi-Dose Compliance Packaging Indicator] [nvarchar](1) NULL,
	[Multi-Dose Compliance Packaging Code] [nvarchar](2) NULL,
	[Immunizations Provided Indicator] [nvarchar](1) NULL,
	[Immunizations Provided Code] [nvarchar](2) NULL,
	[Handicapped Accessible Indicator] [nvarchar](1) NULL,
	[Handicapped Accessible Code] [nvarchar](2) NULL,
	[340B Status Indicator] [nvarchar](1) NULL,
	[340B Status Code] [nvarchar](2) NULL,
	[Closed Door Facility Indicator] [nvarchar](1) NULL,
	[Closed Door Facility Code] [nvarchar](2) NULL,
	[Filler] [nvarchar](107) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPStateLicenseInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPStateLicenseInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[License State Code] [nvarchar](2) NULL,
	[State License Number] [nvarchar](20) NULL,
	[State License Expiration Date] [nvarchar](8) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPStateMedicaidInfo]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPStateMedicaidInfo](
	[NCPDP] [nvarchar](7) NULL,
	[State Code] [nvarchar](2) NULL,
	[Medicaid ID] [nvarchar](20) NULL,
	[Delete Date] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPTaxonomyInfo]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPTaxonomyInfo](
	[NCPDP] [nvarchar](7) NULL,
	[Taxonomy Code] [nvarchar](10) NULL,
	[Dispenser Type Code] [nvarchar](2) NULL,
	[Delete Date] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDPTaxonomyInformation]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPTaxonomyInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Taxonomy Code] [nvarchar](10) NULL,
	[Provider Type Code] [nvarchar](2) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](123) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ObjectList_RSE]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectList_RSE](
	[ObjectName] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OldNewVendorsLink]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OldNewVendorsLink](
	[VendorID] [int] NULL,
	[OldVendorID] [int] NULL,
	[OldVolumeName] [varchar](50) NULL,
	[Reports] [varchar](1) NULL,
	[Active] [int] NULL,
	[EffectDate] [datetime] NULL,
	[Factor] [numeric](2, 2) NULL,
	[TotalPercentRebate] [numeric](2, 2) NULL,
	[Active2007] [int] NULL,
	[VendorPair] [int] NULL,
	[PPVendorID] [int] NULL,
	[OldRebateName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_2](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[RebateReportDisplayName] [varchar](255) NULL,
	[PPVendorID] [int] NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partnercategory]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partnercategory](
	[PARTNER_CATEGORY_ID] [int] IDENTITY(1,1) NOT NULL,
	[CATEGORY] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL,
 CONSTRAINT [PK_partnercategory] PRIMARY KEY CLUSTERED 
(
	[PARTNER_CATEGORY_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerDetails]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerDetails](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[PPFeeNote] [nvarchar](24) NULL,
	[VENDOR] [nvarchar](56) NULL,
	[Website Program Description] [nvarchar](586) NULL,
	[MemberDeal] [nvarchar](863) NULL,
	[PurchaseIncentive] [nvarchar](34) NULL,
	[PPContract Billed] [nvarchar](12) NULL,
	[PPContract Pd] [ntext] NULL,
	[Contract Pricing Start Date] [datetime] NULL,
	[Contract Pricing End Date] [datetime] NULL,
	[Corporate Rebate] [nvarchar](251) NULL,
	[Pat Rebate] [nvarchar](3) NULL,
	[Rebate To FPN] [nvarchar](173) NULL,
	[Rebate From FPN to United] [nvarchar](177) NULL,
	[CustomerServicePhone] [nvarchar](17) NULL,
	[Customer Service Toll Free] [nvarchar](26) NULL,
	[Customer Service Fax] [nvarchar](27) NULL,
	[CustomerServiceE-mail] [nvarchar](66) NULL,
	[WEBSITE] [nvarchar](75) NULL,
	[CorpAddr1] [nvarchar](39) NULL,
	[CorpAddr2] [nvarchar](15) NULL,
	[CorpCity] [nvarchar](16) NULL,
	[CorpSt] [nvarchar](2) NULL,
	[CorpZip] [nvarchar](10) NULL,
	[CORP800] [nvarchar](28) NULL,
	[CorpPhone] [nvarchar](20) NULL,
	[CorpFax] [nvarchar](27) NULL,
	[Last Modified] [datetime] NULL,
	[Why Modified] [nvarchar](255) NULL,
	[PPContract  Effective] [datetime] NULL,
	[PPContract  Expiration] [datetime] NULL,
	[Marketing Package] [nvarchar](9) NULL,
	[Tier] [nvarchar](27) NULL,
	[PreferedPartnerSince] [smallint] NULL,
	[Contract Term Date] [datetime] NULL,
	[Active] [nvarchar](3) NULL,
	[PIPCo Program] [nvarchar](3) NULL,
	[United PIPCoUses] [nvarchar](3) NULL,
	[NotesPPPStatus] [nvarchar](648) NULL,
	[Vendor Type] [nvarchar](42) NULL,
	[Annual Renewal LetterSent] [nvarchar](3) NULL,
	[Welcome E-mail Infor Form] [nvarchar](1) NULL,
	[InfoFormReturned] [nvarchar](1) NULL,
	[WelcomeLetterMarketingCalendar] [nvarchar](1) NULL,
	[MKt BannerStart Date] [datetime] NULL,
	[Mkt BannerEnd Date] [datetime] NULL,
	[SSI] [nvarchar](3) NULL,
	[Spin Reports United] [nvarchar](1) NULL,
	[Spin Reports Partner] [nvarchar](1) NULL,
	[Spin Report Notes] [nvarchar](521) NULL,
	[Spin Reports N A] [nvarchar](1) NULL,
	[Spin Reports FPN] [nvarchar](1) NULL,
	[DirectorySent] [nvarchar](1) NULL,
	[LinkedURL] [nvarchar](213) NULL,
	[Phone Website] [nvarchar](42) NULL,
	[RFP] [nvarchar](1) NULL,
	[Purchase From] [nvarchar](46) NULL,
 CONSTRAINT [PK_PartnerDetails] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerDetails_PPU]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerDetails_PPU](
	[PARTNER_ID] [int] NULL,
	[VENDOR] [nvarchar](56) NULL,
	[CustomerServiceE-mail] [nvarchar](66) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerFactors]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerFactors](
	[VendorID] [int] NOT NULL,
	[Factor] [numeric](5, 4) NULL,
	[EffectiveFrom] [datetime] NULL,
	[EffectiveUntil] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partnerlevel]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partnerlevel](
	[PARTNER_LEVEL_ID] [int] IDENTITY(1,1) NOT NULL,
	[LABEL] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL,
 CONSTRAINT [PK_partnerlevel] PRIMARY KEY CLUSTERED 
(
	[PARTNER_LEVEL_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[RebateReportDisplayName] [varchar](255) NULL,
	[PPVendorID] [int] NULL,
	[Active] [bit] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ParticipationReportActive] [int] NOT NULL,
	[ParticipationReportRank] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners_backup_RSE_20200206]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_backup_RSE_20200206](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[RebateReportDisplayName] [varchar](255) NULL,
	[PPVendorID] [int] NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_0317]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_0317](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_bak]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_bak](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_bak_1]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_bak_1](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_Feb0816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_Feb0816](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_Feb2416]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_Feb2416](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_Feb26]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_Feb26](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_Feb27]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_Feb27](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptions_Nov21]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptions_Nov21](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOptionsb_Feb0816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOptionsb_Feb0816](
	[Vendor ID] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy1]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy1](
	[PMID] [int] IDENTITY(100000,1) NOT FOR REPLICATION NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIStatus] [varchar](32) NULL,
	[AreaCode] [varchar](3) NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[ChainCode] [varchar](10) NULL,
	[City] [varchar](25) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContractDate] [datetime] NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[Email] [varchar](80) NULL,
	[Fax] [varchar](50) NULL,
	[FaxAreaCode] [varchar](3) NULL,
	[FedID] [varchar](12) NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[Phone] [varchar](50) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Source] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[Zip] [varchar](10) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_Pharmacy1] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmacyPending]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmacyPending](
	[Pharmacy DBA Name] [nvarchar](200) NULL,
	[Store] [nvarchar](50) NULL,
	[NCPDP ID] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[Main Phone] [nvarchar](50) NULL,
	[Change] [nvarchar](50) NULL,
	[Submitted] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmSystemsArete]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmSystemsArete](
	[Software] [nvarchar](255) NULL,
	[parent] [varchar](255) NULL,
	[StoreCount] [int] NULL,
	[Company] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PharmSystemsAreteAAP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PharmSystemsAreteAAP](
	[Software] [nvarchar](255) NULL,
	[parent] [varchar](255) NULL,
	[StoreCount] [int] NULL,
	[Company] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PIPCoPFOAMembers]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PIPCoPFOAMembers](
	[PMID] [varchar](50) NULL,
	[Group] [varchar](50) NULL,
	[Parent] [varchar](255) NULL,
	[PIPCoNo] [varchar](50) NULL,
	[CardinalNo] [varchar](50) NULL,
	[AAPAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Zip] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planograms]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planograms](
	[AAP Acct No] [nvarchar](50) NULL,
	[API Acct No] [nvarchar](50) NULL,
	[Planogram] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AccountDescriptions]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AccountDescriptions](
	[Description] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AccountDescriptions_Decommission_20190425]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AccountDescriptions_Decommission_20190425](
	[Description] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AddressMaster]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressMaster](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_AddressMaster] PRIMARY KEY CLUSTERED 
(
	[PK_AddressMaster] ASC,
	[PMID] ASC,
	[Address_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_addressmaster_backup]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_addressmaster_backup](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AddressMaster_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressMaster_bkp](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AddressMaster_Decommission_20190424]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressMaster_Decommission_20190424](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AddressMaster_Decommission_20190425]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressMaster_Decommission_20190425](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AddressType]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressType](
	[address_type_id] [int] NOT NULL,
	[address_type_description] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[address_type] [int] NULL,
 CONSTRAINT [PK_PM_AddressType] PRIMARY KEY CLUSTERED 
(
	[address_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AffiliateHistory]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AffiliateHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[GroupID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[StatusCode] [varchar](50) NULL,
 CONSTRAINT [PK_PM_AffiliateHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AffiliateHistory_backup_20190925]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AffiliateHistory_backup_20190925](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[GroupID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AffiliateHistory_bkp_20201005]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AffiliateHistory_bkp_20201005](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[GroupID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[StatusCode] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AffiliateHistory_bkp_20201008]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AffiliateHistory_bkp_20201008](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[GroupID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[StatusCode] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_bkp_2016NegativePayments]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_bkp_2016NegativePayments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
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
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_bkp041117]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_bkp041117](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
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
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_annualrebates_bkpB4POG]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_annualrebates_bkpB4POG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
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
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_minus2017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_minus2017](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
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
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_New]    Script Date: 12/22/2020 3:01:06 AM ******/
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
/****** Object:  Table [dbo].[PM_AnnualRebates_New_old_20200326]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_New_old_20200326](
	[ID] [int] NOT NULL,
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
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_NewBK20190705]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_NewBK20190705](
	[ID] [int] NOT NULL,
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
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_NewBK20190717]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_NewBK20190717](
	[ID] [int] NOT NULL,
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
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_NewBK20190723]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_NewBK20190723](
	[ID] [int] NOT NULL,
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
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_old_RSE_20180815]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_old_RSE_20180815](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
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
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_APIAccounts]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_APIAccounts](
	[APIAccountNo] [varchar](20) NOT NULL,
	[PMID] [int] NULL,
	[DEA] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](32) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_APIAccount] PRIMARY KEY CLUSTERED 
(
	[APIAccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Audit]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Audit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [nvarchar](7) NOT NULL,
	[DateUDNotified] [datetime] NULL,
	[NotifyType] [nvarchar](50) NULL,
	[DateAuditNotice] [datetime] NULL,
	[AuditDate] [datetime] NULL,
	[AuditTypeId] [int] NULL,
	[AuditPlanId] [int] NULL,
	[AuditFirmId] [int] NULL,
	[InitialDateNotice] [datetime] NULL,
	[InitialAuditAmount] [money] NULL,
	[InitialAuditDeadline] [datetime] NULL,
	[FinalDateNotice] [datetime] NULL,
	[FinalAuditNoticeDate] [datetime] NULL,
	[FinalAuditAmount] [money] NULL,
	[Notes] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](250) NOT NULL,
	[HistoricalNotes] [nvarchar](max) NULL,
	[MultipleStoreDiscount] [bit] NULL,
	[AmountBilledToPharmacy] [money] NULL,
	[BusinessLine] [nvarchar](50) NULL,
 CONSTRAINT [PK_PM_Audit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AuditFirm]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AuditFirm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuditFirm] [nvarchar](50) NULL,
 CONSTRAINT [PK_PM_AuditFirm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AuditPlan]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AuditPlan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuditPlan] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AuditType]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AuditType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuditType] [nvarchar](50) NULL,
 CONSTRAINT [PK_PM_AuditType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_BrandCredits_APIMonthly_bkp20171009]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_BrandCredits_APIMonthly_bkp20171009](
	[Date] [varchar](10) NULL,
	[PMID] [varchar](50) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[BrandCredits] [money] NULL,
	[Territory] [varchar](255) NULL,
	[BrandSales] [money] NULL,
	[ACH] [bit] NULL,
	[PayTerms] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_BrandCredits_APIMonthly_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_BrandCredits_APIMonthly_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](10) NULL,
	[PMID] [varchar](50) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[BrandCredits] [money] NULL,
	[Territory] [varchar](255) NULL,
	[BrandSales] [money] NULL,
	[ACH] [bit] NULL,
	[PayTerms] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_PM_BrandCredits_APIMonthly_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_BrandCredits_APIMonthly_old_RSE_20180816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_BrandCredits_APIMonthly_old_RSE_20180816](
	[Date] [varchar](10) NULL,
	[PMID] [varchar](50) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[BrandCredits] [money] NULL,
	[Territory] [varchar](255) NULL,
	[BrandSales] [money] NULL,
	[ACH] [bit] NULL,
	[PayTerms] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CardinalDCs]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CardinalDCs](
	[DCNum] [int] NULL,
	[DCName] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Categories]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](70) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2012]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2012](
	[date] [varchar](10) NOT NULL,
	[extsales] [float] NULL,
	[pmid] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2012Pivot]    Script Date: 12/22/2020 3:01:06 AM ******/
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
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2013]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2013](
	[date] [varchar](10) NOT NULL,
	[extsales] [float] NULL,
	[pmid] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2013_Pivot]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2013_Pivot](
	[PMID] [varchar](255) NULL,
	[AccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
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
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_AnnualAdminFee_2014](
	[date] [varchar](10) NOT NULL,
	[extsales] [float] NULL,
	[pmid] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CH_AnnualAdminFee_2014_Pivot]    Script Date: 12/22/2020 3:01:06 AM ******/
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
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06222018_154126] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_061316]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_061316](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05232016_062306] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_10272017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_10272017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10182017_121724] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_bkp](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced010617]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced010617](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_12212016_092025] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced011317]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced011317](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_01062017_124610] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced01202017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced01202017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_01132017_102328] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced020317]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced020317](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_01202017_093041] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced020917]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced020917](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_02032017_144233] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced032417]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced032417](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_02092017_101724] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced041717]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced041717](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_03242017_074347] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced042816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced042816](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_04042016_064642] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced05032018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced05032018](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11302017_092016] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced050817]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced050817](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_04172017_101004] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced051016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced051016](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_04282016_082454] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced051118]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced051118](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05032018_090532] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced051517]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced051517](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05082017_130314] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced051717]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced051717](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05152017_162714] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced052316]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced052316](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced05252018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced05252018](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05112018_161521] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced060217]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced060217](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05192017_162127] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced06082018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced06082018](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_05252018_093542] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced061217]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced061217](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06022017_153107] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced06152018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced06152018](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06082018_144943] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced06222018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced06222018](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06152018_152149] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced062317]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced062317](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06122017_100124] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced070117]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced070117](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06232017_104227] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced071116]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced071116](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_06132016_052031] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced071217]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced071217](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_07122017_164837] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced071816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced071816](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_07112016_053341] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced072017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced072017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_07122017_165431] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced080116]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced080116](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_07182016_043556] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced081516]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced081516](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced082517]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced082517](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_07202017_111134] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced082916]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced082916](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced083017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced083017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_08252017_095856] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced090717]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced090717](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_08302017_093945] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced09142017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced09142017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_09142017_110245] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced091516]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced091516](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_08292016_071245] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced09212017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced09212017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_09142017_112349] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced092817]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced092817](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_09212017_094918] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced100416]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced100416](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10042016_062036] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced10042016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced10042016](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_09152016_064728] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced100517]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced100517](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_09282017_085250] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced101217]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced101217](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10052017_102622] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced10182017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced10182017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10122017_092455] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced101916]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced101916](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10112016_115216] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced102716]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced102716](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10192016_143518] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced110317]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced110317](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10272017_100128] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced111016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced111016](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_10272016_071704] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced111017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced111017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11032017_131636] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced11172017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced11172017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11102017_104837] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced111816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced111816](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11102016_125808] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced113016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced113016](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11182016_091932] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced11302017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced11302017](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11172017_104809] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced121216]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced121216](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_11302016_101739] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_replaced122116]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_replaced122116](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [PK_PMCHAccounts_PMID_12122016_092421] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ_TEST]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ_TEST](
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
	[CAH Multi Store Code] [nvarchar](255) NULL,
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
	[Clawback bps] [float] NULL,
	[Delivery bps] [float] NULL,
	[Payment Terms description] [nvarchar](255) NULL,
	[Payment Terms Code] [nvarchar](255) NULL,
	[CAH terms Code Desc] [nvarchar](255) NULL,
	[Pending Changes] [bit] NOT NULL,
	[Change Pending] [nvarchar](255) NULL,
	[Notes COG Differences] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[AAP Rep] [nvarchar](255) NULL,
	[Excpt to Matrix] [bit] NOT NULL,
	[Excpt Code] [nvarchar](255) NULL,
	[Optional Pay Terms] [bit] NOT NULL,
	[DSO Terms Adj] [float] NULL,
	[Contracted DSO] [float] NULL,
	[Sublogic Change] [bit] NOT NULL,
	[High Volume Rebate] [bit] NOT NULL,
	[Est Annual Vol on comn own] [money] NULL,
	[Matrix Name] [nvarchar](255) NULL,
	[Avg Mo Gen Compliance] [float] NULL,
	[MCR Mo Volume for COG] [money] NULL,
	[MCR Month] [nvarchar](255) NULL,
	[MCR Percentage] [float] NULL,
	[Date Rcvd New MC] [datetime] NULL,
	[Effective Date New Agmt] [datetime] NULL,
	[New Agmt Type] [nvarchar](255) NULL,
	[MC AMQP] [money] NULL,
	[MC AMGC%] [float] NULL,
	[MC COG] [float] NULL,
	[MC Terms] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_ADJ2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_ADJ2](
	[PMID] [int] NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_BAS]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_BAS](
	[PMID] [int] NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHAccounts_Secondary]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHAccounts_Secondary](
	[PMID] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
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
	[3rd CST] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ChainCodes]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ChainCodes](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_ChainCodes] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHDivisions]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHDivisions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DivNo] [varchar](10) NULL,
	[DivName] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](10) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
 CONSTRAINT [PK_PM_CHDivisions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CHPayTerms]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CHPayTerms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayTerms] [nvarchar](255) NULL,
	[PayTermsDesc] [nvarchar](255) NULL,
 CONSTRAINT [PK_PM_CHPayTerms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CommType]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CommType](
	[CommID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[ProgramID] [int] NULL,
	[EditOnWeb] [bit] NULL,
 CONSTRAINT [PK_PM_Comm] PRIMARY KEY CLUSTERED 
(
	[CommID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CommunicationPreferences]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CommunicationPreferences](
	[commPreference] [varchar](1) NOT NULL,
	[Description] [varchar](20) NULL,
 CONSTRAINT [PK_PM_CommunicationPreferences] PRIMARY KEY CLUSTERED 
(
	[commPreference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Corporate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Corporate](
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
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL,
	[CorpID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CorporateB4Delete]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CorporateB4Delete](
	[CorpID] [int] IDENTITY(1,1) NOT NULL,
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
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CorporateBak]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CorporateBak](
	[CorpID] [int] NOT NULL,
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
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[Source] [varchar](15) NULL,
	[BusinessClass] [varchar](3) NULL,
	[Status] [varchar](50) NULL,
	[Territory] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Cred]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Cred](
	[PK_Cred] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[StateLicNo] [varchar](30) NULL,
	[StateMedicaidNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo2] [varchar](15) NULL,
	[StateMedicaidNo2] [varchar](15) NULL,
	[StateLicExpDate2] [datetime] NULL,
	[GenLiabCarrier] [varchar](50) NULL,
	[GenLiabPolicyNumber] [varchar](20) NULL,
	[GenLiabilityLimit1] [int] NULL,
	[GenLiabilityLimit2] [int] NULL,
	[GenInsExpDate] [datetime] NULL,
	[ProfLiabCarrier] [varchar](50) NULL,
	[ProfLiabInsExpDate] [datetime] NULL,
	[ProfPolicyNumber] [varchar](20) NULL,
	[ProfLiabLimit1] [int] NULL,
	[ProfLiabLimit2] [int] NULL,
	[DeliveryService] [smallint] NULL,
	[EmergencyServices] [smallint] NULL,
	[AnsweringServiceOrMachine] [smallint] NULL,
	[AlternativeLanguages] [varchar](50) NULL,
	[SpecialtyServices] [varchar](50) NULL,
	[Obra90] [smallint] NULL,
	[CounselingArea] [smallint] NULL,
	[PatientMR] [smallint] NULL,
	[DrugInformation] [smallint] NULL,
	[FraudFelonyConviction] [smallint] NULL,
	[FraudFelonyExplanation] [varchar](150) NULL,
	[RxLicenseSuspendedOrRevoked] [smallint] NULL,
	[SuspensionRevokationExplanation] [varchar](150) NULL,
	[UnrestrictedLicense] [smallint] NULL,
	[UnrestrictedLicenseExplanation] [varchar](150) NULL,
	[InvestigatedByMedicareMedicaid] [smallint] NULL,
	[UAICoverage] [smallint] NULL,
	[Judgements] [smallint] NULL,
	[CompliesWithADAAct] [smallint] NULL,
	[AverageWaitTime] [int] NULL,
	[MedicationErrorsDocumented] [smallint] NULL,
	[ErrorCount12Months] [smallint] NULL,
	[HasResolutionPolicy] [smallint] NULL,
	[doesCompoundPrescriptions] [smallint] NULL,
	[UnitDosing] [smallint] NULL,
	[ProvidesDME] [smallint] NULL,
	[ProvidesIV] [smallint] NULL,
	[CertifiedDiseaseMgmt] [smallint] NULL,
	[CDMExplanation] [varchar](150) NULL,
	[GroupPresentations] [smallint] NULL,
	[ContinuingEducationRequired] [smallint] NULL,
	[StoreSizeClassification] [varchar](1) NULL,
	[CopyReleaseInfo] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[InvestigatedByMedicareMedicaidExplanation] [varchar](150) NULL,
	[JudgementsExplanation] [varchar](150) NULL,
 CONSTRAINT [PK_PM_Cred] PRIMARY KEY CLUSTERED 
(
	[PK_Cred] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_cred_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_cred_bkp](
	[PK_Cred] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[StateLicNo] [varchar](15) NULL,
	[StateMedicaidNo] [varchar](15) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo2] [varchar](15) NULL,
	[StateMedicaidNo2] [varchar](15) NULL,
	[StateLicExpDate2] [datetime] NULL,
	[GenLiabCarrier] [varchar](30) NULL,
	[GenLiabPolicyNumber] [varchar](20) NULL,
	[GenLiabilityLimit1] [int] NULL,
	[GenLiabilityLimit2] [int] NULL,
	[GenInsExpDate] [datetime] NULL,
	[ProfLiabCarrier] [varchar](30) NULL,
	[ProfLiabInsExpDate] [datetime] NULL,
	[ProfPolicyNumber] [varchar](20) NULL,
	[ProfLiabLimit1] [int] NULL,
	[ProfLiabLimit2] [int] NULL,
	[DeliveryService] [smallint] NULL,
	[EmergencyServices] [smallint] NULL,
	[AnsweringServiceOrMachine] [smallint] NULL,
	[AlternativeLanguages] [varchar](50) NULL,
	[SpecialtyServices] [varchar](50) NULL,
	[Obra90] [smallint] NULL,
	[CounselingArea] [smallint] NULL,
	[PatientMR] [smallint] NULL,
	[DrugInformation] [smallint] NULL,
	[FraudFelonyConviction] [smallint] NULL,
	[FraudFelonyExplanation] [varchar](150) NULL,
	[RxLicenseSuspendedOrRevoked] [smallint] NULL,
	[SuspensionRevokationExplanation] [varchar](150) NULL,
	[UnrestrictedLicense] [smallint] NULL,
	[UnrestrictedLicenseExplanation] [varchar](150) NULL,
	[InvestigatedByMedicareMedicaid] [smallint] NULL,
	[UAICoverage] [smallint] NULL,
	[Judgements] [smallint] NULL,
	[CompliesWithADAAct] [smallint] NULL,
	[AverageWaitTime] [int] NULL,
	[MedicationErrorsDocumented] [smallint] NULL,
	[ErrorCount12Months] [smallint] NULL,
	[HasResolutionPolicy] [smallint] NULL,
	[doesCompoundPrescriptions] [smallint] NULL,
	[UnitDosing] [smallint] NULL,
	[ProvidesDME] [smallint] NULL,
	[ProvidesIV] [smallint] NULL,
	[CertifiedDiseaseMgmt] [smallint] NULL,
	[CDMExplanation] [varchar](150) NULL,
	[GroupPresentations] [smallint] NULL,
	[ContinuingEducationRequired] [smallint] NULL,
	[StoreSizeClassification] [varchar](1) NULL,
	[CopyReleaseInfo] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CRM_Affiliate_Lookup]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CRM_Affiliate_Lookup](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PM] [varchar](25) NOT NULL,
	[CRM] [varchar](25) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Deleted]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Deleted](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL,
 CONSTRAINT [PK_PM_Deleted_1] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_111414]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_111414](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_112114]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_112114](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_Feb0816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_Feb0816](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_Feb2416]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_Feb2416](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_Feb26]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_Feb26](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_Feb27]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_Feb27](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_March17]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_March17](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_deleted_March2017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_deleted_March2017](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVolume] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](2) NULL,
	[StoreHours_HolidayPM] [varchar](2) NULL,
	[StoreHours_MondayFridayAM] [varchar](2) NULL,
	[StoreHours_MondayFridayPM] [varchar](2) NULL,
	[StoreHours_SaturdayAM] [varchar](2) NULL,
	[StoreHours_SaturdayPM] [varchar](2) NULL,
	[StoreHours_SundayAM] [varchar](2) NULL,
	[StoreHours_SundayPM] [varchar](2) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_DeletedPMID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_DeletedPMID](
	[PK_DeletedPMID] [int] IDENTITY(1,1) NOT NULL,
	[Deleted_PMID] [int] NULL,
	[MovedTo_PMID] [int] NULL,
	[Reason] [varchar](255) NULL,
	[DeletedDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_DeletedPMID] PRIMARY KEY CLUSTERED 
(
	[PK_DeletedPMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_geocode]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_geocode](
	[pmid] [int] NOT NULL,
	[GAddress] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Updated] [datetime] NULL,
	[pm_address_type] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_geocode_backup021916]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_geocode_backup021916](
	[pmid] [int] NOT NULL,
	[GAddress] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Updated] [datetime] NULL,
	[pm_address_type] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_geocode_tpn]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_geocode_tpn](
	[pmid] [int] NOT NULL,
	[GAddress] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Updated] [datetime] NULL,
	[pm_address_type] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Groups]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [varchar](125) NOT NULL,
	[Group_MailTo_Name] [varchar](200) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactName] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[BusCls] [varchar](50) NULL,
	[AffiliateID] [int] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Groups] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Groups_xref]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups_xref](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Groups_xref] PRIMARY KEY CLUSTERED 
(
	[Grpxref_ID] ASC,
	[PMID] ASC,
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_groups_xref_031714]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_groups_xref_031714](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Groups_xref_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups_xref_bkp](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Groups_xref_bkp_20201009]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups_xref_bkp_20201009](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_HoldbackPercent]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_HoldbackPercent](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[HeldBy] [varchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[HoldbackPercent] [decimal](18, 4) NULL,
	[HeldFrom] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[Group_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_HoldbackPercent_RSE_20180809]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_HoldbackPercent_RSE_20180809](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[HeldBy] [varchar](50) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[HoldbackPercent] [decimal](18, 4) NULL,
	[HeldFrom] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[Group_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Locks]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Locks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[LockTime] [smalldatetime] NOT NULL,
	[sysuser] [varchar](100) NULL,
 CONSTRAINT [PK_PM_Locks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ManagedCare]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ManagedCare](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[MCNews_EmailAddress] [varchar](150) NULL,
	[emailMCNews] [smallint] NULL,
	[McQuitReasonInternal] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[ESI] [smallint] NULL,
 CONSTRAINT [PK_PM_ManagedCare] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ManagedCare_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ManagedCare_bkp](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ManagedCare_bkp20200406]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ManagedCare_bkp20200406](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[MCNews_EmailAddress] [varchar](150) NULL,
	[emailMCNews] [smallint] NULL,
	[McQuitReasonInternal] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[ESI] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_MemberComm]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_MemberComm](
	[PMID] [int] NOT NULL,
	[CommID] [int] NOT NULL,
	[Email] [varchar](max) NULL,
	[AlternateFax] [varchar](255) NULL,
	[UseFaxNotEmail] [bit] NULL,
	[OptOut] [bit] NULL,
	[CommunicationPreference] [varchar](1) NULL,
 CONSTRAINT [PK_PM_MemberComm] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[CommID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_MemberPrograms]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_MemberPrograms](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL,
 CONSTRAINT [PK_PM_MemberPrograms] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_MemberPrograms_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_MemberPrograms_bkp](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_memberprograms_bkp030816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_memberprograms_bkp030816](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_MemberPrograms_TESTJMW]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_MemberPrograms_TESTJMW](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_MembershipTypes]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_MembershipTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_MembershipTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Modifications]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Modifications](
	[PMID] [int] NOT NULL,
	[ModDate] [datetime] NOT NULL,
	[ModType] [varchar](10) NULL,
	[Reason] [varchar](100) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Modifications] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[ModDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_OrganizationTypes]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_OrganizationTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_OrganizationTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Permissions]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Permissions](
	[sysUser] [varchar](75) NOT NULL,
	[Administration] [smallint] NULL,
	[AllowDelete] [smallint] NULL,
	[ReadOnly] [smallint] NULL,
	[TestDatabase] [smallint] NULL,
	[WholeSaler_RW] [smallint] NULL,
	[WebPermissions] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Permissions] PRIMARY KEY CLUSTERED 
(
	[sysUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Permissions_Decommission_20190424]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Permissions_Decommission_20190424](
	[sysUser] [varchar](75) NOT NULL,
	[Administration] [smallint] NULL,
	[AllowDelete] [smallint] NULL,
	[ReadOnly] [smallint] NULL,
	[TestDatabase] [smallint] NULL,
	[WholeSaler_RW] [smallint] NULL,
	[WebPermissions] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Permissions_Decommission_20190425]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Permissions_Decommission_20190425](
	[sysUser] [varchar](75) NOT NULL,
	[Administration] [smallint] NULL,
	[AllowDelete] [smallint] NULL,
	[ReadOnly] [smallint] NULL,
	[TestDatabase] [smallint] NULL,
	[WholeSaler_RW] [smallint] NULL,
	[WebPermissions] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Pharmacists]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Pharmacists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[PharPrime] [smallint] NULL,
	[PharFullName] [varchar](255) NULL,
	[PharTitle] [varchar](20) NULL,
	[PharState] [varchar](2) NULL,
	[PharLicNo] [varchar](20) NULL,
	[PharExpDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Pharmacists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Pharmacy]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Pharmacy](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL,
	[APIAccountNumHistorical] [varchar](20) NULL,
	[APIAccountNumHistoricalEndDate] [date] NULL,
	[S2KAccountNumEffDate] [date] NULL,
	[TMEmailAddress] [varchar](250) NULL,
 CONSTRAINT [PK_PM_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Pharmacy_Decommission_20190424]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Pharmacy_Decommission_20190424](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Pharmacy_Decommission_20190425]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Pharmacy_Decommission_20190425](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Pharmacy_Rx3]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Pharmacy_Rx3](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](80) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](80) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Programs]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Programs](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
	[CommentConst] [varchar](255) NULL,
	[Category] [char](1) NULL,
	[AAP] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[WebProfile] [smallint] NOT NULL,
 CONSTRAINT [PK_PM_Programs_New] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Programs_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Programs_bkp](
	[ProgramID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CommentConst] [varchar](255) NULL,
	[Category] [char](1) NULL,
	[AAP] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[WebProfile] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Programs_SR263]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Programs_SR263](
	[ProgramID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CommentConst] [varchar](255) NULL,
	[Category] [char](1) NULL,
	[AAP] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[WebProfile] [smallint] NOT NULL,
 CONSTRAINT [PK_PM_Programs] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ProgramStep]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ProgramStep](
	[ProgramStepID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NULL,
	[StepSeq] [int] NULL,
	[StepName] [nvarchar](100) NULL,
 CONSTRAINT [PK_PM_ProgramStep] PRIMARY KEY CLUSTERED 
(
	[ProgramStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ProgramStepMember]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ProgramStepMember](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ProgramStepID] [int] NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
 CONSTRAINT [PK_PM_ProgramStepMember] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[ProgramID] ASC,
	[ProgramStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_programstepmember_101414]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_programstepmember_101414](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[ProgramStepID] [int] NOT NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIMonthly_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIMonthly_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
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
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NULL,
	[Print Rebate Letter] [bit] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Previous Month Held Rebate] [money] NULL,
	[PostAveRebatePerc] [nvarchar](255) NULL,
	[True10Sales] [money] NULL,
	[True10Rebate] [money] NULL,
	[AreteRebateFee] [money] NULL,
	[APIInstantRebate] [money] NULL,
	[CalcAPIRebatePercentage] [decimal](18, 4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[APIGenericSalesTier1] [money] NOT NULL,
	[APIGenericSalesTier2] [money] NOT NULL,
	[APIGenericRebateTier1] [money] NOT NULL,
	[APIGenericRebateTier2] [money] NOT NULL,
	[ConferenceCreditOnePercent] [money] NOT NULL,
 CONSTRAINT [CPK_PM_Rebates_APIMonthly_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIMonthly_old_RSE_20180816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIMonthly_old_RSE_20180816](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
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
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NULL,
	[Print Rebate Letter] [bit] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Previous Month Held Rebate] [money] NULL,
	[PostAveRebatePerc] [nvarchar](255) NULL,
	[True10Sales] [money] NULL,
	[True10Rebate] [money] NULL,
	[AreteRebateFee] [money] NULL,
	[APIInstantRebate] [money] NULL,
	[CalcAPIRebatePercentage] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIQuarterly]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIQuarterly](
	[Period] [varchar](10) NOT NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
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
	[Generic Admin Fee] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Donepezil Rebate on Sales out] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NOT NULL,
	[Print Rebate Letter] [bit] NOT NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Brand Credit Potential] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIQuarterly_Archive2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIQuarterly_Archive2010](
	[period] [varchar](10) NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Gross Qtr Rebate] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Leader Net Rebate] [money] NULL,
	[Net Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Qtr Rebate to Store] [money] NULL,
	[Cardinal Program Rebate] [money] NULL,
	[API Program Rebate] [money] NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[CA Division] [nvarchar](255) NULL,
	[Grand Total Purchases] [money] NULL,
	[Total Cardinal Sales] [money] NULL,
	[Cardinal Non-Net Sales] [money] NULL,
	[Vol Admin Fee] [money] NULL,
	[CA Brand Sales] [money] NULL,
	[CA Generic Contract Sales] [money] NULL,
	[CA Generic Rebate] [money] NULL,
	[CA Rebate to Pay out] [money] NULL,
	[API ADMIN FEE] [money] NULL,
	[API -TO PAY Cardinal Side-NO P2] [money] NULL,
	[CA-P2P3 SALES] [money] NULL,
	[CA-P2P3 REBATES] [money] NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Whse Sales] [money] NULL,
	[API WHSE REBATE] [money] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[ECOG] [float] NULL,
	[Donepezil Rebate] [money] NULL,
	[Avg Rebate Percentage] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_rebates_APIQuarterly_Archive2010_ForReport]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_rebates_APIQuarterly_Archive2010_ForReport](
	[period] [varchar](10) NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Gross Qtr Rebate] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Leader Net Rebate] [money] NULL,
	[Net Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Qtr Rebate to Store] [money] NULL,
	[Cardinal Program Rebate] [money] NULL,
	[API Program Rebate] [money] NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[CA Division] [nvarchar](255) NULL,
	[Grand Total Purchases] [money] NULL,
	[Total Cardinal Sales] [money] NULL,
	[Cardinal Non-Net Sales] [money] NULL,
	[Vol Admin Fee] [money] NULL,
	[CA Brand Sales] [money] NULL,
	[CA Generic Contract Sales] [money] NULL,
	[CA Generic Rebate] [money] NULL,
	[CA Rebate to Pay out] [money] NULL,
	[API ADMIN FEE] [money] NULL,
	[API -TO PAY Cardinal Side-NO P2] [money] NULL,
	[CA-P2P3 SALES] [money] NULL,
	[CA-P2P3 REBATES] [money] NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Whse Sales] [money] NULL,
	[API WHSE REBATE] [money] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[ECOG] [float] NULL,
	[Donepezil Rebate] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[Affiliate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_20190701]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_20190701](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL,
	[COGEligibleSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_20200210]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_20200210](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL,
	[COGEligibleSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_ARCHIVE]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_ARCHIVE](
	[PMID] [numeric](29, 0) NULL,
	[date] [datetime] NULL,
	[date_period_start] [datetime] NULL,
	[date_period_end] [datetime] NULL,
	[rebate_type] [varchar](2) NULL,
	[ExtendedSales] [money] NULL,
	[SourceSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [numeric](19, 4) NULL,
	[Pay to store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[EffectivePct] [float] NULL,
	[HRTA] [float] NULL,
	[AAPVolumeAdminFeeAffiliate] [money] NULL,
	[AAPGenericAdminFeePipco] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_backup_RSE_20190723]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_backup_RSE_20190723](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL,
	[COGEligibleSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_chaap_bkp032816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_chaap_bkp032816](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[COGEligibleSales] [money] NULL,
 CONSTRAINT [CPK_PM_Rebates_CHAAP_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_New_bkp_20201006]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_New_bkp_20201006](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[COGEligibleSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_old_RSE_20180816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_old_RSE_20180816](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_RSE_20180921]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_RSE_20180921](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_Conference]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_Conference](
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
/****** Object:  Table [dbo].[PM_Rebates_HighVolume_LaJolla]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_HighVolume_LaJolla](
	[Date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
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
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_HighVolume_LaJolla_20191017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_HighVolume_LaJolla_20191017](
	[Date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
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
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_highvolume_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_highvolume_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
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
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_pm_rebates_highvolume_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_highvolume_New_20191017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_highvolume_New_20191017](
	[date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
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
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_highvolume_old_RSE_20180816]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_highvolume_old_RSE_20180816](
	[date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
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
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PaymentDates]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PaymentDates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RebateMonth] [datetime] NOT NULL,
	[RebateType] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NULL,
 CONSTRAINT [CPK_PM_Rebates_PaymentDates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PaymentDates_old]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PaymentDates_old](
	[RebateMonth] [datetime] NOT NULL,
	[RebateType] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_02272014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_02272014](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_20190429]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_20190429](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_Archive]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_Archive](
	[period] [varchar](10) NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
	[pmid] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[storename] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[udaccountno] [nvarchar](255) NULL,
	[Volume] [float] NULL,
	[Rebate] [float] NULL,
	[Payment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_bad]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_bad](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_bad2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_bad2](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_bakjn]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_bakjn](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_bkp](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_jn]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_jn](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_PM_Rebates_PPartner_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_old_RSE_20180815]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_old_RSE_20180815](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPDetails]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPDetails](
	[Period] [varchar](6) NOT NULL,
	[StorePaidDT] [smalldatetime] NULL,
	[PMID] [int] NULL,
	[VendorName] [varchar](150) NULL,
	[AccountName] [varchar](65) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[Eligibility] [int] NULL,
	[Volume] [numeric](38, 2) NULL,
	[Rebate Amount] [numeric](38, 2) NULL,
	[Rebate Paid] [numeric](8, 2) NULL,
	[AAPPaymentMode] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ReferenceId]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ReferenceId](
	[PMID] [int] NOT NULL,
	[IDName] [varchar](40) NOT NULL,
	[ID] [int] NOT NULL,
	[CreateDate] [smalldatetime] NULL,
	[ModifiedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_PM_ReferenceId] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[IDName] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_SecureData]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_SecureData](
	[PMID] [int] NOT NULL,
	[SecureData] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_PM_SecureData] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_ServicesSurvey]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ServicesSurvey](
	[PK_ServicesSurvey] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[DiabetesEducatorCertified] [smallint] NULL,
	[DiabetesEducatorNonCertified] [smallint] NULL,
	[HypertensionTesting] [smallint] NULL,
	[AsthmaServices] [smallint] NULL,
	[CholesterolServices] [smallint] NOT NULL,
	[CompoundingLevel1thru3] [smallint] NULL,
	[CompoundingLevel4Sterile] [smallint] NULL,
	[DMELight] [smallint] NULL,
	[DMEHeavy] [smallint] NULL,
	[DMEAccreditedPharmacy] [smallint] NULL,
	[Contracted340BSelfAdministered] [smallint] NULL,
	[Contracted340BThirdPartyAdministered] [smallint] NULL,
	[Contracted340BExplain] [varchar](500) NULL,
	[ImmunizationsFLUVaccines] [smallint] NULL,
	[ImmunizationsTravelVaccines] [smallint] NULL,
	[ImmunizationsOtherExplain] [varchar](500) NULL,
	[WeightLossClinics] [smallint] NULL,
	[NutritionServices] [smallint] NULL,
	[OtherRetirementCommunities] [smallint] NULL,
	[OtherAssistedLivingFacilities] [smallint] NULL,
	[OtherHospiceCenters] [smallint] NULL,
	[OtherSkilledNursingFacilities] [smallint] NULL,
	[DeliveryServicesNoCharge] [smallint] NULL,
	[DeliveryServicesChargeFee] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_ServicesSurvey] PRIMARY KEY CLUSTERED 
(
	[PK_ServicesSurvey] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_servicessurvey_bkp_110712]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_servicessurvey_bkp_110712](
	[PK_ServicesSurvey] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[DiabetesEducatorCertified] [smallint] NULL,
	[DiabetesEducatorNonCertified] [smallint] NULL,
	[HypertensionTesting] [smallint] NULL,
	[AsthmaServices] [smallint] NULL,
	[CholesterolServices] [smallint] NOT NULL,
	[CompoundingLevel1thru3] [smallint] NULL,
	[CompoundingLevel4Sterile] [smallint] NULL,
	[DMELight] [smallint] NULL,
	[DMEHeavy] [smallint] NULL,
	[DMEAccreditedPharmacy] [smallint] NULL,
	[Contracted340BSelfAdministered] [smallint] NULL,
	[Contracted340BThirdPartyAdministered] [smallint] NULL,
	[Contracted340BExplain] [varchar](500) NULL,
	[ImmunizationsFLUVaccines] [smallint] NULL,
	[ImmunizationsTravelVaccines] [smallint] NULL,
	[ImmunizationsOtherExplain] [varchar](500) NULL,
	[WeightLossClinics] [smallint] NULL,
	[NutritionServices] [smallint] NULL,
	[OtherRetirementCommunities] [smallint] NULL,
	[OtherAssistedLivingFacilities] [smallint] NULL,
	[OtherHospiceCenters] [smallint] NULL,
	[OtherSkilledNursingFacilities] [smallint] NULL,
	[DeliveryServicesNoCharge] [smallint] NULL,
	[DeliveryServicesChargeFee] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_SoftwareVersion]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_SoftwareVersion](
	[PM_SoftwareVersion_ID] [int] IDENTITY(1,1) NOT NULL,
	[softwareversion] [varchar](15) NOT NULL,
	[mandatoryupdate] [smallint] NOT NULL,
	[releasedate] [smalldatetime] NOT NULL,
	[releasenotes] [text] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_SoftwareVersion] PRIMARY KEY CLUSTERED 
(
	[PM_SoftwareVersion_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Territory]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Territory](
	[Territory] [varchar](2) NOT NULL,
	[LastName] [varchar](35) NULL,
	[FirstName] [varchar](35) NULL,
	[GeogArea] [varchar](50) NULL,
	[Telephone] [varchar](25) NULL,
	[Cell] [varchar](25) NULL,
	[Fax] [varchar](25) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_VendorAccts]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorAccts](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NOT NULL,
	[PVAEffectiveDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_VendorAccts] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[VendorID] ASC,
	[VendAcctNum] ASC,
	[Source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_VendorAccts_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorAccts_bkp](
	[PMID] [int] NULL,
	[VendorID] [int] NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_VendorAccts_Decommission_20190424]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorAccts_Decommission_20190424](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NOT NULL,
	[PVAEffectiveDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_VendorAccts_Decommission_20190425]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorAccts_Decommission_20190425](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NOT NULL,
	[PVAEffectiveDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_VendorDC]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorDC](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[DCNum] [int] NOT NULL,
	[Source] [varchar](3) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_VendorDC] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[VendorID] ASC,
	[VendAcctNum] ASC,
	[DCNum] ASC,
	[Source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_VendorDC_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorDC_bkp](
	[PMID] [int] NULL,
	[VendorID] [int] NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NULL,
	[DCNum] [int] NULL,
	[Source] [varchar](3) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Vendors]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Warehouse]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Warehouse](
	[WHID] [int] NOT NULL,
	[Location] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_WebLocator]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_WebLocator](
	[PMID] [int] NOT NULL,
	[ALTERNATEZIPS] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMIDAAPPaymentMethods_20190322]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMIDAAPPaymentMethods_20190322](
	[pmid] [int] NULL,
	[AAPPaymentMode] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMStoreNew]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMStoreNew](
	[PMID] [int] NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[FedID] [varchar](12) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[ChainCode] [int] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo] [varchar](30) NULL,
	[Affiliate] [varchar](125) NULL,
	[GroupNo] [varchar](20) NULL,
	[CategoryID] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[TMFirstName] [varchar](35) NULL,
	[TMLastName] [varchar](35) NULL,
	[TM] [varchar](2) NULL,
	[FinAddr1] [varchar](100) NULL,
	[FinAddr2] [varchar](100) NULL,
	[FinCity] [varchar](50) NULL,
	[FinState] [varchar](2) NULL,
	[FinZip] [varchar](50) NULL,
	[MailAddr1] [varchar](100) NULL,
	[MailAddr2] [varchar](100) NULL,
	[MailCity] [varchar](50) NULL,
	[MailState] [varchar](2) NULL,
	[MailZip] [varchar](50) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMStores]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMStores](
	[PMID] [int] NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[FedID] [varchar](12) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[ChainCode] [int] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo] [varchar](30) NULL,
	[Affiliate] [varchar](125) NULL,
	[GroupNo] [varchar](20) NULL,
	[CategoryID] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[TMFirstName] [varchar](35) NULL,
	[TMLastName] [varchar](35) NULL,
	[TM] [varchar](2) NULL,
	[FinAddr1] [varchar](100) NULL,
	[FinAddr2] [varchar](100) NULL,
	[FinCity] [varchar](50) NULL,
	[FinState] [varchar](2) NULL,
	[FinZip] [varchar](50) NULL,
	[MailAddr1] [varchar](100) NULL,
	[MailAddr2] [varchar](100) NULL,
	[MailCity] [varchar](50) NULL,
	[MailState] [varchar](2) NULL,
	[MailZip] [varchar](50) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[IsMC] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20190313]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20190313](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20190321]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20190321](
	[ID] [int] NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[AAPQuitDate] [varchar](30) NULL,
	[PMParentID] [int] NULL,
	[Zip] [varchar](50) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL,
	[PMAffiliate] [varchar](125) NULL,
	[VendorName] [varchar](150) NULL,
	[ReportVendorName] [varchar](255) NULL,
	[PMPMID] [nvarchar](50) NULL,
	[DistributionPercent] [float] NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[PaymentAmt] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20200303]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20200303](
	[ID] [int] NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[AAPQuitDate] [varchar](30) NULL,
	[PMParentID] [int] NULL,
	[Zip] [varchar](50) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL,
	[PMAffiliate] [varchar](125) NULL,
	[VendorName] [varchar](150) NULL,
	[ReportVendorName] [varchar](255) NULL,
	[PMPMID] [nvarchar](50) NULL,
	[DistributionPercent] [decimal](15, 2) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[PaymentAmt] [numeric](34, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20200303_InitialImport]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20200303_InitialImport](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_20200310]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20200310](
	[ID] [int] NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[AAPQuitDate] [varchar](30) NULL,
	[PMParentID] [int] NULL,
	[Zip] [varchar](50) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL,
	[PMAffiliate] [varchar](125) NULL,
	[VendorName] [varchar](150) NULL,
	[ReportVendorName] [varchar](255) NULL,
	[PMPMID] [nvarchar](50) NULL,
	[DistributionPercent] [decimal](15, 2) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[PaymentAmt] [numeric](34, 4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_DistributionAmount2018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_DistributionAmount2018](
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[AdminFeeFraction] [float] NOT NULL,
	[RebateFraction] [float] NOT NULL,
	[TotalFraction] [float] NOT NULL,
	[AdminFeeAmount] [float] NULL,
	[RebateAmount] [float] NULL,
	[TotalRebateAmountLoaded] [numeric](38, 2) NULL,
	[DistributionPercent] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_DistributionAmount2019]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_DistributionAmount2019](
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[AdminFeeFraction] [float] NOT NULL,
	[RebateFraction] [float] NOT NULL,
	[TotalFraction] [float] NOT NULL,
	[AdminFeeAmount] [float] NULL,
	[RebateAmount] [float] NULL,
	[TotalRebateAmountLoaded] [numeric](38, 2) NULL,
	[VendorDistributionPercentage] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_Import_20200310]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_Import_20200310](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_Journal_20200310]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_Journal_20200310](
	[PMID] [int] NULL,
	[PaidToStore] [numeric](19, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PP_volRebate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_volRebate](
	[acct_no] [varchar](5) NULL,
	[dt] [datetime] NULL,
	[old_vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[volume] [numeric](14, 2) NULL,
	[PMID] [int] NULL,
	[rebate] [numeric](14, 2) NULL,
	[vendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPRebates_Journal_backup_2018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRebates_Journal_backup_2018](
	[Vendor ID] [int] NULL,
	[Invoice #] [varchar](6) NOT NULL,
	[Date] [varchar](9) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [numeric](8, 2) NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPRevenueDistribution2017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRevenueDistribution2017](
	[Partner Name] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL,
	[VendorName] [nvarchar](255) NULL,
	[VendorID] [float] NULL,
	[Active] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPRevenueDistribution2018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRevenueDistribution2018](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL,
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[Active] [bit] NULL,
	[DistributionPercent] [decimal](8, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPRevenueDistribution2019]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRevenueDistribution2019](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL,
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[Active] [bit] NULL,
	[DistributionPercent] [decimal](15, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPRevenueDistribution2019_old_20200310]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRevenueDistribution2019_old_20200310](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL,
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[Active] [bit] NULL,
	[DistributionPercent] [decimal](15, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PPStores]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPStores](
	[PMID] [nvarchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[OwnerName] [varchar](200) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [varchar](30) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[Affiliate] [varchar](125) NULL,
	[AAPQuitDate] [datetime] NULL,
	[PMParentID] [int] NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[CorporateName] [varchar](100) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[contactfullname] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[fedid] [varchar](12) NULL,
	[territory] [varchar](4) NULL,
	[AAPPaymentMode] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RBCReg051010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RBCReg051010](
	[Division] [float] NULL,
	[AccountNumber] [float] NULL,
	[AccountName] [varchar](255) NULL,
	[Affiliation] [varchar](255) NULL,
	[RegLastName] [varchar](255) NULL,
	[RegFirstName] [varchar](255) NULL,
	[DEA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebate_PPartner1Q2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartner1Q2010](
	[pmid] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[storename] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[udaccountno] [nvarchar](255) NULL,
	[Volume] [float] NULL,
	[Rebate] [float] NULL,
	[Payment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebate_PPartner2Q2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartner2Q2010](
	[pmid] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[storename] [nvarchar](255) NULL,
	[udaccountno] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[payment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebate_PPartner3Q2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartner3Q2010](
	[pmid] [int] NULL,
	[ncpdp] [nvarchar](10) NULL,
	[storename] [nvarchar](255) NULL,
	[udaccountno] [float] NULL,
	[aapaccountno] [float] NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[payment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebate_PPartner4Q2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartner4Q2010](
	[pmid] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[storename] [nvarchar](255) NULL,
	[udaccountno] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[Volume] [float] NULL,
	[Rebate] [float] NULL,
	[payment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebate_PPartnerPaymentsByVendor4Q2010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartnerPaymentsByVendor4Q2010](
	[vendor_id] [float] NULL,
	[vendorpair] [float] NULL,
	[vendor] [nvarchar](255) NULL,
	[rebatereportdisplayname] [nvarchar](255) NULL,
	[Volume] [float] NULL,
	[Rebate] [float] NULL,
	[payment] [float] NULL,
	[NumStoresPaid] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebates_UD2008-10]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebates_UD2008-10](
	[pmid] [float] NULL,
	[check_amount] [float] NULL,
	[rebate] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_Def]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Def](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReportDescription] [varchar](255) NULL,
	[ReportName] [varchar](255) NULL,
	[Requestor] [varchar](255) NULL,
	[Developer] [varchar](255) NULL,
	[StoredProcName] [varchar](255) NULL,
	[Frequency] [varchar](255) NULL,
	[Documents] [varchar](255) NULL,
	[HassleFactor] [varchar](255) NULL,
	[Notes] [varchar](1024) NULL,
 CONSTRAINT [PK_Report_Def] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiskCP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiskCP](
	[ncpdp] [varchar](7) NULL,
	[yr] [int] NULL,
	[mo] [int] NULL,
	[CPamount] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiskVolume]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiskVolume](
	[NCPDP] [varchar](20) NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[CHSVolume] [float] NULL,
	[APIVolume] [float] NULL,
	[MLVolume] [float] NULL,
	[TotalVolume] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSE_20181030]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_20181030](
	[Month] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[NAME] [nvarchar](255) NULL,
	[Sales- COG Applied] [money] NULL,
	[Net Sales] [money] NULL,
	[Brand RX Sales] [money] NULL,
	[Total RX] [money] NULL,
	[Excluded from Total RX] [money] NULL,
	[COG Eligible Sales] [money] NULL,
	[Total Src Generics] [money] NULL,
	[OTC] [money] NULL,
	[Non RX- OTC & HH] [money] NULL,
	[Other] [money] NULL,
	[Group Source Compliance] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSE20200706]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE20200706](
	[Acct#] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Cust NAME] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[Total Generics Sales] [money] NULL,
	[Elig Generics for Rebate] [money] NULL,
	[Generic Loyalty Rebate] [money] NULL,
	[1st Payment Negative Rebates collected] [money] NULL,
	[1st Payment Collect FC] [money] NULL,
	[First Payment Amt] [money] NULL,
	[Check Fee First Payment] [money] NULL,
	[Net Payment First Payment] [money] NULL,
	[Pay Account First Payment] [bit] NULL,
	[A/P Payment Mode First Payment] [nvarchar](255) NULL,
	[BUSCLS Second Payment] [nvarchar](255) NULL,
	[Affiliate Second Payment] [nvarchar](255) NULL,
	[Second Payment Amt] [money] NULL,
	[Check Fee Second Payment] [money] NULL,
	[2nd Payment Collect Negative Rebate] [money] NULL,
	[2nd Payment Collect FC] [money] NULL,
	[Net Payment Second Payment] [money] NULL,
	[Pay Account Second Payment] [bit] NULL,
	[A/P Payment Mode Second Payment] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RSE20200812]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE20200812](
	[new_PMID] [nvarchar](100) NULL,
	[new_apideactivation] [date] NULL,
	[OriginalAPIAccountNumber] [varchar](100) NULL,
	[new_api_historical] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30ClaimsStores]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30ClaimsStores](
	[Pharm ID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RxPride Network Listing 093016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxPride Network Listing 093016](
	[NCPDP] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[DEA] [nvarchar](50) NULL,
	[DEAEXP] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Address1] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Ext] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[ChainCode] [nvarchar](50) NULL,
	[AffiliateName] [nvarchar](50) NULL,
	[AffiliateType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesFact_Audited]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesFact_Audited](
	[DateKey] [int] NOT NULL,
	[PharmacyKey] [int] NOT NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSalesAmount] [money] NOT NULL,
	[AAPBrandSalesAmount] [money] NOT NULL,
	[AAPGenericTotalSalesAmount] [money] NOT NULL,
	[AAPGenericTotalSrcSalesAmount] [money] NOT NULL,
	[AAPGenericExcludedSalesAmount] [money] NOT NULL,
	[AAPOTCSalesAmount] [money] NOT NULL,
	[AAPOtherSalesAmount] [money] NOT NULL,
	[AAPTotalRXSalesAmount] [money] NOT NULL,
	[AAPExcludedFromTotalRXSalesAmount] [money] NOT NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[APIBrandSales] [money] NOT NULL,
	[APIBrandUnits] [int] NULL,
	[APIGenericSales] [money] NOT NULL,
	[APIGenericUnits] [int] NULL,
	[APIOTCSales] [money] NOT NULL,
	[APIOTCUnits] [int] NULL,
	[APITotalSales] [money] NOT NULL,
	[MLTotal] [money] NOT NULL,
	[AndaTotal] [money] NOT NULL,
	[CAHBrandSalesAmount] [money] NOT NULL,
	[CAHExcludedSalesAmount] [money] NOT NULL,
	[CAHSourceGenericSalesAmount] [money] NOT NULL,
	[CAHNonContractGenericSalesAmount] [money] NOT NULL,
	[CAHOTCSalesAmount] [money] NOT NULL,
	[CAHSuppliesOtherSalesAmount] [money] NOT NULL,
	[TransactionCount] [bit] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScanToss]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScanToss](
	[Customer Number] [nvarchar](50) NULL,
	[Territory Mng] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLX_PVA_DEA_Merge]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLX_PVA_DEA_Merge](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DEA_Old] [varchar](50) NULL,
	[DEA_New] [varchar](50) NULL,
	[Date_Added] [datetime] NULL,
 CONSTRAINT [PK_SLX_PVA_DEA_MERGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLX_WHAcctID_Merge]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLX_WHAcctID_Merge](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountIDOld] [varchar](50) NULL,
	[WHAccountIDNew] [varchar](50) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_SLX_WHAcctID_Merge] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[software]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[software](
	[ID] [nvarchar](255) NOT NULL,
	[SOFTWARE] [nvarchar](255) NULL,
	[Parent] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[software_bak]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[software_bak](
	[ID] [nvarchar](255) NOT NULL,
	[SOFTWARE] [nvarchar](255) NULL,
 CONSTRAINT [PK_software] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoftwareRxAplicor]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoftwareRxAplicor](
	[Account Code] [nvarchar](50) NULL,
	[Account Name] [nvarchar](255) NULL,
	[PMID] [nvarchar](50) NULL,
	[API Acct No] [nvarchar](50) NULL,
	[AAP Acct No] [nvarchar](50) NULL,
	[Rx Comp Sys] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[STATECODE] [varchar](2) NOT NULL,
	[STATENAME] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ServicesSurvey]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ServicesSurvey](
	[PK_ServicesSurvey] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[DiabetesEducatorCertified] [smallint] NULL,
	[DiabetesEducatorNonCertified] [smallint] NULL,
	[HypertensionTesting] [smallint] NULL,
	[AsthmaServices] [smallint] NULL,
	[CholesterolServices] [smallint] NOT NULL,
	[CompoundingLevel1thru3] [smallint] NULL,
	[CompoundingLevel4Sterile] [smallint] NULL,
	[DMELight] [smallint] NULL,
	[DMEHeavy] [smallint] NULL,
	[DMEAccreditedPharmacy] [smallint] NULL,
	[Contracted340BSelfAdministered] [smallint] NULL,
	[Contracted340BThirdPartyAdministered] [smallint] NULL,
	[Contracted340BExplain] [varchar](500) NULL,
	[ImmunizationsFLUVaccines] [smallint] NULL,
	[ImmunizationsTravelVaccines] [smallint] NULL,
	[ImmunizationsOtherExplain] [varchar](500) NULL,
	[WeightLossClinics] [smallint] NULL,
	[NutritionServices] [smallint] NULL,
	[OtherRetirementCommunities] [smallint] NULL,
	[OtherAssistedLivingFacilities] [smallint] NULL,
	[OtherHospiceCenters] [smallint] NULL,
	[OtherSkilledNursingFacilities] [smallint] NULL,
	[DeliveryServicesNoCharge] [smallint] NULL,
	[DeliveryServicesChargeFee] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeZoneZipCode]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeZoneZipCode](
	[City] [nvarchar](50) NULL,
	[ST] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[A C] [nvarchar](50) NULL,
	[FIPS] [nvarchar](50) NULL,
	[County] [nvarchar](50) NULL,
	[Pref?] [nvarchar](50) NULL,
	[T Z] [nvarchar](50) NULL,
	[DST?] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMP](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[dea] [varchar](50) NULL,
	[CHECKDIGIT] [varchar](1) NULL,
	[CALCDIGIT] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin](
	[month] [varchar](6) NOT NULL,
	[pmid] [int] NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[apiaccountno] [nvarchar](255) NULL,
	[ca#] [float] NULL,
	[name] [nvarchar](255) NULL,
	[dc] [float] NULL,
	[division] [nvarchar](255) NULL,
	[store] [nvarchar](255) NULL,
	[metrics] [nvarchar](255) NULL,
	[Gen_Qualified] [money] NULL,
	[Gen_Excluded] [money] NULL,
	[Gen_Total] [money] NULL,
	[Brand] [money] NULL,
	[Extended] [money] NULL,
	[AdminFee] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ALLPVA_SLX]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ALLPVA_SLX](
	[pmid] [int] NOT NULL,
	[accountname] [varchar](65) NULL,
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](20) NULL,
	[m1] [float] NULL,
	[m2] [float] NULL,
	[m3] [float] NULL,
	[mo3Avg] [numeric](38, 2) NULL,
	[Anda1] [numeric](38, 2) NULL,
	[Anda2] [numeric](38, 2) NULL,
	[Anda3] [numeric](38, 2) NULL,
	[AndaTotal] [numeric](38, 2) NULL,
	[WHM1] [numeric](38, 2) NULL,
	[WHM2] [numeric](38, 2) NULL,
	[WHM3] [numeric](38, 2) NULL,
	[whPVAAvg3mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ALLPVA_SLX_BD]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ALLPVA_SLX_BD](
	[pmid] [int] NOT NULL,
	[accountname] [varchar](65) NULL,
	[dea] [varchar](50) NULL,
	[apiaccountno] [varchar](20) NULL,
	[m1] [float] NULL,
	[m2] [float] NULL,
	[m3] [float] NULL,
	[mo3Avg] [numeric](38, 2) NULL,
	[Anda1] [numeric](38, 2) NULL,
	[Anda2] [numeric](38, 2) NULL,
	[Anda3] [numeric](38, 2) NULL,
	[AndaTotal] [numeric](38, 2) NULL,
	[WHM1] [numeric](38, 2) NULL,
	[WHM2] [numeric](38, 2) NULL,
	[WHM3] [numeric](38, 2) NULL,
	[whPVAAvg3mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ALLPVA_SLX_COMP_DEA]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ALLPVA_SLX_COMP_DEA](
	[DEA] [varchar](50) NULL,
	[apiaccountno] [varchar](50) NULL,
	[SLXValue] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_bk103820_CAS]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_bk103820_CAS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CompareNonMC]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareNonMC](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectivedate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](200) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CompareNonMC_hold081511]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareNonMC_hold081511](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectivedate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](200) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CompareNonMC_orig]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareNonMC_orig](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[ncpdp] [varchar](20) NULL,
	[fedid] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Conf2013b]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Conf2013b](
	[PMID] [int] NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [float] NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Conf2013Betty]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Conf2013Betty](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [float] NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Conf2013c]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Conf2013c](
	[PMID] [int] NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [float] NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL,
	[Hotel] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Conf2013f]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Conf2013f](
	[PMID] [varchar](50) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [varchar](255) NULL,
	[Registrant type] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ContactName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[AAPorGroupNo] [varchar](255) NULL,
	[APIAcctNo] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[St] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](255) NULL,
	[Ext] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phcy Reps] [numeric](18, 0) NULL,
	[Attending] [numeric](18, 0) NULL,
	[TM] [varchar](255) NULL,
	[TM#] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfCompare]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfCompare](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [float] NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg_Group]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg_Group](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL,
	[GroupNo] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg_MemProgs]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg_MemProgs](
	[PMID] [int] NOT NULL,
	[GroupNo] [varchar](20) NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_1]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_1](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_Group]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_Group](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL,
	[GroupNo] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_Group_jmw]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_Group_jmw](
	[PMID] [varchar](50) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [varchar](255) NULL,
	[Registrant type] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ContactName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[AAPorGroupNo] [varchar](255) NULL,
	[APIAcctNo] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[St] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](255) NULL,
	[Ext] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phcy Reps] [numeric](18, 0) NULL,
	[Attending] [numeric](18, 0) NULL,
	[TM] [varchar](255) NULL,
	[TM#] [varchar](255) NULL,
	[GroupNo] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_jmw]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_jmw](
	[PMID] [nvarchar](255) NULL,
	[Date Rec] [datetime] NULL,
	[Rec via] [nvarchar](255) NULL,
	[Registrant type] [nvarchar](255) NULL,
	[Pharmacy or Company Name] [nvarchar](255) NULL,
	[Primary Contact Name] [nvarchar](255) NULL,
	[AAP  Acct #] [nvarchar](255) NULL,
	[AAP Parent or Group#] [nvarchar](255) NULL,
	[API   Acct #] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Ext] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[# Phcy Rep] [float] NULL,
	[# Attd] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[TM#] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_MemProgs]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_MemProgs](
	[PMID] [int] NOT NULL,
	[GroupNo] [varchar](20) NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConfReg2013_MemProgs_jmw]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConfReg2013_MemProgs_jmw](
	[PMID] [int] NOT NULL,
	[GroupNo] [varchar](20) NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete](
	[pmid] [int] NOT NULL,
	[id] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_deleteme]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_deleteme](
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[Accountname] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[API Generic Sales] [money] NULL,
	[ExtendedSales] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[API Month] [datetime] NULL,
	[CH Month] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tmp_DianeList]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tmp_DianeList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[inserted_at] [datetime] NULL,
	[NCPDP] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_equipp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_equipp](
	[NCPDP] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[InEquipp] [varchar](3) NOT NULL,
	[Affiliate] [varchar](125) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_FYTD_WHSales_CS_DYN]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_FYTD_WHSales_CS_DYN](
	[WHAcct#] [varchar](32) NULL,
	[AAP#] [varchar](20) NULL,
	[SlsMn] [varchar](4) NULL,
	[Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Status] [varchar](32) NULL,
	[Date Opened] [datetime] NULL,
	[9/09 Brand] [numeric](18, 2) NULL,
	[10/09 Brand] [numeric](18, 2) NULL,
	[11/09 Brand] [numeric](18, 2) NULL,
	[12/09 Brand] [numeric](18, 2) NULL,
	[1/10 Brand] [numeric](18, 2) NULL,
	[2/10 Brand] [numeric](18, 2) NULL,
	[3/10 Brand] [numeric](18, 2) NULL,
	[4/10 Brand] [numeric](18, 2) NULL,
	[5/10 Brand] [numeric](18, 2) NULL,
	[6/10 Brand] [numeric](18, 2) NULL,
	[7/10 Brand] [numeric](18, 2) NULL,
	[8/10 Brand] [numeric](18, 2) NULL,
	[9/10 Brand] [numeric](18, 2) NULL,
	[9/09 Generic] [numeric](18, 2) NULL,
	[10/09 Generic] [numeric](18, 2) NULL,
	[11/09 Generic] [numeric](18, 2) NULL,
	[12/09 Generic] [numeric](18, 2) NULL,
	[1/10 Generic] [numeric](18, 2) NULL,
	[2/10 Generic] [numeric](18, 2) NULL,
	[3/10 Generic] [numeric](18, 2) NULL,
	[4/10 Generic] [numeric](18, 2) NULL,
	[5/10 Generic] [numeric](18, 2) NULL,
	[6/10 Generic] [numeric](18, 2) NULL,
	[7/10 Generic] [numeric](18, 2) NULL,
	[8/10 Generic] [numeric](18, 2) NULL,
	[9/10 Generic] [numeric](18, 2) NULL,
	[9/09 OTC] [numeric](18, 2) NULL,
	[10/09 OTC] [numeric](18, 2) NULL,
	[11/09 OTC] [numeric](18, 2) NULL,
	[12/09 OTC] [numeric](18, 2) NULL,
	[1/10 OTC] [numeric](18, 2) NULL,
	[2/10 OTC] [numeric](18, 2) NULL,
	[3/10 OTC] [numeric](18, 2) NULL,
	[4/10 OTC] [numeric](18, 2) NULL,
	[5/10 OTC] [numeric](18, 2) NULL,
	[6/10 OTC] [numeric](18, 2) NULL,
	[7/10 OTC] [numeric](18, 2) NULL,
	[8/10 OTC] [numeric](18, 2) NULL,
	[9/10 OTC] [numeric](18, 2) NULL,
	[Brand Totals] [float] NULL,
	[Generic Totals] [float] NULL,
	[OTC Totals] [float] NULL,
	[Grand Totals] [float] NULL,
	[9/09 Totals] [float] NULL,
	[10/09 Totals] [float] NULL,
	[11/09 Totals] [float] NULL,
	[12/09 Totals] [float] NULL,
	[1/10 Totals] [float] NULL,
	[2/10 Totals] [float] NULL,
	[3/10 Totals] [float] NULL,
	[4/10 Totals] [float] NULL,
	[5/10 Totals] [float] NULL,
	[6/10 Totals] [float] NULL,
	[7/10 Totals] [float] NULL,
	[8/10 Totals] [float] NULL,
	[9/10 Totals] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GlobalReport]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GlobalReport](
	[PMID] [int] NULL,
	[AAP #] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[TM] [varchar](4) NULL,
	[DEA] [varchar](50) NULL,
	[Affiliate] [varchar](125) NULL,
	[BC] [varchar](4) NULL,
	[Period] [varchar](20) NULL,
	[CH Gen Src] [float] NOT NULL,
	[CH Gen Exc] [float] NOT NULL,
	[CH Gen Total] [float] NOT NULL,
	[CH Brand] [float] NOT NULL,
	[CH Other] [float] NOT NULL,
	[CH UD Other*] [float] NOT NULL,
	[CH Total] [float] NOT NULL,
	[API Gen] [numeric](38, 2) NOT NULL,
	[API Br] [numeric](38, 2) NOT NULL,
	[API OTC] [numeric](38, 2) NOT NULL,
	[API Total] [numeric](38, 2) NOT NULL,
	[ML Total] [numeric](38, 2) NOT NULL,
	[Anda Total] [numeric](38, 2) NOT NULL,
	[All Total] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_globalreport_Q2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_globalreport_Q2](
	[PMID] [int] NULL,
	[AAP #] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[TM] [varchar](4) NULL,
	[DEA] [varchar](50) NULL,
	[Affiliate] [varchar](125) NULL,
	[BC] [varchar](4) NULL,
	[Period] [varchar](20) NULL,
	[Gen Src] [float] NOT NULL,
	[Gen Exc] [float] NOT NULL,
	[Gen Total] [float] NOT NULL,
	[CH Br] [float] NOT NULL,
	[CH Oth] [float] NOT NULL,
	[UD No Category*] [float] NOT NULL,
	[CH Total] [float] NOT NULL,
	[API Gen] [numeric](38, 2) NOT NULL,
	[API Br] [numeric](38, 2) NOT NULL,
	[API OTC] [numeric](38, 2) NOT NULL,
	[API Total] [numeric](38, 2) NOT NULL,
	[ML Total] [numeric](38, 2) NOT NULL,
	[Anda Total] [numeric](38, 2) NOT NULL,
	[All Total] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GlobalReport_volume]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GlobalReport_volume](
	[pmid] [int] NULL,
	[date] [datetime] NULL,
	[month] [varchar](7) NULL,
	[Gen Src] [float] NULL,
	[Gen Exc] [float] NULL,
	[Gen Total] [float] NULL,
	[CH Br] [float] NULL,
	[CH Oth] [float] NULL,
	[UD Adm] [float] NULL,
	[CH Total] [float] NULL,
	[API_BR] [numeric](38, 2) NULL,
	[API_GEN] [numeric](38, 2) NULL,
	[API_OTC] [numeric](38, 2) NULL,
	[API_Total] [numeric](38, 2) NULL,
	[ML_Total] [numeric](14, 2) NULL,
	[Anda_Total] [numeric](38, 2) NULL,
	[All_Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_import_QPSRx30_090110]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_import_QPSRx30_090110](
	[PMID] [float] NULL,
	[Pharm ID] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[Total Sales] [float] NULL,
	[ClaimsCount] [float] NULL,
	[Total Paid] [float] NULL,
	[TotalSales-TotalPaid] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_InSLX_HayesDir]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_InSLX_HayesDir](
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[storenum] [varchar](255) NULL,
	[Account] [varchar](128) NULL,
	[City_SLX] [varchar](32) NULL,
	[State_SLX] [varchar](32) NULL,
	[MainPhone] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_jeff_MLRebates2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jeff_MLRebates2](
	[fee] [numeric](38, 2) NULL,
	[pmid] [int] NOT NULL,
	[acct_no] [varchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_jmw_MTM]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_MTM](
	[PMID] [int] NOT NULL,
	[Store Name] [varchar](65) NULL,
	[Owner] [varchar](200) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_jmw_v]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_v](
	[pmid] [int] NULL,
	[Year] [varchar](4) NOT NULL,
	[NABP] [varchar](20) NULL,
	[Store Name] [varchar](65) NULL,
	[Total Cardinal Purchases] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MapAAPGroupToPMGroup]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MapAAPGroupToPMGroup](
	[AAPGroup] [varchar](50) NULL,
	[PMGroupNo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_mceffectiveupdate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_mceffectiveupdate](
	[effective] [datetime] NULL,
	[PK_ManagedCare] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[MCNews_EmailAddress] [varchar](150) NULL,
	[emailMCNews] [smallint] NULL,
	[McQuitReasonInternal] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[ESI] [smallint] NULL,
	[accountname] [varchar](65) NULL,
	[aapquitdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MCEmails]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCEmails](
	[NCPDP] [float] NULL,
	[PMID] [float] NULL,
	[Company Name] [nvarchar](255) NULL,
	[Contact Name] [nvarchar](255) NULL,
	[Contact Email] [nvarchar](255) NULL,
	[Address 1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[NPI] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MCJul 2013]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCJul 2013](
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [float] NULL,
	[AAP EFFECTIVE] [datetime] NULL,
	[F8] [nvarchar](255) NULL,
	[F9] [nvarchar](255) NULL,
	[F10] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_memberprograms_trigger]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_memberprograms_trigger](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_mnthly_WH_Sales_CS]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_mnthly_WH_Sales_CS](
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[AAPParent#] [varchar](20) NULL,
	[Territory] [varchar](4) NULL,
	[Acct#] [varchar](32) NOT NULL,
	[Status] [varchar](32) NULL,
	[Name] [varchar](65) NULL,
	[ST] [varchar](2) NULL,
	[Date Opened] [datetime] NULL,
	[October BR] [numeric](18, 2) NULL,
	[October GEN] [numeric](18, 2) NULL,
	[October OTC] [numeric](18, 2) NULL,
	[Grand Total] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MO_jmw]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_jmw](
	[TM] [varchar](10) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API Warehouse#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](100) NULL,
	[Affiliate] [varchar](200) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[Whse Acct Date Opened] [datetime] NULL,
	[Status] [varchar](20) NULL,
	[Wholesaler] [varchar](10) NULL,
	[API Sept 10 Generic Sales] [float] NULL,
	[API Sept 10 Brand Sales] [float] NULL,
	[API Sept 10 OTC Sales] [float] NULL,
	[API Sept 10 Total Sales] [float] NULL,
	[CAH Sept 10 Total Sales] [float] NULL,
	[ML Sept 10 Total Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NCPDP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCPDP](
	[Rank] [bigint] NULL,
	[NCPDP] [varchar](20) NULL,
	[pmid] [int] NOT NULL,
	[AAPQuitDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[IsMCNotNPP] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_added]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_added](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_changed]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_changed](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_changes]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_changes](
	[AccountName] [varchar](100) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](100) NULL,
	[ColumnNameChanged] [varchar](100) NULL,
	[ChangedFrom] [varchar](100) NULL,
	[ChangedTo] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_Sol]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_Sol](
	[PMID] [int] NOT NULL,
	[AAPAccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](200) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_Sol_bkp]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_Sol_bkp](
	[PMID] [int] NOT NULL,
	[AAPAccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](200) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_Sol_hold081511]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_Sol_hold081511](
	[PMID] [int] NOT NULL,
	[AAPAccountno] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](200) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_sol_orig]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_sol_orig](
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[ncpdp] [varchar](20) NULL,
	[fedid] [varchar](12) NULL,
	[corporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Partners]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Partners](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[RebateReportDisplayName] [varchar](255) NULL,
	[PPVendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PatDivAdj2014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDivAdj2014](
	[PMID] [nchar](10) NULL,
	[var] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PeachTree]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PeachTree](
	[pmid] [int] NOT NULL,
	[Corpname] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[1099Type] [varchar](1) NOT NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[FedID] [varchar](12) NULL,
	[1099Setting] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PeachTreePP]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PeachTreePP](
	[Period] [varchar](6) NOT NULL,
	[ID] [int] NOT NULL,
	[NCPDP] [varchar](20) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[PMID] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Eligibility] [int] NULL,
	[Affiliate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PFOA]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PFOA](
	[PMID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_pm_pharmacists012916]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_pharmacists012916](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[PharPrime] [smallint] NULL,
	[PharFullName] [varchar](255) NULL,
	[PharTitle] [varchar](20) NULL,
	[PharState] [varchar](2) NULL,
	[PharLicNo] [varchar](20) NULL,
	[PharExpDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_pm_programs_backup]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_programs_backup](
	[ProgramID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CommentConst] [varchar](255) NULL,
	[Category] [char](1) NULL,
	[AAP] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[WebProfile] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PMIDRank]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PMIDRank](
	[Rank] [bigint] NULL,
	[PMID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP_Affiliate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP_Affiliate](
	[PMID] [int] NOT NULL,
	[VendorName] [varchar](150) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Payment Amount] [numeric](38, 3) NULL,
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP_Affiliate_Group]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP_Affiliate_Group](
	[PMID] [int] NOT NULL,
	[Payment] [numeric](38, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP_PaymentDetail]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP_PaymentDetail](
	[VendorName] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[RebateReportDisplayName] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](12) NULL,
	[PMID] [nvarchar](7) NULL,
	[volumeamt] [nvarchar](50) NULL,
	[rebateamt] [nvarchar](50) NULL,
	[paymentamt] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](10) NULL,
	[AAPQuitDate] [nvarchar](50) NULL,
	[affiliate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP_Pipco]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP_Pipco](
	[PMID] [int] NOT NULL,
	[VendorName] [varchar](150) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Payment Amount] [numeric](38, 3) NULL,
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP_Pipco_Group]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP_Pipco_Group](
	[PMID] [int] NOT NULL,
	[Payment] [numeric](38, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP_summaryTable]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP_summaryTable](
	[AAPAccountNo] [nvarchar](6) NULL,
	[aapparentno] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](12) NULL,
	[PMID] [nvarchar](7) NULL,
	[volumeamt] [nvarchar](50) NULL,
	[rebateamt] [nvarchar](50) NULL,
	[paymentamt] [nvarchar](50) NULL,
	[NCPDP] [nvarchar](10) NULL,
	[AAPQuitDate] [nvarchar](50) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[eligible] [nvarchar](50) NULL,
	[Payto] [nvarchar](50) NULL,
	[ChangeofOwner] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PP1Q2010_Sales]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PP1Q2010_Sales](
	[PMID] [float] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[UD #] [nvarchar](255) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[Contact] [varchar](255) NULL,
	[Volume] [float] NULL,
	[Payment] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPQ32013]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPQ32013](
	[PMID] [nvarchar](255) NULL,
	[VendorName] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Payment Amount] [float] NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPQ42013]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPQ42013](
	[PMID] [nvarchar](255) NULL,
	[VendorName] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Payment Amount] [float] NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPQ42013New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPQ42013New](
	[PMID] [nvarchar](255) NULL,
	[VendorName] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Payment Amount] [float] NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPRebates_Journal]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPRebates_Journal](
	[Vendor ID] [int] NULL,
	[Invoice #] [varchar](8) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [numeric](8, 2) NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPRebates_Vendors]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPRebates_Vendors](
	[Vendor ID] [int] NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit to Address – Line 1] [varchar](100) NULL,
	[Remit to Address – Line 2] [varchar](100) NULL,
	[Remit to City] [varchar](50) NULL,
	[Remit to State] [varchar](2) NULL,
	[Remit to Zip] [varchar](50) NULL,
	[Payment Address Type] [varchar](10) NOT NULL,
	[1099 Type] [int] NOT NULL,
	[Telephone 1] [varchar](50) NULL,
	[Fax Number] [varchar](50) NULL,
	[Vendor E-mail] [varchar](255) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPRebates_Vendors_JN]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPRebates_Vendors_JN](
	[Vendor ID] [int] NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit to Address – Line 1] [varchar](100) NULL,
	[Remit to Address – Line 2] [varchar](100) NULL,
	[Remit to City] [varchar](50) NULL,
	[Remit to State] [varchar](2) NULL,
	[Remit to Zip] [varchar](50) NULL,
	[Payment Address Type] [varchar](10) NOT NULL,
	[1099 Type] [int] NOT NULL,
	[Telephone 1] [varchar](50) NULL,
	[Fax Number] [varchar](50) NULL,
	[Vendor E-mail] [varchar](255) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PPVendorVolume2Q2014]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPVendorVolume2Q2014](
	[PMID] [int] NULL,
	[VendorName] [varchar](150) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[Eligibility] [int] NULL,
	[Volume] [numeric](38, 2) NULL,
	[Rebate Amount] [numeric](38, 2) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPPaymentMode] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PriceProt_Detail]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PriceProt_Detail](
	[PMID] [int] NOT NULL,
	[Account Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[CHAcct] [nvarchar](6) NULL,
	[File Date] [datetime] NULL,
	[Due To Date] [money] NULL,
	[Item#] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[NDC] [varchar](50) NULL,
	[Protected Price] [money] NULL,
	[New Price] [money] NULL,
	[Protection Start] [datetime] NULL,
	[Protection End] [datetime] NULL,
	[Protected Qty] [int] NULL,
	[Usage To Date] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PriceProt_Total]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PriceProt_Total](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[Price Protection Rebate] [money] NULL,
	[Account Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PRSManagedCareStoreDetails]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PRSManagedCareStoreDetails](
	[NCPDP] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](50) NULL,
	[FacilityAddress1] [nvarchar](50) NULL,
	[FacilityAddress2] [nvarchar](50) NULL,
	[FacilityCity] [nvarchar](50) NULL,
	[FacilityState] [nvarchar](50) NULL,
	[FacilityZip] [nvarchar](50) NULL,
	[FacilityPhone] [nvarchar](50) NULL,
	[FacilityFax] [nvarchar](50) NULL,
	[NPINumber] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q32103New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q32103New](
	[PMID] [nvarchar](255) NULL,
	[VendorName] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Payment Amount] [float] NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report_arete_072016]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_arete_072016](
	[pmid] [int] NOT NULL,
	[ncpdp] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[OIGData] [varchar](1) NOT NULL,
	[rxAAPLogin] [varchar](1) NOT NULL,
	[DBA] [varchar](100) NULL,
	[NPI] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report_QPSProfile0810]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_QPSProfile0810](
	[PMID] [int] NOT NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[TM] [varchar](4) NULL,
	[Effective] [datetime] NULL,
	[APIStatus] [varchar](32) NULL,
	[Chain] [int] NULL,
	[M.Care] [varchar](1) NOT NULL,
	[CHSales_Q2] [float] NOT NULL,
	[CHSales_0610] [float] NOT NULL,
	[API_Q2] [numeric](38, 2) NOT NULL,
	[API_0610] [numeric](38, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ReportCredit]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ReportCredit](
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[Accountname] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[API Generic Sales] [money] NULL,
	[ExtendedSales] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[API Month] [datetime] NULL,
	[CH Month] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_slxfax]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_slxfax](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[Fax] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SolomonCustID_vs_PMID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SolomonCustID_vs_PMID](
	[pmid] [int] NOT NULL,
	[custid] [char](15) NULL,
	[ncpdp] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[dba] [varchar](100) NULL,
	[name] [char](60) NULL,
	[billname] [char](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_TestCM]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_TestCM](
	[PMID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_tpn_021916]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_tpn_021916](
	[Pharmacy Name] [nvarchar](255) NULL,
	[Legal Business Name] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[Division] [float] NULL,
	[Office Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email Address] [nvarchar](255) NULL,
	[TPN Chain Code] [float] NULL,
	[TPN Date Entered] [datetime] NULL,
	[State License] [float] NULL,
	[State Expiration] [datetime] NULL,
	[Tax ID] [nvarchar](255) NULL,
	[Pharmacist/Physician] [nvarchar](255) NULL,
	[Mailing Street] [nvarchar](255) NULL,
	[Mailing City] [nvarchar](255) NULL,
	[Mailing State] [nvarchar](255) NULL,
	[Mailing Postal Code] [nvarchar](255) NULL,
	[DBA Address] [nvarchar](255) NULL,
	[DBA City] [nvarchar](255) NULL,
	[DBA Postal Code] [nvarchar](255) NULL,
	[DBA State] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[Authorized Official] [nvarchar](255) NULL,
	[Medicaid #] [nvarchar](255) NULL,
	[Medicare #] [nvarchar](255) NULL,
	[DEA #] [nvarchar](255) NULL,
	[DEA Expiration] [datetime] NULL,
	[PIC License ] [float] NULL,
	[PIC Expiration] [datetime] NULL,
	[Fraud, Waste and Abuse Attestation] [datetime] NULL,
	[Account DBA] [nvarchar](255) NULL,
	[Central Pay] [nvarchar](255) NULL,
	[Central Pay Add Date] [datetime] NULL,
	[Central Pay Term Date] [nvarchar](255) NULL,
	[Chain Name] [nvarchar](255) NULL,
	[PHY Mon Fri Hrs] [nvarchar](255) NULL,
	[PHY Hours Sat Hrs] [nvarchar](255) NULL,
	[PHY Hours Sun Hrs] [nvarchar](255) NULL,
	[Prescription Delivery] [nvarchar](255) NULL,
	[Liability Ins# Co#] [nvarchar](255) NULL,
	[Liability Policy #] [float] NULL,
	[Liability Ins# Co#1] [nvarchar](255) NULL,
	[Liability Occurrence] [money] NULL,
	[Liability Aggregate] [money] NULL,
	[Liability Expiration] [datetime] NULL,
	[Professional Liability Aggregate] [money] NULL,
	[Professional Liability Ins# Co#] [nvarchar](255) NULL,
	[Professional Liability Expiration] [datetime] NULL,
	[Professional Liability Occurrence] [money] NULL,
	[Professional Liability Policy #] [nvarchar](255) NULL,
	[TPN Account Type] [nvarchar](255) NULL,
	[TPN Chain Code1] [float] NULL,
	[TPN Date Entered1] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ws_q2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ws_q2](
	[PMID] [int] NULL,
	[TM #] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[API #] [varchar](32) NOT NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Date Opened] [datetime] NULL,
	[Apr Brand] [numeric](18, 2) NULL,
	[Apr Generic] [numeric](18, 2) NULL,
	[Apr OTC] [numeric](18, 2) NULL,
	[Apr Total] [numeric](20, 2) NULL,
	[May Brand] [numeric](18, 2) NULL,
	[May Generic] [numeric](18, 2) NULL,
	[May OTC] [numeric](18, 2) NULL,
	[May Total] [numeric](20, 2) NULL,
	[Jun Brand] [numeric](18, 2) NULL,
	[Jun Generic] [numeric](18, 2) NULL,
	[Jun OTC] [numeric](18, 2) NULL,
	[Jun Total] [numeric](20, 2) NULL,
	[Grand Total Brand] [numeric](20, 2) NULL,
	[Grand Total Generic] [numeric](20, 2) NULL,
	[Grand Total OTC] [numeric](20, 2) NULL,
	[Grand Total Sales] [numeric](26, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ytd_WH_Sales_CS]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ytd_WH_Sales_CS](
	[WHAcct#] [varchar](32) NULL,
	[AAP#] [varchar](20) NULL,
	[SlsMn] [varchar](4) NULL,
	[Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Status] [varchar](32) NULL,
	[Date Opened] [datetime] NULL,
	[July 09 Brand] [numeric](18, 2) NULL,
	[Aug 09 Brand] [numeric](18, 2) NULL,
	[Sept 09 Brand] [numeric](18, 2) NULL,
	[Oct 09 Brand] [numeric](18, 2) NULL,
	[Nov 09 Brand] [numeric](18, 2) NULL,
	[Dec 09 Brand] [numeric](18, 2) NULL,
	[Jan 10 Brand] [numeric](18, 2) NULL,
	[Feb 10 Brand] [numeric](18, 2) NULL,
	[Mar 10 Brand] [numeric](18, 2) NULL,
	[Apr 10 Brand] [numeric](18, 2) NULL,
	[May 10 Brand] [numeric](18, 2) NULL,
	[June 10 Brand] [numeric](18, 2) NULL,
	[July 10 Brand] [numeric](18, 2) NULL,
	[July 09 Generic] [numeric](18, 2) NULL,
	[Aug 09 Generic] [numeric](18, 2) NULL,
	[Sept 09 Generic] [numeric](18, 2) NULL,
	[Oct 09 Generic] [numeric](18, 2) NULL,
	[Nov 09 Generic] [numeric](18, 2) NULL,
	[Dec 09 Generic] [numeric](18, 2) NULL,
	[Jan 10 Generic] [numeric](18, 2) NULL,
	[Feb 10 Generic] [numeric](18, 2) NULL,
	[Mar 10 Generic] [numeric](18, 2) NULL,
	[Apr 10 Generic] [numeric](18, 2) NULL,
	[May 10 Generic] [numeric](18, 2) NULL,
	[June 10 Generic] [numeric](18, 2) NULL,
	[July 10 Generic] [numeric](18, 2) NULL,
	[July 09 OTC] [numeric](18, 2) NULL,
	[Aug 09 OTC] [numeric](18, 2) NULL,
	[Sept 09 OTC] [numeric](18, 2) NULL,
	[Oct 09 OTC] [numeric](18, 2) NULL,
	[Nov 09 OTC] [numeric](18, 2) NULL,
	[Dec 09 OTC] [numeric](18, 2) NULL,
	[Jan 10 OTC] [numeric](18, 2) NULL,
	[Feb 10 OTC] [numeric](18, 2) NULL,
	[Mar 10 OTC] [numeric](18, 2) NULL,
	[Apr 10 OTC] [numeric](18, 2) NULL,
	[May 10 OTC] [numeric](18, 2) NULL,
	[June 10 OTC] [numeric](18, 2) NULL,
	[July 10 OTC] [numeric](18, 2) NULL,
	[Brand Totals] [float] NULL,
	[Generic Totals] [float] NULL,
	[OTC Totals] [float] NULL,
	[Grand Totals] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ytd_WH_Sales_LineAmt_CS]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ytd_WH_Sales_LineAmt_CS](
	[Acct#] [varchar](32) NULL,
	[SlsMn] [varchar](4) NULL,
	[Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Status] [varchar](32) NULL,
	[Date Opened] [datetime] NULL,
	[Apr 09 Brand] [numeric](18, 2) NULL,
	[May 09 Brand] [numeric](18, 2) NULL,
	[June 09 Brand] [numeric](18, 2) NULL,
	[July 09 Brand] [numeric](18, 2) NULL,
	[Aug 09 Brand] [numeric](18, 2) NULL,
	[Sept 09 Brand] [numeric](18, 2) NULL,
	[Oct 09 Brand] [numeric](18, 2) NULL,
	[Nov 09 Brand] [numeric](18, 2) NULL,
	[Dec 09 Brand] [numeric](18, 2) NULL,
	[Jan 10 Brand] [numeric](18, 2) NULL,
	[Feb 10 Brand] [numeric](18, 2) NULL,
	[Mar 10 Brand] [numeric](18, 2) NULL,
	[Apr 10 Brand] [numeric](18, 2) NULL,
	[May 10 Brand] [numeric](18, 2) NULL,
	[Apr 09 Generic] [numeric](18, 2) NULL,
	[May 09 Generic] [numeric](18, 2) NULL,
	[June 09 Generic] [numeric](18, 2) NULL,
	[July 09 Generic] [numeric](18, 2) NULL,
	[Aug 09 Generic] [numeric](18, 2) NULL,
	[Sept 09 Generic] [numeric](18, 2) NULL,
	[Oct 09 Generic] [numeric](18, 2) NULL,
	[Nov 09 Generic] [numeric](18, 2) NULL,
	[Dec 09 Generic] [numeric](18, 2) NULL,
	[Jan 10 Generic] [numeric](18, 2) NULL,
	[Feb 10 Generic] [numeric](18, 2) NULL,
	[Mar 10 Generic] [numeric](18, 2) NULL,
	[Apr 10 Generic] [numeric](18, 2) NULL,
	[May 10 Generic] [numeric](18, 2) NULL,
	[Apr 09 OTC] [numeric](18, 2) NULL,
	[MAY 09 OTC] [numeric](18, 2) NULL,
	[June 09 OTC] [numeric](18, 2) NULL,
	[July 09 OTC] [numeric](18, 2) NULL,
	[Aug 09 OTC] [numeric](18, 2) NULL,
	[Sept 09 OTC] [numeric](18, 2) NULL,
	[Oct 09 OTC] [numeric](18, 2) NULL,
	[Nov 09 OTC] [numeric](18, 2) NULL,
	[Dec 09 OTC] [numeric](18, 2) NULL,
	[Jan 10 OTC] [numeric](18, 2) NULL,
	[Feb 10 OTC] [numeric](18, 2) NULL,
	[Mar 10 OTC] [numeric](18, 2) NULL,
	[Apr 10 OTC] [numeric](18, 2) NULL,
	[May 10 OTC] [numeric](18, 2) NULL,
	[Brand Totals] [float] NULL,
	[Generic Totals] [float] NULL,
	[OTC Totals] [float] NULL,
	[Grand Totals] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp2Q13]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp2Q13](
	[NCPDP] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Term Date] [nvarchar](255) NULL,
	[MCQuitDate] [nvarchar](255) NULL,
	[MC] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpActiveMemberList_08232013]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpActiveMemberList_08232013](
	[Source] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[MC Eff# Date] [datetime] NULL,
	[AAP Eff# Date] [datetime] NULL,
	[Mailing Address 1] [nvarchar](255) NULL,
	[Mailing Address 2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Owner Name] [nvarchar](255) NULL,
	[Terr#] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[AAP Status] [nvarchar](255) NULL,
	[API Status] [nvarchar](255) NULL,
	[Bus Cls] [nvarchar](255) NULL,
	[AAP Account No] [float] NULL,
	[AAP Parent No] [float] NULL,
	[API Account No] [float] NULL,
	[Managed Care CC] [float] NULL,
	[Group / Affiliate Name] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[NCPDP] [float] NULL,
	[NPI] [float] NULL,
	[State Lic# No#] [nvarchar](255) NULL,
	[GroupNo] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpGenAdv]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpGenAdv](
	[PMID] [int] NOT NULL,
 CONSTRAINT [PK_tmpGenAdv] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpStores]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpStores](
	[PMID] [nvarchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[OwnerName] [varchar](200) NULL,
	[DEA] [varchar](50) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[Affiliate] [varchar](125) NULL,
	[AAPQuitDate] [datetime] NULL,
	[PMParentID] [int] NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[CorporateName] [varchar](100) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[contactfullname] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[fedid] [varchar](12) NULL,
	[territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopGenerics053111]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopGenerics053111](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[AAP Top Generics Sell Price] [money] NULL,
	[AAP Top Generics Price Per Unit] [money] NULL,
	[Brand Name] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC/UPC] [varchar](15) NULL,
	[CIN] [varchar](15) NULL,
	[DP#] [varchar](15) NULL,
	[GPI_ID] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN SEQNO] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UD_PMID]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UD_PMID](
	[WSAccount] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UDVendors]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UDVendors](
	[VendorID] [int] NULL,
	[OldVendorID] [int] NULL,
	[OldVolumeName] [varchar](50) NULL,
	[Reports] [varchar](1) NULL,
	[Active] [int] NULL,
	[EffectDate] [datetime] NULL,
	[Factor] [numeric](2, 2) NULL,
	[TotalPercentRebate] [numeric](2, 2) NULL,
	[Active2007] [int] NULL,
	[VendorPair] [int] NULL,
	[PPVendorID] [int] NULL,
	[OldRebateName] [varchar](50) NULL,
	[RebateReportDisplayName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[upd_ML]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[upd_ML](
	[MLID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[UDAccountNo] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[TotalSales] [float] NULL,
	[RxSales] [float] NULL,
	[GenericSales] [float] NULL,
	[RebatePerc] [varchar](50) NULL,
	[TotalRebate] [float] NULL,
	[AdminRebate] [float] NULL,
	[GenericRebate] [float] NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[URL]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URL](
	[DEA # ] [nvarchar](255) NULL,
	[PMID] [bigint] NULL,
	[Rebate Sales] [float] NULL,
	[Rebate] [float] NULL,
	[Storeid] [nvarchar](255) NULL,
	[Facility Address] [nvarchar](255) NULL,
	[Facility City] [nvarchar](255) NULL,
	[FaSt] [nvarchar](255) NULL,
	[Facil Zip] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserActivityTracking]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivityTracking](
	[UserActivityTrackingId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[DateTimeVisited] [datetime] NOT NULL,
	[ControllerName] [varchar](255) NOT NULL,
	[URL] [varchar](255) NOT NULL,
	[ActionName] [varchar](255) NOT NULL,
	[RowCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserActivityTrackingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USState]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USState](
	[US State] [nvarchar](255) NULL,
	[Abbreviation] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorEligibilitySumm]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorEligibilitySumm](
	[PMID] [nvarchar](7) NULL,
	[volumeamt] [nvarchar](50) NULL,
	[rebateamt] [nvarchar](50) NULL,
	[paymentamt] [nvarchar](50) NULL,
	[eligible] [nvarchar](50) NULL,
	[PaytoPMID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorLoad]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorLoad](
	[FileID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionID] [int] NULL,
	[FileName] [nvarchar](200) NULL,
	[LoadDate] [smalldatetime] NULL,
	[LoadedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_VendorLoad] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorsTestOld]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorsTestOld](
	[vendor_id] [nvarchar](50) NULL,
	[PPFeeNote] [nvarchar](500) NULL,
	[VENDOR] [text] NULL,
	[Website Program Description] [nvarchar](1000) NULL,
	[MemberDeal] [text] NULL,
	[PurchaseIncentive] [text] NULL,
	[PPContract Billed] [nvarchar](50) NULL,
	[PPContract Pd] [nvarchar](50) NULL,
	[Contract Pricing Start Date] [nvarchar](50) NULL,
	[Contract Pricing End Date] [nvarchar](50) NULL,
	[Corporate Rebate] [nvarchar](255) NULL,
	[Pat Rebate] [nvarchar](50) NULL,
	[Rebate To FPN] [nvarchar](200) NULL,
	[Rebate From FPN to United] [nvarchar](200) NULL,
	[CustomerServicePhone] [nvarchar](50) NULL,
	[Customer Service Toll Free] [nvarchar](50) NULL,
	[Customer Service Fax] [nvarchar](50) NULL,
	[CustomerServiceE-mail] [nvarchar](100) NULL,
	[WEBSITE] [nvarchar](100) NULL,
	[CorpAddr1] [nvarchar](50) NULL,
	[CorpAddr2] [nvarchar](50) NULL,
	[CorpCity] [nvarchar](50) NULL,
	[CorpSt] [nvarchar](50) NULL,
	[CorpZip] [nvarchar](50) NULL,
	[CORP800] [nvarchar](50) NULL,
	[CorpPhone] [nvarchar](50) NULL,
	[CorpFax] [nvarchar](50) NULL,
	[Last Modified] [nvarchar](50) NULL,
	[Why Modified] [nvarchar](255) NULL,
	[PPContract  Effective] [nvarchar](50) NULL,
	[PPContract  Expiration] [nvarchar](50) NULL,
	[Marketing Package] [text] NULL,
	[Tier] [nvarchar](255) NULL,
	[PreferedPartnerSince] [nvarchar](50) NULL,
	[Contract Term Date] [nvarchar](50) NULL,
	[Active] [nvarchar](50) NULL,
	[PIPCo Program] [nvarchar](50) NULL,
	[United PIPCoUses] [nvarchar](50) NULL,
	[NotesPPPStatus] [nvarchar](50) NULL,
	[Vendor Type] [nvarchar](50) NULL,
	[Annual Renewal LetterSent] [nvarchar](50) NULL,
	[Welcome E-mail Infor Form] [nvarchar](50) NULL,
	[InfoFormReturned] [nvarchar](50) NULL,
	[WelcomeLetterMarketingCalendar] [nvarchar](50) NULL,
	[MKt BannerStart Date] [nvarchar](50) NULL,
	[Mkt BannerEnd Date] [nvarchar](50) NULL,
	[SSI] [nvarchar](50) NULL,
	[Spin Reports United] [nvarchar](50) NULL,
	[Spin Reports Partner] [nvarchar](50) NULL,
	[Spin Report Notes] [nvarchar](50) NULL,
	[Spin Reports N A] [nvarchar](50) NULL,
	[Spin Reports FPN] [nvarchar](50) NULL,
	[DirectorySent] [nvarchar](50) NULL,
	[LinkedURL] [nvarchar](255) NULL,
	[Phone Website] [nvarchar](50) NULL,
	[RFP] [nvarchar](50) NULL,
	[Purchase From] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorsTypePayment_2020303]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorsTypePayment_2020303](
	[Vendor ID] [nvarchar](255) NULL,
	[Vendor Name] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[Telephone 1] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Balance] [money] NULL,
	[1099 Type] [nvarchar](255) NULL,
	[E-mail] [nvarchar](255) NULL,
	[Remit To Address 1] [nvarchar](255) NULL,
	[Mail To City] [nvarchar](255) NULL,
	[Remit To State] [nvarchar](255) NULL,
	[Remit To Address 2] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorTransaction]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTransaction](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL,
 CONSTRAINT [PK_VendorTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorTransaction_BK20191028]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTransaction_BK20191028](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorTransaction_BK20200327]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTransaction_BK20200327](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorTransactionBackup]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTransactionBackup](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL,
 CONSTRAINT [PK_VendorVolumeRebate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendorvolumerebate_01062017]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorvolumerebate_01062017](
	[PaidDt] [smalldatetime] NULL,
	[VendorName] [varchar](150) NOT NULL,
	[ID] [int] NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[FileName] [nvarchar](200) NULL,
	[LoadDate] [smalldatetime] NULL,
	[LoadedBy] [nvarchar](50) NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[StorePaidDt] [smalldatetime] NULL,
	[Affiliate] [nvarchar](50) NULL,
	[RebateReportDisplayName] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_04202018]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_04202018](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_2018_backup_AffilaitionUpdate_20203010]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_2018_backup_AffilaitionUpdate_20203010](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_2019_backup_AffilaitionUpdate]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_2019_backup_AffilaitionUpdate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_bak]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_bak](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_BK20191028]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_BK20191028](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_BK20200327]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_BK20200327](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendorvolumerebate_bkp041117]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorvolumerebate_bkp041117](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate_YH]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate_YH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorVolumeRebate2Q12]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorVolumeRebate2Q12](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NULL,
	[PMID] [int] NULL,
	[UDNo] [varchar](50) NULL,
	[StoreName] [nvarchar](100) NULL,
	[VolumeAmt] [numeric](18, 2) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[AccruedStartdt] [smalldatetime] NULL,
	[AccruedEnddt] [smalldatetime] NULL,
	[FileID] [int] NULL,
	[TransactionID] [int] NULL,
	[Eligibility] [int] NULL,
	[PayTo] [nchar](10) NULL,
	[Affiliate] [nvarchar](50) NULL,
	[StorePaidDt] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseProgram]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseProgram](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[APIAccountNmbr] [varchar](20) NULL,
	[EffectiveDate] [date] NULL,
	[QuitDate] [date] NULL,
	[ProgramName] [varchar](25) NULL,
	[StatusCode] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpartners]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpartners](
	[PARTNER_ID] [int] NOT NULL,
	[PARTNER_CATEGORY_ID] [int] NULL,
	[PARTNER_LEVEL_ID] [int] NULL,
	[NAME] [varchar](255) NULL,
	[DESCRIPTION] [varchar](max) NULL,
	[URI] [varchar](512) NULL,
	[PHONE_NUM] [varchar](18) NULL,
	[BANNER_FROM_DT] [datetime] NULL,
	[BANNER_TO_DT] [datetime] NULL,
	[BANNER_DISPLAYED] [int] NULL,
	[BANNER_HIT] [int] NULL,
	[NAME_PUBLIC] [varchar](50) NULL,
	[LOGO] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_webpartners] PRIMARY KEY CLUSTERED 
(
	[PARTNER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpartners2]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpartners2](
	[PARTNER_ID] [int] NULL,
	[PARTNER_CATEGORY_ID] [int] NULL,
	[PARTNER_LEVEL_ID] [int] NULL,
	[NAME] [varchar](255) NULL,
	[DESCRIPTION] [varchar](max) NULL,
	[URI] [varchar](512) NULL,
	[PHONE_NUM] [varchar](18) NULL,
	[BANNER_FROM_DT] [datetime] NULL,
	[BANNER_TO_DT] [datetime] NULL,
	[BANNER_DISPLAYED] [int] NULL,
	[BANNER_HIT] [int] NULL,
	[NAME_PUBLIC] [varchar](50) NULL,
	[LOGO] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xeloda]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xeloda](
	[CUSTOMER_NAME] [nvarchar](255) NULL,
	[CUSTOMER_NO] [nvarchar](255) NULL,
	[NABP] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [SSAS_ControlledSubstance].[MyTime]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSAS_ControlledSubstance].[MyTime](
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
 CONSTRAINT [PK_MyTime] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APItoPMID_LifeTime]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APItoPMID_LifeTime](
	[APIAccountNo] [varchar](20) NULL,
	[PMID] [int] NOT NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NOT NULL,
	[DateOpened] [datetime] NULL,
	[FirstOrderDate] [datetime2](3) NULL,
	[API_PMID_EffectiveDate] [datetime2](3) NULL,
	[API_PMID_QuitDate] [datetime] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[LastOrderDate] [datetime2](3) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_AddressMaster]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_AddressMaster](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL,
	[Email] [varchar](150) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_Staging_PM_AddressMaster] PRIMARY KEY CLUSTERED 
(
	[PK_AddressMaster] ASC,
	[PMID] ASC,
	[Address_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_AffiliateHistory]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_AffiliateHistory](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [nvarchar](100) NULL,
	[GroupID] [int] NULL,
	[GroupName] [nvarchar](250) NULL,
	[new_affiliationstart] [date] NULL,
	[new_affiliationend] [date] NULL,
	[new_reason] [nvarchar](100) NULL,
	[statuscodename] [nvarchar](250) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_PM_AffiliateHistory] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_AnnualRebates_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_AnnualRebates_New](
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
 CONSTRAINT [CPK_Staging_PM_AnnualRebates_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_CHAccounts_ADJ]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_CHAccounts_ADJ](
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL,
	[MatrixName] [varchar](255) NULL,
	[CAMasterNumber] [varchar](255) NULL,
 CONSTRAINT [CPK_Staging_PMCHAccounts] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_Pharmacy]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_Pharmacy](
	[PMID] [int] NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL,
	[StatusCodeName] [nvarchar](250) NULL,
	[TMEmailAddress] [varchar](250) NULL,
 CONSTRAINT [PK_Staging PM_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_Rebates_APIMonthly_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_Rebates_APIMonthly_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
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
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NULL,
	[Print Rebate Letter] [bit] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Previous Month Held Rebate] [money] NULL,
	[PostAveRebatePerc] [nvarchar](255) NULL,
	[True10Sales] [money] NULL,
	[True10Rebate] [money] NULL,
	[AreteRebateFee] [money] NULL,
	[APIInstantRebate] [money] NULL,
	[CalcAPIRebatePercentage] [decimal](18, 4) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[APIGenericSalesTier1] [money] NOT NULL,
	[APIGenericSalesTier2] [money] NOT NULL,
	[APIGenericRebateTier1] [money] NOT NULL,
	[APIGenericRebateTier2] [money] NOT NULL,
	[ConferenceCreditOnePercent] [money] NOT NULL,
 CONSTRAINT [CPK_Staging_PM_Rebates_APIMonthly_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_Rebates_CHAAP_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_Rebates_CHAAP_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [varbinary](8) NOT NULL,
 CONSTRAINT [CPK_Staging_PM_Rebates_CHAAP_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[pm_rebates_highvolume_New]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[pm_rebates_highvolume_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
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
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL,
	[Generic Source] [money] NULL,
	[1% Generic Admin] [money] NULL,
	[Incentive from AAP Net Sales] [money] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [varbinary](8) NOT NULL,
 CONSTRAINT [CPK_Staging_pm_rebates_highvolume_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[PM_VendorAccts]    Script Date: 12/22/2020 3:01:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_VendorAccts](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NOT NULL,
	[PVAEffectiveDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_Staging_PM_VendorAccts] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[VendorID] ASC,
	[VendAcctNum] ASC,
	[Source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[APItoPMID_LifeTime] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Audit].[PM_AddressMaster] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Audit].[PM_AddressMaster] ADD  DEFAULT ((0)) FOR [IsSentToCRM]
GO
ALTER TABLE [Audit].[PM_AddressMaster] ADD  DEFAULT ((0)) FOR [IsUpdatedInCRM]
GO
ALTER TABLE [dbo].[ALL_Volume_20181024] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APICOGAppliedSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APINetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENRx]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENTotalP2P3]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPCOGAppliedSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPGENExcl]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDAdminOnly]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombBrands]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombAdminOnly]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPIBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0)) FOR [WHAPIBrandUnits]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPIGeneric]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0)) FOR [WHAPIGenericUnits]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPIOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0)) FOR [WHAPIOTCUnits]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPITotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [MLTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AndaTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APICOGAppliedSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APINetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIGENRx]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIGENTotalP2P3]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [APIOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPCOGAppliedSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPGENExcl]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AAPOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [UDAdminOnly]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombBrands]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [CombAdminOnly]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [WHAPIBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [WHAPIGeneric]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [WHAPIOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [WHAPITotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [MLTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT ((0.00)) FOR [AndaTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New_RSE_20191122] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[APItoPMID_LifeTime] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[CH_ALLPVA_SALES] ADD  DEFAULT ((0.00)) FOR [NetSourceGenerics]
GO
ALTER TABLE [dbo].[CH_ALLPVA_SALES] ADD  DEFAULT ((0.00)) FOR [RebateEligibleSourceGenerics]
GO
ALTER TABLE [dbo].[CHAPI_SALES] ADD  DEFAULT ((0.00)) FOR [NetSourceGenerics]
GO
ALTER TABLE [dbo].[CHAPI_SALES] ADD  DEFAULT ((0.00)) FOR [RebateEligibleSourceGenerics]
GO
ALTER TABLE [dbo].[CM_SendoutRequest] ADD  CONSTRAINT [DF_com_SendoutRequest_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[DynamicSQL] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[exclude_tables] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[exclude_tables] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[exclude_tables] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[IntranetReport] ADD  CONSTRAINT [DF_IntranetReport_IsAdminMode]  DEFAULT ((0)) FOR [IsAdminMode]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT ((0)) FOR [ParticipationReportActive]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT ((0)) FOR [ParticipationReportRank]
GO
ALTER TABLE [dbo].[Pharmacy1] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Pharmacy1] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Pharmacy1] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_AccountDescriptions] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_AccountDescriptions] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_AccountDescriptions] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_AddressMaster] ADD  CONSTRAINT [DF__PM_Addres__Creat__43E1002F]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_AddressMaster] ADD  CONSTRAINT [DF__PM_Addres__Modif__44D52468]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_AddressMaster] ADD  CONSTRAINT [DF__PM_Addres__RowVe__45C948A1]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_AddressType] ADD  CONSTRAINT [DF__PM_Addres__Creat__6CE315C2]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_AddressType] ADD  CONSTRAINT [DF__PM_Addres__Modif__6DD739FB]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_AddressType] ADD  CONSTRAINT [DF__PM_Addres__RowVe__6ECB5E34]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_AffiliateHistory] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_AffiliateHistory] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_AffiliateHistory] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_AnnualRebates_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_APIAccounts] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_APIAccounts] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_APIAccounts] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Audit] ADD  CONSTRAINT [DF_PM_Audit_MultipleStoreDiscount]  DEFAULT ((0)) FOR [MultipleStoreDiscount]
GO
ALTER TABLE [dbo].[PM_BrandCredits_APIMonthly_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_CardinalDCs] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_CardinalDCs] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_CardinalDCs] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Categories] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Categories] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Categories] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_ChainCodes] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_ChainCodes] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_ChainCodes] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Cred] ADD  CONSTRAINT [DF__PM_Cred__Created__7484378A]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Cred] ADD  CONSTRAINT [DF__PM_Cred__Modifie__75785BC3]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Cred] ADD  CONSTRAINT [DF__PM_Cred__RowVers__766C7FFC]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_CRM_Affiliate_Lookup] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_Deleted] ADD  CONSTRAINT [DF_PM_Deleted_IsClaimData]  DEFAULT ((0)) FOR [IsClaimData]
GO
ALTER TABLE [dbo].[PM_Deleted] ADD  CONSTRAINT [DF_PM_Deleted_IsUPCData]  DEFAULT ((0)) FOR [IsUPCData]
GO
ALTER TABLE [dbo].[PM_DeletedPMID] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_DeletedPMID] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_DeletedPMID] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[pm_geocode] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[pm_geocode] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[pm_geocode] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Groups] ADD  CONSTRAINT [DF__PM_Groups__Creat__308412F8]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Groups] ADD  CONSTRAINT [DF__PM_Groups__Modif__31783731]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Groups] ADD  CONSTRAINT [DF__PM_Groups__RowVe__326C5B6A]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Groups_xref] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Groups_xref] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Groups_xref] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Groups_xref_bkp] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Groups_xref_bkp] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Groups_xref_bkp] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_HoldbackPercent] ADD  DEFAULT ('29991231') FOR [EndDate]
GO
ALTER TABLE [dbo].[PM_HoldbackPercent] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF_PM_ManagedCare_emailMCNews]  DEFAULT ((0)) FOR [emailMCNews]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF__PM_Manage__Creat__01DE32A8]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF__PM_Manage__Modif__02D256E1]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_ManagedCare] ADD  CONSTRAINT [DF__PM_Manage__RowVe__03C67B1A]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_ManagedCare_bkp] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_ManagedCare_bkp] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_ManagedCare_bkp] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_MemberComm] ADD  CONSTRAINT [DF_PM_MemberComm_UseFaxNotEmail]  DEFAULT ((0)) FOR [UseFaxNotEmail]
GO
ALTER TABLE [dbo].[PM_MemberComm] ADD  CONSTRAINT [DF_PM_MemberComm_OptOut]  DEFAULT ((0)) FOR [OptOut]
GO
ALTER TABLE [dbo].[PM_MemberPrograms] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_MemberPrograms] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_MemberPrograms] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_MemberPrograms] ADD  CONSTRAINT [DF_PM_MemberPrograms_AAP]  DEFAULT ((0)) FOR [AAP]
GO
ALTER TABLE [dbo].[PM_MembershipTypes] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_MembershipTypes] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_MembershipTypes] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Modifications] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Modifications] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Modifications] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_OrganizationTypes] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_OrganizationTypes] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_OrganizationTypes] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  CONSTRAINT [DF_PM_Permissions_TestDatabase]  DEFAULT ((0)) FOR [TestDatabase]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  CONSTRAINT [DF_PM_Permissions_WholeSaler_RW]  DEFAULT ((0)) FOR [WholeSaler_RW]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  CONSTRAINT [DF_PM_Permissions_WebPermissions]  DEFAULT ((0)) FOR [WebPermissions]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Permissions] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Pharmacists] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Pharmacists] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Pharmacists] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_CompetitiveAcct]  DEFAULT ((0)) FOR [CompetitiveAcct]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsStartUpStore]  DEFAULT ((0)) FOR [IsStartUpStore]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_Resigned]  DEFAULT ('N') FOR [Resigned]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsBuyingGroup]  DEFAULT ((0)) FOR [IsBuyingGroup]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsPos]  DEFAULT ((0)) FOR [IsPos]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsPva]  DEFAULT ((0)) FOR [IsPva]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_FeePaid]  DEFAULT ((0)) FOR [FeePaid]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsManagedCare]  DEFAULT ((0)) FOR [IsManagedCare]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsWarehouse]  DEFAULT ((0)) FOR [IsWarehouse]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsNPP]  DEFAULT ((0)) FOR [IsNPP]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF__PM_Pharma__Creat__7C8F6DA6]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF__PM_Pharma__Modif__7D8391DF]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF__PM_Pharma__RowVe__7E77B618]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsClaimData]  DEFAULT ((0)) FOR [IsClaimData]
GO
ALTER TABLE [dbo].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsUPCData]  DEFAULT ((0)) FOR [IsUPCData]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Programs] ADD  DEFAULT ((0)) FOR [WebProfile]
GO
ALTER TABLE [dbo].[PM_Programs_SR263] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Programs_SR263] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Programs_SR263] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Programs_SR263] ADD  DEFAULT ((0)) FOR [WebProfile]
GO
ALTER TABLE [dbo].[PM_Rebates_APIMonthly_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericSalesTier1]
GO
ALTER TABLE [dbo].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericSalesTier2]
GO
ALTER TABLE [dbo].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericRebateTier1]
GO
ALTER TABLE [dbo].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericRebateTier2]
GO
ALTER TABLE [dbo].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditOnePercent]
GO
ALTER TABLE [dbo].[PM_Rebates_CHAAP_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_Rebates_CHAAP_New] ADD  DEFAULT ((0.00)) FOR [COGEligibleSales]
GO
ALTER TABLE [dbo].[pm_rebates_highvolume_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_Rebates_PPartner_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[PM_ReferenceId] ADD  CONSTRAINT [DEF_PM_ReferenceId_CreateDate]  DEFAULT ('getate()') FOR [CreateDate]
GO
ALTER TABLE [dbo].[PM_ReferenceId] ADD  CONSTRAINT [DEF_PM_ReferenceId_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[PM_ServicesSurvey] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_ServicesSurvey] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_ServicesSurvey] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_SoftwareVersion] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_SoftwareVersion] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_SoftwareVersion] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Territory] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Territory] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Territory] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_VendorAccts] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_VendorAccts] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_VendorAccts] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_VendorDC] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_VendorDC] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_VendorDC] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_VendorDC_bkp] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_VendorDC_bkp] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_VendorDC_bkp] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Vendors] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Vendors] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Vendors] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_Warehouse] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Warehouse] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Warehouse] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[PM_WebLocator] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_WebLocator] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_WebLocator] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPNetSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPBrandSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPGenericTotalSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPGenericTotalSrcSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPGenericExcludedSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPOTCSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPOtherSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPTotalRXSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPExcludedFromTotalRXSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APIBrandSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APIGenericSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APIOTCSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APITotalSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [MLTotal]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AndaTotal]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHBrandSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHExcludedSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHSourceGenericSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHNonContractGenericSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHOTCSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHSuppliesOtherSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((1)) FOR [TransactionCount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Tmp_DianeList] ADD  DEFAULT (getdate()) FOR [inserted_at]
GO
ALTER TABLE [dbo].[UserActivityTracking] ADD  DEFAULT (getdate()) FOR [RowCreated]
GO
ALTER TABLE [dbo].[VendorVolumeRebate] ADD  CONSTRAINT [DF_VendorVolumeRebate_VolumeAmt]  DEFAULT ((0.00)) FOR [VolumeAmt]
GO
ALTER TABLE [dbo].[VendorVolumeRebate] ADD  CONSTRAINT [DF_VendorVolumeRebate_RebateAmt]  DEFAULT ((0.00)) FOR [RebateAmt]
GO
ALTER TABLE [dbo].[VendorVolumeRebate] ADD  CONSTRAINT [DF_VendorVolumeRebate_Eligibility]  DEFAULT ((1)) FOR [Eligibility]
GO
ALTER TABLE [dbo].[WarehouseProgram] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[webpartners] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[APItoPMID_LifeTime] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[PM_AddressMaster] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [Staging].[PM_AddressMaster] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [Staging].[PM_AddressMaster] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [Staging].[PM_AffiliateHistory] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_CompetitiveAcct]  DEFAULT ((0)) FOR [CompetitiveAcct]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsStartUpStore]  DEFAULT ((0)) FOR [IsStartUpStore]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_Resigned]  DEFAULT ('N') FOR [Resigned]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsBuyingGroup]  DEFAULT ((0)) FOR [IsBuyingGroup]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsPos]  DEFAULT ((0)) FOR [IsPos]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsPva]  DEFAULT ((0)) FOR [IsPva]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_FeePaid]  DEFAULT ((0)) FOR [FeePaid]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsManagedCare]  DEFAULT ((0)) FOR [IsManagedCare]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsWarehouse]  DEFAULT ((0)) FOR [IsWarehouse]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsNPP]  DEFAULT ((0)) FOR [IsNPP]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF__PM_Pharma__Creat__7C8F6DA6]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF__PM_Pharma__Modif__7D8391DF]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF__PM_Pharma__RowVe__7E77B618]  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsClaimData]  DEFAULT ((0)) FOR [IsClaimData]
GO
ALTER TABLE [Staging].[PM_Pharmacy] ADD  CONSTRAINT [DF_PM_Pharmacy_IsUPCData]  DEFAULT ((0)) FOR [IsUPCData]
GO
ALTER TABLE [Staging].[PM_Rebates_APIMonthly_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericSalesTier1]
GO
ALTER TABLE [Staging].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericSalesTier2]
GO
ALTER TABLE [Staging].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericRebateTier1]
GO
ALTER TABLE [Staging].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [APIGenericRebateTier2]
GO
ALTER TABLE [Staging].[PM_Rebates_APIMonthly_New] ADD  DEFAULT ((0.00)) FOR [ConferenceCreditOnePercent]
GO
ALTER TABLE [Staging].[PM_Rebates_CHAAP_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[PM_VendorAccts] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [Staging].[PM_VendorAccts] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [Staging].[PM_VendorAccts] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
ALTER TABLE [dbo].[IntranetReport]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReport_IntranetReportServer] FOREIGN KEY([ServerID])
REFERENCES [dbo].[IntranetReportServer] ([ServerID])
GO
ALTER TABLE [dbo].[IntranetReport] CHECK CONSTRAINT [FK_IntranetReport_IntranetReportServer]
GO
ALTER TABLE [dbo].[IntranetReportAdminReason]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReportAdminReason_IntranetReport] FOREIGN KEY([IntranetReportID])
REFERENCES [dbo].[IntranetReport] ([IntranetReportID])
GO
ALTER TABLE [dbo].[IntranetReportAdminReason] CHECK CONSTRAINT [FK_IntranetReportAdminReason_IntranetReport]
GO
ALTER TABLE [dbo].[IntranetReportRole]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReportRole_IntranetReportRole] FOREIGN KEY([IntranetReportID])
REFERENCES [dbo].[IntranetReport] ([IntranetReportID])
GO
ALTER TABLE [dbo].[IntranetReportRole] CHECK CONSTRAINT [FK_IntranetReportRole_IntranetReportRole]
GO
ALTER TABLE [dbo].[IntranetReportRole]  WITH CHECK ADD  CONSTRAINT [FK_IntranetReportRole_IntranetRole] FOREIGN KEY([IntranetRoleID])
REFERENCES [dbo].[IntranetRole] ([IntranetRoleID])
GO
ALTER TABLE [dbo].[IntranetReportRole] CHECK CONSTRAINT [FK_IntranetReportRole_IntranetRole]
GO
ALTER TABLE [dbo].[PartnerDetails]  WITH NOCHECK ADD  CONSTRAINT [FK_PartnerDetails_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Partners] ([VendorID])
GO
ALTER TABLE [dbo].[PartnerDetails] CHECK CONSTRAINT [FK_PartnerDetails_VendorID]
GO
ALTER TABLE [dbo].[Partners]  WITH NOCHECK ADD  CONSTRAINT [FK_Partners_Webpartners_PPVendorID] FOREIGN KEY([PPVendorID])
REFERENCES [dbo].[webpartners] ([PARTNER_ID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Webpartners_PPVendorID]
GO
ALTER TABLE [dbo].[VendorLoad]  WITH NOCHECK ADD  CONSTRAINT [FK_VendorLoad_TransactionID] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[VendorTransaction] ([TransactionID])
GO
ALTER TABLE [dbo].[VendorLoad] CHECK CONSTRAINT [FK_VendorLoad_TransactionID]
GO
ALTER TABLE [dbo].[VendorTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_VendorTransaction_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Partners] ([VendorID])
GO
ALTER TABLE [dbo].[VendorTransaction] CHECK CONSTRAINT [FK_VendorTransaction_VendorID]
GO
ALTER TABLE [dbo].[VendorVolumeRebate]  WITH NOCHECK ADD  CONSTRAINT [FK_VendorVolumeRebate_TransactionID] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[VendorTransaction] ([TransactionID])
GO
ALTER TABLE [dbo].[VendorVolumeRebate] CHECK CONSTRAINT [FK_VendorVolumeRebate_TransactionID]
GO
ALTER TABLE [dbo].[VendorVolumeRebate]  WITH NOCHECK ADD  CONSTRAINT [FK_VendorVolumeRebate_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Partners] ([VendorID])
GO
ALTER TABLE [dbo].[VendorVolumeRebate] CHECK CONSTRAINT [FK_VendorVolumeRebate_VendorID]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'CONSTRAINT',@level2name=N'PK_MyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'MyTime' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'83e4c51d-f934-4d64-9727-105b086e0921' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime'
GO
