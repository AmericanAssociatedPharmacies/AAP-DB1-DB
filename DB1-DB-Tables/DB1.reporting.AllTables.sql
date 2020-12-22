USE [reporting]
GO
/****** Object:  Table [CHPHAnalysisServices].[Time]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CHPHAnalysisServices].[Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) NULL,
	[Day_of_Year] [int] NULL,
	[Day_of_Year_Name] [nvarchar](50) NULL,
	[Day_of_Quarter] [int] NULL,
	[Day_of_Quarter_Name] [nvarchar](50) NULL,
	[Day_of_Month] [int] NULL,
	[Day_of_Month_Name] [nvarchar](50) NULL,
	[Day_of_Week] [int] NULL,
	[Day_of_Week_Name] [nvarchar](50) NULL,
	[Week_of_Year] [int] NULL,
	[Week_of_Year_Name] [nvarchar](50) NULL,
	[Month_of_Year] [int] NULL,
	[Month_of_Year_Name] [nvarchar](50) NULL,
	[Month_of_Quarter] [int] NULL,
	[Month_of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_of_Year] [int] NULL,
	[Quarter_of_Year_Name] [nvarchar](50) NULL,
	[Reporting_Year] [datetime] NULL,
	[Reporting_Year_Name] [nvarchar](50) NULL,
	[Reporting_Quarter] [datetime] NULL,
	[Reporting_Quarter_Name] [nvarchar](50) NULL,
	[Reporting_Month] [datetime] NULL,
	[Reporting_Month_Name] [nvarchar](50) NULL,
	[Reporting_Week] [datetime] NULL,
	[Reporting_Week_Name] [nvarchar](50) NULL,
	[Reporting_Day] [datetime] NULL,
	[Reporting_Day_Name] [nvarchar](50) NULL,
	[Reporting_Day_of_Year] [int] NULL,
	[Reporting_Day_of_Year_Name] [nvarchar](50) NULL,
	[Reporting_Day_of_Quarter] [int] NULL,
	[Reporting_Day_of_Quarter_Name] [nvarchar](50) NULL,
	[Reporting_Day_of_Month] [int] NULL,
	[Reporting_Day_of_Month_Name] [nvarchar](50) NULL,
	[Reporting_Day_of_Week] [int] NULL,
	[Reporting_Day_of_Week_Name] [nvarchar](50) NULL,
	[Reporting_Week_of_Year] [int] NULL,
	[Reporting_Week_of_Year_Name] [nvarchar](50) NULL,
	[Reporting_Week_of_Quarter] [int] NULL,
	[Reporting_Week_of_Quarter_Name] [nvarchar](50) NULL,
	[Reporting_Week_of_Month] [int] NULL,
	[Reporting_Week_of_Month_Name] [nvarchar](50) NULL,
	[Reporting_Month_of_Year] [int] NULL,
	[Reporting_Month_of_Year_Name] [nvarchar](50) NULL,
	[Reporting_Month_of_Quarter] [int] NULL,
	[Reporting_Month_of_Quarter_Name] [nvarchar](50) NULL,
	[Reporting_Quarter_of_Year] [int] NULL,
	[Reporting_Quarter_of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAP Members WV, WY, AZ]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP Members WV, WY, AZ](
	[PMID] [float] NULL,
	[AAPAccountNo] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[MailAddr1] [nvarchar](255) NULL,
	[MailAddr2] [nvarchar](255) NULL,
	[MailCity] [nvarchar](255) NULL,
	[MailState] [nvarchar](255) NULL,
	[MailZip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAP2017]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP2017](
	[Opt-out 2016] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[AAPAccountNo] [float] NULL,
	[APIAccountNo] [float] NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[BT_ID] [float] NULL,
	[co_id] [float] NULL,
	[ID] [float] NULL,
	[imis_First] [nvarchar](255) NULL,
	[iMIS_Last] [nvarchar](255) NULL,
	[AAP_First] [nvarchar](255) NULL,
	[AAP_Last] [nvarchar](255) NULL,
	[membertype] [nvarchar](255) NULL,
	[sourcecode] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[Paid_Thru] [datetime] NULL,
	[PharmacyName] [nvarchar](255) NULL,
	[MailAddr1] [nvarchar](255) NULL,
	[MailAddr2] [nvarchar](255) NULL,
	[MailCity] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[MailZip] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPGenerics112910]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPGenerics112910](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Color] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[CIN] [nvarchar](255) NULL,
	[DP] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[GCN] [nvarchar](255) NULL,
	[GCN_SEQNO] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPGenerics120610]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPGenerics120610](
	[Description] [varchar](255) NULL,
	[Size] [varchar](255) NULL,
	[Supplier] [varchar](255) NULL,
	[AWP] [smallmoney] NULL,
	[Top100Price] [float] NULL,
	[PricePerUnit] [float] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](255) NULL,
	[Color] [varchar](255) NULL,
	[NDC] [varchar](30) NULL,
	[CIN] [varchar](10) NULL,
	[DP] [varchar](10) NULL,
	[GPI] [varchar](255) NULL,
	[GCN] [varchar](255) NULL,
	[GCN_SEQNO] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AAPProductDetail_April2016]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPProductDetail_April2016](
	[Corporate Item Number] [float] NULL,
	[Corporate Description] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Strength] [nvarchar](255) NULL,
	[Size Txt] [nvarchar](255) NULL,
	[ExtPrice] [money] NULL,
	[Ship Qty] [float] NULL,
	[Price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountMasterUD_ALL_delete]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountMasterUD_ALL_delete](
	[WHYMODIFIED] [varchar](100) NULL,
	[CORPNAME] [varchar](50) NULL,
	[DBA] [varchar](50) NULL,
	[STORE] [varchar](65) NULL,
	[MEMSTORE] [varchar](25) NULL,
	[GROUP] [varchar](25) NULL,
	[NON-PHARMACY] [varchar](1) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[ADDR1] [varchar](60) NULL,
	[ADDR2] [varchar](60) NULL,
	[CITY] [varchar](20) NULL,
	[COUNTY] [varchar](50) NULL,
	[STATE] [varchar](2) NULL,
	[ZIP] [varchar](9) NULL,
	[ATTEND] [varchar](2) NULL,
	[COUNCIL] [varchar](20) NULL,
	[COUNCIL NAME] [varchar](30) NULL,
	[AREACODE] [varchar](3) NULL,
	[PHONE1] [varchar](8) NULL,
	[EMERGENCY PHONE] [varchar](15) NULL,
	[FAXAREACODE] [varchar](3) NULL,
	[FAX] [varchar](8) NULL,
	[EMAILADDRESS] [varchar](40) NULL,
	[WEBADDRESS] [varchar](50) NULL,
	[CONTACT_F] [varchar](16) NULL,
	[CONTACT_L] [varchar](20) NULL,
	[CONTACT PERSON'S TITLE] [varchar](20) NULL,
	[BoardOfDirectors] [varchar](50) NULL,
	[OFFICERS/YEAR] [varchar](50) NULL,
	[BOARD POSITION] [varchar](50) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[MDMTERRITORY] [varchar](2) NULL,
	[RESIGNED] [varchar](1) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[FEE_PD] [smallint] NULL,
	[NPP_MBR] [smallint] NULL,
	[FOREIGN_GRP] [varchar](50) NULL,
	[FEDID] [varchar](12) NULL,
	[DEA] [varchar](10) NULL,
	[STATE MED #] [varchar](15) NULL,
	[RURAL] [smallint] NULL,
	[STATE LIC #] [varchar](15) NULL,
	[ON CALL] [varchar](5) NULL,
	[OBRA 90] [varchar](5) NULL,
	[COUNSELING AREA] [varchar](5) NULL,
	[PATIENT MR] [varchar](5) NULL,
	[DRUG INFORMATION] [varchar](5) NULL,
	[FRAUD?] [varchar](1) NULL,
	[FRD_FEL_EXPLAN] [varchar](50) NULL,
	[RX LICENSE SUS/REV] [varchar](5) NULL,
	[SUS_REV_EXPLAN] [varchar](50) NULL,
	[UNRESTRICTED LIC] [varchar](5) NULL,
	[UNRES_LIC_EXPLAN] [varchar](50) NULL,
	[INV/SANC BY MEDICARE] [varchar](5) NULL,
	[JUDGEMENTS] [varchar](5) NULL,
	[COMPLY WITH ADA ACT] [varchar](5) NULL,
	[UAI COVERAGE] [smallint] NULL,
	[PROF LIAB INS] [varchar](5) NULL,
	[PROF LIAB CARRIER] [varchar](30) NULL,
	[PROF POL #] [varchar](20) NULL,
	[PROF LIAB LIMIT 1] [int] NULL,
	[PROF LIAB LIMIT 2] [int] NULL,
	[PROF LIAB INS COF] [varchar](5) NULL,
	[GEN LIAB INS] [varchar](5) NULL,
	[GEN LIAB INS CARRIER] [varchar](30) NULL,
	[GEN LIAB INS POLICY #] [varchar](20) NULL,
	[GEN LIAB LIMIT 1] [int] NULL,
	[GEN LIAB LIMIT 2] [int] NULL,
	[PHAR LIAB INS] [varchar](5) NULL,
	[AVE WAIT TIME] [int] NULL,
	[MEDICATION ERRORS DOCUMENTED] [varchar](5) NULL,
	[NUMBER ERRORS 12 MOS] [smallint] NULL,
	[RESOLUTION POLICY] [varchar](5) NULL,
	[COMPOUND PRESCRIPTIONS] [varchar](5) NULL,
	[UNIT DOSING] [smallint] NULL,
	[DUR MED EQ SVC] [smallint] NULL,
	[IV ADMIXTURE] [smallint] NULL,
	[CERTIFIED DISEASE MGMT] [smallint] NULL,
	[CDM EXPLANATION] [varchar](50) NULL,
	[GROUP PRESENTATIONS] [smallint] NULL,
	[CONTINUING EDUCATION] [varchar](5) NULL,
	[ST BOARD INSP] [varchar](5) NULL,
	[COPY RELEASE INFO] [varchar](5) NULL,
	[NABP] [varchar](7) NULL,
	[BULLETIN] [varchar](3) NULL,
	[STORE SIZE CLASSIFICATION] [varchar](1) NULL,
	[HOLIDAY HOURS] [varchar](20) NULL,
	[HOURS] [varchar](50) NULL,
	[DELIVERY SERVICE] [varchar](6) NULL,
	[EMERGENCY SERVICES] [varchar](6) NULL,
	[ANS MACH/ANS SERVICE] [varchar](4) NULL,
	[ALTERNATIVE LANGUAGES] [varchar](50) NULL,
	[SPECIALTY SERVICES] [varchar](50) NULL,
	[COMPUTER SOFTWARE] [varchar](50) NULL,
	[OUTSIDE ID] [varchar](4) NULL,
	[WHOLESALER NAME] [varchar](15) NULL,
	[WHOLESALER ACCT#] [varchar](15) NULL,
	[DC_NBR] [varchar](3) NULL,
	[COMPETITIVEACCT] [smallint] NULL,
	[GPPFORM] [varchar](5) NULL,
	[GPPLETTER] [varchar](5) NULL,
	[LEAST EXP GEN] [smallint] NULL,
	[HEALTH PLAN CONTACTS] [varchar](100) NULL,
	[UNITED ASSURANCE] [varchar](4) NULL,
	[MEMO LIT SIGN] [varchar](200) NULL,
	[INDOOR LIGHTED SIGN] [varchar](50) NULL,
	[RX CARE PROGRAM] [varchar](50) NULL,
	[PCS FORM] [smallint] NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[IPCFORM] [varchar](3) NULL,
	[SWITCHEDFROM] [varchar](50) NULL,
	[PRE-POST] [smallint] NULL,
	[ARGUS AGREE] [smallint] NULL,
	[AFFILIATION] [varchar](3) NULL,
	[BBC SECONDARY ACCT] [varchar](50) NULL,
	[GNP] [varchar](3) NULL,
	[MSR] [varchar](4) NULL,
	[PASSWORD] [varchar](25) NULL,
	[LOGIN] [varchar](25) NULL,
	[AVERAGE VOLUME] [int] NULL,
	[PLUSCARE] [varchar](3) NULL,
	[STEP_UP] [smallint] NULL,
	[ADDCHG] [varchar](6) NULL,
	[CHAIN_CODE] [varchar](3) NULL,
	[PAYEE_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[LASTMODIFIED] [datetime] NULL,
	[QUITDATE] [datetime] NULL,
	[EFFECTIVE] [datetime] NULL,
	[DEAEXP] [datetime] NULL,
	[ST LIC EXP DATE] [datetime] NULL,
	[PROF LIAB INS EXP DATE] [datetime] NULL,
	[GEN LIAB INS EXP DATE] [datetime] NULL,
	[GRPEFFDATE] [datetime] NULL,
	[NPI] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdamsPharmOrderHistory_1stQtr]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdamsPharmOrderHistory_1stQtr](
	[ACCT#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[DESC] [nvarchar](255) NULL,
	[Class] [nvarchar](255) NULL,
	[SHP] [float] NULL,
	[INV#] [float] NULL,
	[Date] [datetime] NULL,
	[NDC] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Add to ASW]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Add to ASW](
	[PMID] [nvarchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[ASW NCPDP] [nvarchar](255) NULL,
	[PM NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Add to PM]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Add to PM](
	[PMID] [nvarchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[ASW NCPDP] [nvarchar](255) NULL,
	[PM NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllyScripts_States]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllyScripts_States](
	[State] [nvarchar](2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllyScripts2017]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllyScripts2017](
	[Pharmacy] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[AAP #] [float] NULL,
	[API #] [float] NULL,
	[Date] [datetime] NULL,
	[F6] [nvarchar](255) NULL,
	[F7] [nvarchar](255) NULL,
	[F8] [nvarchar](255) NULL,
	[Rx's Received] [float] NULL,
	[Rx's Filled] [float] NULL,
	[Transferred] [float] NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[anda_may08_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anda_may08_del](
	[DEA] [nvarchar](50) NULL,
	[sales] [float] NULL,
	[rebate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[anda_may08_source2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anda_may08_source2_del](
	[CUST #] [nvarchar](50) NULL,
	[NAME] [nvarchar](50) NULL,
	[DEA] [nvarchar](50) NULL,
	[sales] [real] NULL,
	[rebate] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[anda_temp_0405_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anda_temp_0405_del](
	[ud#] [nvarchar](50) NULL,
	[sales0408] [numeric](15, 2) NULL,
	[sales0508] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anda0408_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anda0408_del](
	[UD#] [nvarchar](50) NULL,
	[ANDA #] [nvarchar](50) NULL,
	[VIP #] [nvarchar](50) NULL,
	[STORE] [nvarchar](50) NULL,
	[Total April 2008] [numeric](15, 2) NULL,
	[DEA] [nvarchar](50) NULL,
	[Column 6] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API Item List]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API Item List](
	[API NDC] [nvarchar](255) NULL,
	[API GPI] [nvarchar](255) NULL,
	[API DRUG NAME] [nvarchar](255) NULL,
	[API FORM] [nvarchar](255) NULL,
	[API SIZE] [nvarchar](255) NULL,
	[API MFG] [nvarchar](255) NULL,
	[API QTY] [float] NULL,
	[NDC to MATCH] [nvarchar](255) NULL,
	[MFG NDC TO MATCH] [nvarchar](255) NULL,
	[NDC Description] [nvarchar](255) NULL,
	[NDC Size] [nvarchar](255) NULL,
	[NDC Form] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_CAH_0909]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_CAH_0909](
	[Div] [float] NULL,
	[Cust] [float] NULL,
	[MasterNo] [varchar](50) NULL,
	[ShipToName] [varchar](255) NULL,
	[ShipToAddr] [varchar](255) NULL,
	[ShipToCity] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[PayTerms] [varchar](255) NULL,
	[StatementFreq] [varchar](255) NULL,
	[NintyDayDSO] [float] NULL,
	[WAPD] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtendedSales] [money] NULL,
	[BrandSales] [money] NULL,
	[TotalGenExtSales] [money] NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[api_cah_0909_grp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_cah_0909_grp](
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtSales] [money] NULL,
	[RxBrandExtSales] [money] NULL,
	[TotGenExtSales] [money] NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[api_pva_0909]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_pva_0909](
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtSales] [money] NULL,
	[RxBrandExtSales] [money] NULL,
	[TotGenExtSales] [money] NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[Q3_Total_WH_Sales_Group] [numeric](38, 2) NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL,
	[GroupNo] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[CAHPayTerms] [varchar](50) NULL,
	[CAGenericConReb] [money] NULL,
	[GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[CAP2P3SALES] [money] NULL,
	[CAP2P3REBATES] [money] NULL,
	[TotalCardinalSales] [money] NULL,
	[CABrandSales] [money] NULL,
	[OTCSales] [money] NULL,
	[Q3WHSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[api_pva_0909_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_pva_0909_bkp](
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtSales] [money] NULL,
	[RxBrandExtSales] [money] NULL,
	[TotGenExtSales] [money] NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL,
	[GroupNo] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[CAHPayTerms] [varchar](50) NULL,
	[CAGenericConReb] [money] NULL,
	[GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[CAP2P3SALES] [money] NULL,
	[CAP2P3REBATES] [money] NULL,
	[TotalCardinalSales] [money] NULL,
	[CABrandSales] [money] NULL,
	[OTCSales] [money] NULL,
	[Q3WHSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[api_pva_0909_rpt]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_pva_0909_rpt](
	[DEA] [varchar](255) NULL,
	[Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](10) NULL,
	[Territory] [varchar](10) NULL,
	[GroupNo] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[AAPAcctNo] [varchar](100) NULL,
	[COG] [float] NULL,
	[AVG_MO_TotalExtSales] [money] NULL,
	[AVG_MO_RxExtSales] [money] NULL,
	[AVG_MO_RxBrandExtSales] [money] NULL,
	[AVG_MO_TotGenExtSales] [money] NULL,
	[AVG_MO_Q3_Total_Sales_Group] [numeric](38, 6) NULL,
	[AVG_MO_TotalSource] [money] NULL,
	[AVG_MO_P2_P3Volume] [money] NULL,
	[AVG_MO_OTC_COG_Applied] [money] NULL,
	[CAHPayTerms] [varchar](50) NULL,
	[AVG_MO_CAGenericConReb] [money] NULL,
	[AVG_MO_GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[AVG_MO_CAP2P3SALES] [money] NULL,
	[AVG_MO_CAP2P3REBATES] [money] NULL,
	[AVG_MO_TotalCardinalSales] [money] NULL,
	[AVG_MO_CABrandSales] [money] NULL,
	[AVG_MO_OTCSales] [money] NULL,
	[AVG_MO_Q3WHSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_SALES_REB_0909]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_SALES_REB_0909](
	[GroupNo] [varchar](50) NULL,
	[BsCls] [varchar](10) NULL,
	[DEA] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[TotalCardinalSales] [money] NULL,
	[CABrandSales] [money] NULL,
	[OTCSales] [money] NULL,
	[CAGenericConReb] [money] NULL,
	[GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[CAP2P3SALES] [money] NULL,
	[CAP2P3REBATES] [money] NULL,
	[CAHPayTerms] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[API_WH_0909]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WH_0909](
	[CUST_STAT] [varchar](50) NULL,
	[AcctNo] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[DEA] [varchar](50) NULL,
	[MEMNUM] [varchar](50) NULL,
	[AffiliatedGrp] [varchar](100) NULL,
	[CA_No] [varchar](50) NULL,
	[AprilSales] [money] NULL,
	[MaySales] [money] NULL,
	[JuneSales] [money] NULL,
	[JulySales] [money] NULL,
	[AugSales] [money] NULL,
	[SeptSales] [money] NULL,
	[F15] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIAccounts_Dynamics]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIAccounts_Dynamics](
	[API #] [float] NULL,
	[API Activated] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIMailingList_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIMailingList_del](
	[NANUM] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[NANAME] [nvarchar](255) NULL,
	[NAADR1] [nvarchar](255) NULL,
	[NAADR2] [nvarchar](255) NULL,
	[NAADR4] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[CONTACT] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[NABP] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreteAdjustmentToJan2017Rebate]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreteAdjustmentToJan2017Rebate](
	[PMID] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[Original Arete Eligible] [bit] NOT NULL,
	[Original Arete Performance Rebate] [money] NULL,
	[Revised Arete Eligible] [bit] NOT NULL,
	[Revised Arete Rebate] [money] NULL,
	[Amount to Claw Back] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atb_reporting_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atb_reporting_del](
	[ATB_REPORT_ID] [int] NULL,
	[ACCT_NO] [char](4) NULL,
	[NCPDP] [char](7) NULL,
	[SCRIPT] [char](15) NULL,
	[FILL_DT] [datetime] NULL,
	[BIN] [char](15) NULL,
	[BAL_0_TO_30_AMT] [numeric](10, 2) NULL,
	[BAL_31_TO_60_AMT] [numeric](10, 2) NULL,
	[BAL_61_TO_90_AMT] [numeric](10, 2) NULL,
	[BAL_91_TO_120_AMT] [numeric](10, 2) NULL,
	[BAL_121_TO_150_AMT] [numeric](10, 2) NULL,
	[BAL_151_TO_180_AMT] [numeric](10, 2) NULL,
	[BAL_OVER_180_AMT] [numeric](10, 2) NULL,
	[BALANCE_AMT] [numeric](10, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[atb_reporting_log_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atb_reporting_log_del](
	[RPT_LOG_ID] [int] NULL,
	[RPT_DESCRIPTION] [varchar](50) NULL,
	[RPT_WE_DT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[AuditID] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SysUser] [varchar](50) NOT NULL,
	[Application] [varchar](50) NOT NULL,
	[TableName] [sysname] NOT NULL,
	[Operation] [char](1) NOT NULL,
	[PrimaryKey] [int] NOT NULL,
	[PrimaryKey2] [int] NULL,
	[PrimaryKey3] [int] NULL,
	[RowDescription] [varchar](50) NULL,
	[SecondaryRow] [varchar](50) NULL,
	[ColumnName] [sysname] NULL,
	[OldValue] [varchar](50) NULL,
	[NewValue] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[baselinereport_volume_extract_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[baselinereport_volume_extract_del](
	[nov07] [numeric](14, 2) NULL,
	[dec07] [numeric](14, 2) NULL,
	[jan08] [numeric](14, 2) NULL,
	[feb08] [numeric](14, 2) NULL,
	[mar08] [numeric](14, 2) NULL,
	[apr08] [numeric](14, 2) NULL,
	[may08] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bg_BoardRxAlly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bg_BoardRxAlly](
	[PMID] [float] NULL,
	[NCPDP] [float] NULL,
	[Board Member] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bg_pslist_match]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bg_pslist_match](
	[ndc] [varchar](11) NULL,
	[gpidesc] [varchar](60) NULL,
	[Chain] [nvarchar](255) NULL,
	[Drug] [nvarchar](255) NULL,
	[Quantity] [float] NULL,
	[Price] [float] NULL,
	[DrugComp] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bg_pslist1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bg_pslist1](
	[Chain] [nvarchar](255) NULL,
	[Drug] [nvarchar](255) NULL,
	[Quantity] [float] NULL,
	[Price] [float] NULL,
	[DrugComp] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bg_pslist1ms]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bg_pslist1ms](
	[ndc] [varchar](11) NOT NULL,
	[drugname] [varchar](25) NULL,
	[gpidesc] [varchar](60) NULL,
	[drugnamecomp] [varchar](8000) NULL,
	[gpidesccomp] [varchar](8000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BigCDetails_March2018]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BigCDetails_March2018](
	[Acctg Mo] [float] NULL,
	[Ordr#] [float] NULL,
	[Order Type] [nvarchar](255) NULL,
	[Cust#] [nvarchar](255) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item-Desc] [nvarchar](255) NULL,
	[Inv#] [float] NULL,
	[Inv Date] [float] NULL,
	[Day] [nvarchar](255) NULL,
	[Rebate EA] [money] NULL,
	[Qty] [float] NULL,
	[RTRAMT1] [money] NULL,
	[Positive Rebate Amount] [money] NULL,
	[Rebate Sales] [money] NULL,
	[20% Sales] [money] NULL,
	[F16] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bkp_udVolume_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bkp_udVolume_del](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brandtype_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brandtype_del](
	[brandid] [char](3) NOT NULL,
	[brandname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_brandtype] PRIMARY KEY CLUSTERED 
(
	[brandid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_OriginalSalesReport_Nov2017]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_OriginalSalesReport_Nov2017](
	[November MSC] [float] NULL,
	[November Matrix] [nvarchar](255) NULL,
	[Customer] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Acct Class Code] [float] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[DC Name] [nvarchar](255) NULL,
	[DC Number] [float] NULL,
	[Dea Number] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[Sales - COG Applied] [money] NULL,
	[Net Sales] [money] NULL,
	[Total AAP Generics w /Excluded (CCA = 25676,25677,58705,29731,26] [money] NULL,
	[IPA Source Sales] [nvarchar](255) NULL,
	[CCA = 25677 AAP Top Generics Source] [money] NULL,
	[CCA = 25676 AAP Source] [money] NULL,
	[CCA = 29731 Source Backup] [money] NULL,
	[CCA = 58705] [float] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [nvarchar](255) NULL,
	[Non Rx Sales] [money] NULL,
	[RX Branded Sales] [float] NULL,
	[OTC Sales] [money] NULL,
	[Other Sales] [float] NULL,
	[RX Sales] [float] NULL,
	[Specially Priced Merchandise] [money] NULL,
	[RX Dropship Sales] [float] NULL,
	[RX Compliance Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAHSalesReport_NOV17]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHSalesReport_NOV17](
	[November MSC] [float] NULL,
	[November Matrix] [nvarchar](255) NULL,
	[Customer] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Acct Class Code] [float] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[DC Name] [nvarchar](255) NULL,
	[DC Number] [float] NULL,
	[Dea Number] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[Sales - COG Applied] [money] NULL,
	[Net Sales] [money] NULL,
	[Total AAP Generics w /Excluded] [money] NULL,
	[IPA Source Sales] [nvarchar](255) NULL,
	[AAP Top Generics Source] [money] NULL,
	[AAP Source] [money] NULL,
	[Source Backup] [money] NULL,
	[CCA = 58705] [float] NULL,
	[AAP Excluded Generic Rx Prod] [nvarchar](255) NULL,
	[Non Rx Sales] [money] NULL,
	[RX Branded Sales] [float] NULL,
	[OTC Sales] [money] NULL,
	[Other Sales] [float] NULL,
	[RX Sales] [float] NULL,
	[Specially Priced Merchandise] [money] NULL,
	[RX Dropship Sales] [float] NULL,
	[RX Compliance Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[dt] [datetime] NULL,
	[mo] [int] NULL,
	[yr] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cardinal Brand Report Nov2017]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cardinal Brand Report Nov2017](
	[Account #] [float] NULL,
	[Account Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Strength] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Mfr] [nvarchar](255) NULL,
	[Month-Year] [datetime] NULL,
	[Unit Price ] [money] NULL,
	[Ship Qty] [float] NULL,
	[Purchase Dollars] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalNCPDP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalNCPDP](
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cardmain0309_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cardmain0309_del](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[AWP] [nvarchar](50) NULL,
	[UDS Sell] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cardndc_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cardndc_del](
	[NDC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cas_vndTransaction]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cas_vndTransaction](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL,
 CONSTRAINT [PK_cas_vndTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cas_vndvolrebate]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cas_vndvolrebate](
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
	[TransactionID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cas_volumecalyy]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cas_volumecalyy](
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL,
	[PMID] [bigint] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CentralPayAuditReport]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentralPayAuditReport](
	[ncpdp] [char](7) NULL,
	[pmid] [int] NULL,
	[accountname] [varchar](65) NULL,
	[TM] [varchar](71) NULL,
	[plan_id] [int] NULL,
	[plan_name] [varchar](50) NULL,
	[min_date] [datetime] NULL,
	[NPI] [varchar](50) NULL,
	[MCEffectivedate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CentralPayPlanToRemove]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentralPayPlanToRemove](
	[PLAN_ID] [nvarchar](50) NULL,
	[NAME] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_0608_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_0608_del](
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Division Name] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[Ship To Postal Code] [nvarchar](50) NULL,
	[Store Number] [nvarchar](50) NULL,
	[Default Buy Plan % (COG's)] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_0608_insert_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_0608_insert_del](
	[acct_no] [nvarchar](50) NULL,
	[payterm] [nvarchar](50) NULL,
	[ARCode] [nvarchar](50) NULL,
	[maxcogs] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_0608_nodups_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_0608_nodups_del](
	[Store Number] [nvarchar](50) NULL,
	[Expr1] [int] NULL,
	[payterm] [nvarchar](50) NULL,
	[cogs] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_0608_src_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_0608_src_del](
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Division Name] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[Ship To Postal Code] [nvarchar](50) NULL,
	[Store Number] [nvarchar](50) NULL,
	[Default Buy Plan % (COG's)] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_1208_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_1208_del](
	[Ship To Division] [float] NULL,
	[Ship To Number] [float] NULL,
	[Store Number] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[COGS] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_1208_nodups_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_1208_nodups_del](
	[Ship To Division] [float] NULL,
	[Ship To Number] [float] NULL,
	[Store Number] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[COGS] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_COGSAR_1208_tmp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_COGSAR_1208_tmp_del](
	[Ship To Division] [float] NULL,
	[Ship To Number] [float] NULL,
	[Store Number] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[COGS] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chainhost_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chainhost_del](
	[id] [int] NOT NULL,
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [nvarchar](50) NULL,
	[Rx Date] [nvarchar](50) NULL,
	[Qty Dispensed] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [nvarchar](50) NULL,
	[Cost Submitted] [nvarchar](50) NULL,
	[Fee Paid] [nvarchar](50) NULL,
	[Cost Paid] [nvarchar](50) NULL,
	[Plan Amount] [nvarchar](50) NULL,
	[Co Pay Amount] [nvarchar](50) NULL,
	[U and C] [nvarchar](50) NULL,
	[Total Price] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHF2Summary]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHF2Summary](
	[Name] [varchar](50) NULL,
	[Address] [varchar](255) NULL,
	[Parent] [varchar](255) NULL,
	[AffNo] [varchar](50) NULL,
	[DC] [varchar](50) NULL,
	[AccNo] [varchar](50) NULL,
	[MasterNo] [float] NULL,
	[AAPStartDate] [datetime] NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[StoreNo] [varchar](50) NULL,
	[DEA] [varchar](50) NULL,
	[DEAExp] [datetime] NULL,
	[SBOP] [float] NULL,
	[SBOPExp] [datetime] NULL,
	[AR2000TermsCode] [varchar](50) NULL,
	[DateDocSentToCCDB] [datetime] NULL,
	[NewAAPAffiliation] [float] NULL,
	[NewRxCOGs] [float] NULL,
	[NewStoreNumber] [varchar](50) NULL,
	[CommittedVolume] [numeric](18, 2) NULL,
	[Terms] [varchar](100) NULL,
	[Notes] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_1_for_AS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_1_for_AS](
	[ID] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_1_loadlog]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_1_loadlog](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_1_loadlog_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_1_loadlog_bkp_del](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_1_loadlog_test_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_1_loadlog_test_del](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_del](
	[DC] [int] NULL,
	[CUSTOMERNAME] [varchar](63) NULL,
	[CUSTOMER#] [varchar](31) NULL,
	[ITEM#] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEMTYPE] [varchar](15) NULL,
	[ITEMDESCR] [varchar](127) NULL,
	[GENERICNAME] [varchar](127) NULL,
	[TRADENAME] [varchar](127) NULL,
	[INVDATE] [datetime] NULL,
	[INVOICE#] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDERQTY] [numeric](18, 0) NULL,
	[SHIPQTY] [numeric](18, 0) NULL,
	[UNITCOST] [float] NULL,
	[EXTCOST] [float] NULL,
	[CORPAWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDORNAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACTFLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERICCODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORTCODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_forecast_ext_cost_mnthly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_forecast_ext_cost_mnthly](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
 CONSTRAINT [PK_chph_forecast_ext_cost_mnthly] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_forecast_ext_cost_mnthly_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_forecast_ext_cost_mnthly_bkp_del](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_loadlog]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_loadlog](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_month_to_date]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_month_to_date](
	[Year] [int] NOT NULL,
	[Store] [varchar](31) NOT NULL,
	[WEEK01] [float] NULL,
	[WEEK02] [float] NULL,
	[WEEK03] [float] NULL,
	[WEEK04] [float] NULL,
	[WEEK05] [float] NULL,
	[WEEK06] [float] NULL,
	[Month] [varchar](2) NOT NULL,
 CONSTRAINT [PK_chph_month_to_date] PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[Store] ASC,
	[Month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_month_to_date_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_month_to_date_bkp](
	[Year] [int] NULL,
	[Store] [varchar](31) NULL,
	[WEEK01] [float] NULL,
	[WEEK02] [float] NULL,
	[WEEK03] [float] NULL,
	[WEEK04] [float] NULL,
	[WEEK05] [float] NULL,
	[WEEK06] [float] NULL,
	[Month] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_mnthly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_mnthly](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
 CONSTRAINT [PK_chph_sum_ext_cost_mnthly] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_mnthly_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_mnthly_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_ndc]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_ndc](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
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
	[january_qty] [int] NULL,
	[february_qty] [int] NULL,
	[march_qty] [int] NULL,
	[april_qty] [int] NULL,
	[may_qty] [int] NULL,
	[june_qty] [int] NULL,
	[july_qty] [int] NULL,
	[august_qty] [int] NULL,
	[september_qty] [int] NULL,
	[october_qty] [int] NULL,
	[november_qty] [int] NULL,
	[december_qty] [int] NULL,
 CONSTRAINT [PK_chph_sum_ext_cost_ndc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_ndc_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_ndc_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
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
	[january_qty] [int] NULL,
	[february_qty] [int] NULL,
	[march_qty] [int] NULL,
	[april_qty] [int] NULL,
	[may_qty] [int] NULL,
	[june_qty] [int] NULL,
	[july_qty] [int] NULL,
	[august_qty] [int] NULL,
	[september_qty] [int] NULL,
	[october_qty] [int] NULL,
	[november_qty] [int] NULL,
	[december_qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_ndc_Quarterly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_ndc_Quarterly](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Q1] [float] NULL,
	[Q2] [float] NULL,
	[Q3] [float] NULL,
	[Q4] [float] NULL,
	[Q1_st_cnt] [int] NULL,
	[Q2_st_cnt] [int] NULL,
	[Q3_st_cnt] [int] NULL,
	[Q4_st_cnt] [int] NULL,
	[Q1_qty] [int] NULL,
	[Q2_qty] [int] NULL,
	[Q3_qty] [int] NULL,
	[Q4_qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_ndc_Quarterly_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_ndc_Quarterly_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Q1] [float] NULL,
	[Q2] [float] NULL,
	[Q3] [float] NULL,
	[Q4] [float] NULL,
	[Q1_st_cnt] [int] NULL,
	[Q2_st_cnt] [int] NULL,
	[Q3_st_cnt] [int] NULL,
	[Q4_st_cnt] [int] NULL,
	[Q1_qty] [int] NULL,
	[Q2_qty] [int] NULL,
	[Q3_qty] [int] NULL,
	[Q4_qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_wkly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_wkly](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
	[WEEK_1_RX] [float] NULL,
	[WEEK_1_OTC] [float] NULL,
	[WEEK_2_RX] [float] NULL,
	[WEEK_2_OTC] [float] NULL,
	[WEEK_3_RX] [float] NULL,
	[WEEK_3_OTC] [float] NULL,
	[WEEK_4_RX] [float] NULL,
	[WEEK_4_OTC] [float] NULL,
	[WEEK_5_RX] [float] NULL,
	[WEEK_5_OTC] [float] NULL,
	[WEEK_6_RX] [float] NULL,
	[WEEK_6_OTC] [float] NULL,
	[WEEK_7_RX] [float] NULL,
	[WEEK_7_OTC] [float] NULL,
	[WEEK_8_RX] [float] NULL,
	[WEEK_8_OTC] [float] NULL,
	[WEEK_9_RX] [float] NULL,
	[WEEK_9_OTC] [float] NULL,
	[WEEK_10_RX] [float] NULL,
	[WEEK_10_OTC] [float] NULL,
	[WEEK_11_RX] [float] NULL,
	[WEEK_11_OTC] [float] NULL,
	[WEEK_12_RX] [float] NULL,
	[WEEK_12_OTC] [float] NULL,
	[WEEK_13_RX] [float] NULL,
	[WEEK_13_OTC] [float] NULL,
	[WEEK_14_RX] [float] NULL,
	[WEEK_14_OTC] [float] NULL,
	[WEEK_15_RX] [float] NULL,
	[WEEK_15_OTC] [float] NULL,
	[WEEK_16_RX] [float] NULL,
	[WEEK_16_OTC] [float] NULL,
	[WEEK_17_RX] [float] NULL,
	[WEEK_17_OTC] [float] NULL,
	[WEEK_18_RX] [float] NULL,
	[WEEK_18_OTC] [float] NULL,
	[WEEK_19_RX] [float] NULL,
	[WEEK_19_OTC] [float] NULL,
	[WEEK_20_RX] [float] NULL,
	[WEEK_20_OTC] [float] NULL,
	[WEEK_21_RX] [float] NULL,
	[WEEK_21_OTC] [float] NULL,
	[WEEK_22_RX] [float] NULL,
	[WEEK_22_OTC] [float] NULL,
	[WEEK_23_RX] [float] NULL,
	[WEEK_23_OTC] [float] NULL,
	[WEEK_24_RX] [float] NULL,
	[WEEK_24_OTC] [float] NULL,
	[WEEK_25_RX] [float] NULL,
	[WEEK_25_OTC] [float] NULL,
	[WEEK_26_RX] [float] NULL,
	[WEEK_26_OTC] [float] NULL,
	[WEEK_27_RX] [float] NULL,
	[WEEK_27_OTC] [float] NULL,
	[WEEK_28_RX] [float] NULL,
	[WEEK_28_OTC] [float] NULL,
	[WEEK_29_RX] [float] NULL,
	[WEEK_29_OTC] [float] NULL,
	[WEEK_30_RX] [float] NULL,
	[WEEK_30_OTC] [float] NULL,
	[WEEK_31_RX] [float] NULL,
	[WEEK_31_OTC] [float] NULL,
	[WEEK_32_RX] [float] NULL,
	[WEEK_32_OTC] [float] NULL,
	[WEEK_33_RX] [float] NULL,
	[WEEK_33_OTC] [float] NULL,
	[WEEK_34_RX] [float] NULL,
	[WEEK_34_OTC] [float] NULL,
	[WEEK_35_RX] [float] NULL,
	[WEEK_35_OTC] [float] NULL,
	[WEEK_36_RX] [float] NULL,
	[WEEK_36_OTC] [float] NULL,
	[WEEK_37_RX] [float] NULL,
	[WEEK_37_OTC] [float] NULL,
	[WEEK_38_RX] [float] NULL,
	[WEEK_38_OTC] [float] NULL,
	[WEEK_39_RX] [float] NULL,
	[WEEK_39_OTC] [float] NULL,
	[WEEK_40_RX] [float] NULL,
	[WEEK_40_OTC] [float] NULL,
	[WEEK_41_RX] [float] NULL,
	[WEEK_41_OTC] [float] NULL,
	[WEEK_42_RX] [float] NULL,
	[WEEK_42_OTC] [float] NULL,
	[WEEK_43_RX] [float] NULL,
	[WEEK_43_OTC] [float] NULL,
	[WEEK_44_RX] [float] NULL,
	[WEEK_44_OTC] [float] NULL,
	[WEEK_45_RX] [float] NULL,
	[WEEK_45_OTC] [float] NULL,
	[WEEK_46_RX] [float] NULL,
	[WEEK_46_OTC] [float] NULL,
	[WEEK_47_RX] [float] NULL,
	[WEEK_47_OTC] [float] NULL,
	[WEEK_48_RX] [float] NULL,
	[WEEK_48_OTC] [float] NULL,
	[WEEK_49_RX] [float] NULL,
	[WEEK_49_OTC] [float] NULL,
	[WEEK_50_RX] [float] NULL,
	[WEEK_50_OTC] [float] NULL,
	[WEEK_51_RX] [float] NULL,
	[WEEK_51_OTC] [float] NULL,
	[WEEK_52_RX] [float] NULL,
	[WEEK_52_OTC] [float] NULL,
	[WEEK_53_RX] [float] NULL,
	[WEEK_53_OTC] [float] NULL,
	[WEEK_54_RX] [float] NULL,
	[WEEK_54_OTC] [float] NULL,
 CONSTRAINT [PK_chph_sum_ext_cost_wkly] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_tmp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_tmp_del](
	[ndc] [varchar](15) NULL,
	[Q1_08] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_volume_compare]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_volume_compare](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TABLE_TYPE] [varchar](50) NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
 CONSTRAINT [PK_chph_volume_compare] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_x_day_moving_avg_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_x_day_moving_avg_del](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPHDec]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPHDec](
	[NDC] [varchar](15) NULL,
	[UnitCost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPHJuly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPHJuly](
	[NDC] [varchar](15) NULL,
	[UnitCost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHTop100]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHTop100](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL,
 CONSTRAINT [PK_CHTop100] PRIMARY KEY CLUSTERED 
(
	[CIN] ASC,
	[Filedate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHTop100Old_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHTop100Old_del](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUDTop100]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUDTop100](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL,
 CONSTRAINT [PK_CHUDTop100] PRIMARY KEY CLUSTERED 
(
	[CIN] ASC,
	[Filedate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUSource0508_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUSource0508_del](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[SellPrice] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NULL,
	[DP] [varchar](15) NULL,
	[UnitPrice] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claimset_template_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claimset_template_del](
	[NDC] [char](11) NULL,
	[DrugName] [varchar](63) NULL,
	[Strength] [varchar](31) NULL,
	[BrandType] [varchar](31) NULL,
	[DAW] [varchar](63) NULL,
	[Field6] [varchar](15) NULL,
	[DotNbr] [int] NULL,
	[Metrics] [varchar](15) NULL,
	[TRxCount] [int] NULL,
	[TRxQuantity] [int] NULL,
	[TotalAWP] [float] NULL,
	[PatientPaid] [float] NULL,
	[TotalPaid] [float] NULL,
	[DispensingFee] [float] NULL,
	[TotalIngredientCost] [float] NULL,
	[UsualCustomary] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COG_test_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COG_test_del](
	[Store Number] [float] NULL,
	[COG Buy Plan %] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CP_Check]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_Check](
	[CHECK_NUM] [int] NULL,
	[WK_CYCLE_END_DT] [datetime] NULL,
	[NCPDP] [varchar](7) NULL,
	[PAID_AMT] [numeric](12, 2) NULL,
	[PAID_DT] [datetime] NULL,
	[PRINT_FLG] [smallint] NULL,
	[XMIT_FLG] [smallint] NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CP_DirectDeposit]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_DirectDeposit](
	[DIR_DEP_ID] [int] NULL,
	[NCPDP] [varchar](7) NULL,
	[DEP_AMT] [numeric](12, 2) NULL,
	[TRAN_DT] [datetime] NULL,
	[XMIT_FLG] [smallint] NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CPay2012]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPay2012](
	[PAYEE_ID] [varchar](6) NULL,
	[NCPDP] [varchar](7) NULL,
	[TOTAL] [float] NULL,
	[CHECK_NAME] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cpay2014_1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpay2014_1](
	[NCPDP] [varchar](7) NULL,
	[AMT] [numeric](12, 2) NULL,
	[DT] [datetime] NULL,
	[PAYEE_ID] [int] NULL,
	[TYPE] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cpay2014_2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpay2014_2](
	[PLAN_ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[YR] [numeric](4, 0) NULL,
	[MO] [numeric](2, 0) NULL,
	[AMT_PAID] [float] NULL,
	[CLAIMS] [float] NULL,
	[RECEIPTS] [numeric](10, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers_forTracie]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_forTracie](
	[PMID] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[F3] [nvarchar](255) NOT NULL,
	[F4] [nvarchar](255) NOT NULL,
	[F5] [nvarchar](255) NOT NULL,
	[F6] [nvarchar](255) NOT NULL,
	[F7] [nvarchar](255) NOT NULL,
	[F8] [datetime] NOT NULL,
	[F9] [datetime] NOT NULL,
	[F10] [datetime] NOT NULL,
	[F11] [datetime] NOT NULL,
	[F12] [nvarchar](255) NOT NULL,
	[F13] [nvarchar](255) NOT NULL,
	[F14] [nvarchar](255) NOT NULL,
	[F15] [nvarchar](255) NOT NULL,
	[F16] [nvarchar](255) NOT NULL,
	[F17] [nvarchar](255) NOT NULL,
	[F18] [nvarchar](255) NOT NULL,
	[F19] [nvarchar](255) NOT NULL,
	[F20] [nvarchar](255) NOT NULL,
	[F21] [nvarchar](255) NOT NULL,
	[F22] [nvarchar](255) NOT NULL,
	[F23] [nvarchar](255) NOT NULL,
	[F24] [nvarchar](255) NOT NULL,
	[F25] [nvarchar](255) NOT NULL,
	[F26] [nvarchar](255) NOT NULL,
	[F27] [nvarchar](255) NOT NULL,
	[F28] [nvarchar](255) NOT NULL,
	[F29] [nvarchar](255) NOT NULL,
	[F30] [nvarchar](255) NOT NULL,
	[F31] [nvarchar](255) NOT NULL,
	[F32] [nvarchar](255) NOT NULL,
	[F33] [nvarchar](255) NOT NULL,
	[F34] [nvarchar](255) NOT NULL,
	[F35] [nvarchar](255) NOT NULL,
	[F36] [nvarchar](255) NOT NULL,
	[F37] [nvarchar](255) NOT NULL,
	[F38] [nvarchar](255) NOT NULL,
	[F39] [nvarchar](255) NOT NULL,
	[F40] [nvarchar](255) NOT NULL,
	[F41] [nvarchar](255) NOT NULL,
	[F42] [nvarchar](255) NOT NULL,
	[F43] [nvarchar](255) NOT NULL,
	[F44] [nvarchar](255) NOT NULL,
	[F45] [nvarchar](255) NOT NULL,
	[F46] [nvarchar](255) NOT NULL,
	[F47] [nvarchar](255) NOT NULL,
	[F48] [nvarchar](255) NOT NULL,
	[F49] [nvarchar](255) NOT NULL,
	[F50] [nvarchar](255) NOT NULL,
	[F51] [nvarchar](255) NOT NULL,
	[F52] [nvarchar](255) NOT NULL,
	[F53] [nvarchar](255) NOT NULL,
	[F54] [nvarchar](255) NOT NULL,
	[F55] [nvarchar](255) NOT NULL,
	[F56] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATES_TABLE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATES_TABLE](
	[DATE_ID] [int] NOT NULL,
	[DATE] [datetime] NOT NULL,
	[NEXT_DAY_DATE] [datetime] NOT NULL,
	[YEAR] [smallint] NOT NULL,
	[YEAR_QUARTER] [int] NOT NULL,
	[YEAR_MONTH] [int] NOT NULL,
	[YEAR_DAY_OF_YEAR] [int] NOT NULL,
	[QUARTER] [tinyint] NOT NULL,
	[MONTH] [tinyint] NOT NULL,
	[DAY_OF_YEAR] [smallint] NOT NULL,
	[DAY_OF_MONTH] [smallint] NOT NULL,
	[DAY_OF_WEEK] [tinyint] NOT NULL,
	[YEAR_NAME] [varchar](4) NOT NULL,
	[YEAR_QUARTER_NAME] [varchar](7) NOT NULL,
	[YEAR_MONTH_NAME] [varchar](8) NOT NULL,
	[YEAR_MONTH_NAME_LONG] [varchar](14) NOT NULL,
	[QUARTER_NAME] [varchar](2) NOT NULL,
	[MONTH_NAME] [varchar](3) NOT NULL,
	[MONTH_NAME_LONG] [varchar](9) NOT NULL,
	[WEEKDAY_NAME] [varchar](3) NOT NULL,
	[WEEKDAY_NAME_LONG] [varchar](9) NOT NULL,
	[START_OF_YEAR_DATE] [datetime] NOT NULL,
	[END_OF_YEAR_DATE] [datetime] NOT NULL,
	[START_OF_QUARTER_DATE] [datetime] NOT NULL,
	[END_OF_QUARTER_DATE] [datetime] NOT NULL,
	[START_OF_MONTH_DATE] [datetime] NOT NULL,
	[END_OF_MONTH_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_SUN_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_SUN_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_MON_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_MON_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_TUE_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_TUE_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_WED_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_WED_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_THU_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_THU_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_FRI_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_FRI_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_SAT_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_SAT_DATE] [datetime] NOT NULL,
	[QUARTER_SEQ_NO] [int] NOT NULL,
	[MONTH_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_SUN_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_MON_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_TUE_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_WED_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_THU_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_FRI_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_SAT_SEQ_NO] [int] NOT NULL,
	[JULIAN_DATE] [int] NOT NULL,
	[MODIFIED_JULIAN_DATE] [int] NOT NULL,
	[ISO_DATE] [varchar](10) NOT NULL,
	[ISO_YEAR_WEEK_NO] [int] NOT NULL,
	[ISO_WEEK_NO] [smallint] NOT NULL,
	[ISO_DAY_OF_WEEK] [tinyint] NOT NULL,
	[ISO_YEAR_WEEK_NAME] [varchar](8) NOT NULL,
	[ISO_YEAR_WEEK_DAY_OF_WEEK_NAME] [varchar](10) NOT NULL,
	[DATE_FORMAT_YYYY_MM_DD] [varchar](10) NOT NULL,
	[DATE_FORMAT_YYYY_M_D] [varchar](10) NOT NULL,
	[DATE_FORMAT_MM_DD_YYYY] [varchar](10) NOT NULL,
	[DATE_FORMAT_M_D_YYYY] [varchar](10) NOT NULL,
	[DATE_FORMAT_MMM_D_YYYY] [varchar](12) NOT NULL,
	[DATE_FORMAT_MMMMMMMMM_D_YYYY] [varchar](18) NOT NULL,
	[DATE_FORMAT_MM_DD_YY] [varchar](8) NOT NULL,
	[DATE_FORMAT_M_D_YY] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dec16NewMems]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dec16NewMems](
	[Eff# Date] [datetime] NULL,
	[TM] [float] NULL,
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[City ] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[M or S] [nvarchar](255) NULL,
	[Average Mthly Vol] [float] NULL,
	[Whslr  (CAH    or ML)] [nvarchar](255) NULL,
	[*Exist, Comp or New] [nvarchar](255) NULL,
	[New Mem] [float] NULL,
	[Satellite Location] [float] NULL,
	[Existing PVA Customer] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Exist API Whse Cust] [float] NULL,
	[New Whse] [float] NULL,
	[New MC] [float] NULL,
	[Change of ownership] [float] NULL,
	[Notes] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[TM Cold Call] [float] NULL,
	[CAH Rep] [float] NULL,
	[Web Inquiry] [nvarchar](255) NULL,
	[Phone In Inquiry] [nvarchar](255) NULL,
	[Current WH Cust ] [float] NULL,
	[Mem Referral ] [float] NULL,
	[Identiiy…] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[December2009Sales]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[December2009Sales](
	[Cust#] [nvarchar](11) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item] [nvarchar](35) NULL,
	[Group] [nvarchar](5) NULL,
	[Desc] [nvarchar](30) NULL,
	[Qty] [decimal](15, 3) NULL,
	[Sales Price] [decimal](17, 4) NULL,
	[Ext Sales] [float] NULL,
	[Inv Date] [decimal](8, 0) NULL,
	[Inv #] [decimal](7, 0) NULL,
	[Ord Cls] [nvarchar](2) NULL,
	[Admin Grp] [nvarchar](6) NULL,
	[Smn] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DecliningRateAccounts]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DecliningRateAccounts](
	[WHAccountID] [float] NULL,
	[PMID] [float] NULL,
	[AvgRate] [nvarchar](255) NULL,
	[GenSales_Jan18] [money] NULL,
	[Feb] [nvarchar](255) NULL,
	[Mar] [nvarchar](255) NULL,
	[Apr] [nvarchar](255) NULL,
	[May] [nvarchar](255) NULL,
	[Jun] [nvarchar](255) NULL,
	[Jul] [nvarchar](255) NULL,
	[Aug] [nvarchar](255) NULL,
	[Sep] [nvarchar](255) NULL,
	[Oct] [nvarchar](255) NULL,
	[Nov] [nvarchar](255) NULL,
	[Dec] [nvarchar](255) NULL,
	[Total ] [nvarchar](255) NULL,
	[36K] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destination - AAPGenerics102510]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination - AAPGenerics102510](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[AAP Top Generics Sell Price] [money] NULL,
	[AAP Top Generics Price Per Unit] [money] NULL,
	[BrandName] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Color] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[CIN] [nvarchar](255) NULL,
	[DP] [nvarchar](255) NULL,
	[GPI] [nvarchar](255) NULL,
	[GCN] [nvarchar](255) NULL,
	[GCN_SEQNO] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiplomatFees_111816]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiplomatFees_111816](
	[Pharmacy Name] [nvarchar](255) NULL,
	[Pharmacy Number] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discrepancies]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discrepancies](
	[PMID] [nvarchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[ASW NCPDP] [nvarchar](255) NULL,
	[PM NCPDP] [nvarchar](255) NULL,
	[F6] [nvarchar](255) NULL,
	[F7] [nvarchar](255) NULL,
	[F8] [nvarchar](255) NULL,
	[F9] [nvarchar](255) NULL,
	[F10] [nvarchar](255) NULL,
	[F11] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL,
	[F13] [nvarchar](255) NULL,
	[F14] [nvarchar](255) NULL,
	[F15] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[F26] [nvarchar](255) NULL,
	[F27] [nvarchar](255) NULL,
	[F28] [nvarchar](255) NULL,
	[F29] [nvarchar](255) NULL,
	[F30] [nvarchar](255) NULL,
	[F31] [nvarchar](255) NULL,
	[F32] [nvarchar](255) NULL,
	[F33] [nvarchar](255) NULL,
	[F34] [nvarchar](255) NULL,
	[F35] [nvarchar](255) NULL,
	[F36] [nvarchar](255) NULL,
	[F37] [nvarchar](255) NULL,
	[F38] [nvarchar](255) NULL,
	[F39] [nvarchar](255) NULL,
	[F40] [nvarchar](255) NULL,
	[F41] [nvarchar](255) NULL,
	[F42] [nvarchar](255) NULL,
	[F43] [nvarchar](255) NULL,
	[F44] [nvarchar](255) NULL,
	[F45] [nvarchar](255) NULL,
	[F46] [nvarchar](255) NULL,
	[F47] [nvarchar](255) NULL,
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
	[F72] [nvarchar](255) NULL,
	[F73] [nvarchar](255) NULL,
	[F74] [nvarchar](255) NULL,
	[F75] [nvarchar](255) NULL,
	[F76] [nvarchar](255) NULL,
	[F77] [nvarchar](255) NULL,
	[F78] [nvarchar](255) NULL,
	[F79] [nvarchar](255) NULL,
	[F80] [nvarchar](255) NULL,
	[F81] [nvarchar](255) NULL,
	[F82] [nvarchar](255) NULL,
	[F83] [nvarchar](255) NULL,
	[F84] [nvarchar](255) NULL,
	[F85] [nvarchar](255) NULL,
	[F86] [nvarchar](255) NULL,
	[F87] [nvarchar](255) NULL,
	[F88] [nvarchar](255) NULL,
	[F89] [nvarchar](255) NULL,
	[F90] [nvarchar](255) NULL,
	[F91] [nvarchar](255) NULL,
	[F92] [nvarchar](255) NULL,
	[F93] [nvarchar](255) NULL,
	[F94] [nvarchar](255) NULL,
	[F95] [nvarchar](255) NULL,
	[F96] [nvarchar](255) NULL,
	[F97] [nvarchar](255) NULL,
	[F98] [nvarchar](255) NULL,
	[F99] [nvarchar](255) NULL,
	[F100] [nvarchar](255) NULL,
	[F101] [nvarchar](255) NULL,
	[F102] [nvarchar](255) NULL,
	[F103] [nvarchar](255) NULL,
	[F104] [nvarchar](255) NULL,
	[F105] [nvarchar](255) NULL,
	[F106] [nvarchar](255) NULL,
	[F107] [nvarchar](255) NULL,
	[F108] [nvarchar](255) NULL,
	[F109] [nvarchar](255) NULL,
	[F110] [nvarchar](255) NULL,
	[F111] [nvarchar](255) NULL,
	[F112] [nvarchar](255) NULL,
	[F113] [nvarchar](255) NULL,
	[F114] [nvarchar](255) NULL,
	[F115] [nvarchar](255) NULL,
	[F116] [nvarchar](255) NULL,
	[F117] [nvarchar](255) NULL,
	[F118] [nvarchar](255) NULL,
	[F119] [nvarchar](255) NULL,
	[F120] [nvarchar](255) NULL,
	[F121] [nvarchar](255) NULL,
	[F122] [nvarchar](255) NULL,
	[F123] [nvarchar](255) NULL,
	[F124] [nvarchar](255) NULL,
	[F125] [nvarchar](255) NULL,
	[F126] [nvarchar](255) NULL,
	[F127] [nvarchar](255) NULL,
	[F128] [nvarchar](255) NULL,
	[F129] [nvarchar](255) NULL,
	[F130] [nvarchar](255) NULL,
	[F131] [nvarchar](255) NULL,
	[F132] [nvarchar](255) NULL,
	[F133] [nvarchar](255) NULL,
	[F134] [nvarchar](255) NULL,
	[F135] [nvarchar](255) NULL,
	[F136] [nvarchar](255) NULL,
	[F137] [nvarchar](255) NULL,
	[F138] [nvarchar](255) NULL,
	[F139] [nvarchar](255) NULL,
	[F140] [nvarchar](255) NULL,
	[F141] [nvarchar](255) NULL,
	[F142] [nvarchar](255) NULL,
	[F143] [nvarchar](255) NULL,
	[F144] [nvarchar](255) NULL,
	[F145] [nvarchar](255) NULL,
	[F146] [nvarchar](255) NULL,
	[F147] [nvarchar](255) NULL,
	[F148] [nvarchar](255) NULL,
	[F149] [nvarchar](255) NULL,
	[F150] [nvarchar](255) NULL,
	[F151] [nvarchar](255) NULL,
	[F152] [nvarchar](255) NULL,
	[F153] [nvarchar](255) NULL,
	[F154] [nvarchar](255) NULL,
	[F155] [nvarchar](255) NULL,
	[F156] [nvarchar](255) NULL,
	[F157] [nvarchar](255) NULL,
	[F158] [nvarchar](255) NULL,
	[F159] [nvarchar](255) NULL,
	[F160] [nvarchar](255) NULL,
	[F161] [nvarchar](255) NULL,
	[F162] [nvarchar](255) NULL,
	[F163] [nvarchar](255) NULL,
	[F164] [nvarchar](255) NULL,
	[F165] [nvarchar](255) NULL,
	[F166] [nvarchar](255) NULL,
	[F167] [nvarchar](255) NULL,
	[F168] [nvarchar](255) NULL,
	[F169] [nvarchar](255) NULL,
	[F170] [nvarchar](255) NULL,
	[F171] [nvarchar](255) NULL,
	[F172] [nvarchar](255) NULL,
	[F173] [nvarchar](255) NULL,
	[F174] [nvarchar](255) NULL,
	[F175] [nvarchar](255) NULL,
	[F176] [nvarchar](255) NULL,
	[F177] [nvarchar](255) NULL,
	[F178] [nvarchar](255) NULL,
	[F179] [nvarchar](255) NULL,
	[F180] [nvarchar](255) NULL,
	[F181] [nvarchar](255) NULL,
	[F182] [nvarchar](255) NULL,
	[F183] [nvarchar](255) NULL,
	[F184] [nvarchar](255) NULL,
	[F185] [nvarchar](255) NULL,
	[F186] [nvarchar](255) NULL,
	[F187] [nvarchar](255) NULL,
	[F188] [nvarchar](255) NULL,
	[F189] [nvarchar](255) NULL,
	[F190] [nvarchar](255) NULL,
	[F191] [nvarchar](255) NULL,
	[F192] [nvarchar](255) NULL,
	[F193] [nvarchar](255) NULL,
	[F194] [nvarchar](255) NULL,
	[F195] [nvarchar](255) NULL,
	[F196] [nvarchar](255) NULL,
	[F197] [nvarchar](255) NULL,
	[F198] [nvarchar](255) NULL,
	[F199] [nvarchar](255) NULL,
	[F200] [nvarchar](255) NULL,
	[F201] [nvarchar](255) NULL,
	[F202] [nvarchar](255) NULL,
	[F203] [nvarchar](255) NULL,
	[F204] [nvarchar](255) NULL,
	[F205] [nvarchar](255) NULL,
	[F206] [nvarchar](255) NULL,
	[F207] [nvarchar](255) NULL,
	[F208] [nvarchar](255) NULL,
	[F209] [nvarchar](255) NULL,
	[F210] [nvarchar](255) NULL,
	[F211] [nvarchar](255) NULL,
	[F212] [nvarchar](255) NULL,
	[F213] [nvarchar](255) NULL,
	[F214] [nvarchar](255) NULL,
	[F215] [nvarchar](255) NULL,
	[F216] [nvarchar](255) NULL,
	[F217] [nvarchar](255) NULL,
	[F218] [nvarchar](255) NULL,
	[F219] [nvarchar](255) NULL,
	[F220] [nvarchar](255) NULL,
	[F221] [nvarchar](255) NULL,
	[F222] [nvarchar](255) NULL,
	[F223] [nvarchar](255) NULL,
	[F224] [nvarchar](255) NULL,
	[F225] [nvarchar](255) NULL,
	[F226] [nvarchar](255) NULL,
	[F227] [nvarchar](255) NULL,
	[F228] [nvarchar](255) NULL,
	[F229] [nvarchar](255) NULL,
	[F230] [nvarchar](255) NULL,
	[F231] [nvarchar](255) NULL,
	[F232] [nvarchar](255) NULL,
	[F233] [nvarchar](255) NULL,
	[F234] [nvarchar](255) NULL,
	[F235] [nvarchar](255) NULL,
	[F236] [nvarchar](255) NULL,
	[F237] [nvarchar](255) NULL,
	[F238] [nvarchar](255) NULL,
	[F239] [nvarchar](255) NULL,
	[F240] [nvarchar](255) NULL,
	[F241] [nvarchar](255) NULL,
	[F242] [nvarchar](255) NULL,
	[F243] [nvarchar](255) NULL,
	[F244] [nvarchar](255) NULL,
	[F245] [nvarchar](255) NULL,
	[F246] [nvarchar](255) NULL,
	[F247] [nvarchar](255) NULL,
	[F248] [nvarchar](255) NULL,
	[F249] [nvarchar](255) NULL,
	[F250] [nvarchar](255) NULL,
	[F251] [nvarchar](255) NULL,
	[F252] [nvarchar](255) NULL,
	[F253] [nvarchar](255) NULL,
	[F254] [nvarchar](255) NULL,
	[F255] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ENROLLED]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENROLLED](
	[NCDPD] [nvarchar](255) NULL,
	[NPI] [float] NULL,
	[PHARMACY NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[ZIP] [float] NULL,
	[Software] [nvarchar](255) NULL,
	[GO LIVE] [datetime] NULL,
	[Column1] [nvarchar](255) NULL,
	[F11] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL,
	[F13] [nvarchar](255) NULL,
	[F14] [nvarchar](255) NULL,
	[F15] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[F26] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Envision_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Envision_del](
	[GPI] [nvarchar](50) NULL,
	[Name] [nvarchar](500) NULL,
	[MAC] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feed_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feed_del](
	[Feed_id] [int] NULL,
	[data_src_id] [int] NULL,
	[data_src_type] [char](1) NULL,
	[plan_cycle_dt] [datetime] NULL,
	[layout_id] [char](10) NULL,
	[Load_Start_TM] [datetime] NULL,
	[Load_End_TM] [datetime] NULL,
	[feed_stat] [char](1) NULL,
	[error_code] [char](10) NULL,
	[feed_stat_desc] [varchar](48) NULL,
	[Feed_Stat_TM] [datetime] NULL,
	[filename] [varchar](32) NULL,
	[record_count] [int] NULL,
	[total_amt] [numeric](12, 2) NULL,
	[total_misc_amt] [numeric](10, 2) NULL,
	[uploaded_to_access] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuzzyLookupMatchIndex]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyLookupMatchIndex](
	[Token] [nvarchar](255) NULL,
	[ColumnNumber] [int] NULL,
	[TokenProp] [int] NULL,
	[BucketNumber] [timestamp] NOT NULL,
	[Freq] [int] NULL,
	[Rids] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuzzyLookupMatchIndex_FLRef_170207_11:17:15_13432_0579934a-2eb9-40a2-9ba7-3f02c70db4fe]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyLookupMatchIndex_FLRef_170207_11:17:15_13432_0579934a-2eb9-40a2-9ba7-3f02c70db4fe](
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[RID_170207_11:17:15_13432_0579934a-2eb9-40a2-9ba7-3f02c70db4fe] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuzzyMatchOutput]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyMatchOutput](
	[PMID] [int] NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](150) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_City] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genericompliance061808_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genericompliance061808_del](
	[store] [nvarchar](50) NULL,
	[vendor_name] [nvarchar](50) NULL,
	[ud_acct] [nvarchar](50) NULL,
	[vendor_id] [nvarchar](50) NULL,
	[master_vendor] [nvarchar](50) NULL,
	[gJan] [money] NULL,
	[gFeb] [money] NULL,
	[gMar] [money] NULL,
	[gApr] [money] NULL,
	[gJun] [money] NULL,
	[gJul] [money] NULL,
	[gAug] [money] NULL,
	[gSep] [money] NULL,
	[gOct] [money] NULL,
	[gNov] [money] NULL,
	[gDec] [money] NULL,
	[rxJan] [money] NULL,
	[rxFeb] [money] NULL,
	[rxMar] [money] NULL,
	[rxApr] [money] NULL,
	[rxMay] [money] NULL,
	[rxJun] [money] NULL,
	[rxJul] [money] NULL,
	[rxAug] [money] NULL,
	[rxSep] [money] NULL,
	[rxOct] [money] NULL,
	[rxNov] [money] NULL,
	[rxDec] [money] NULL,
	[cJan] [real] NULL,
	[cFeb] [real] NULL,
	[cMar] [real] NULL,
	[cApr] [real] NULL,
	[cMay] [real] NULL,
	[cJun] [real] NULL,
	[cJul] [real] NULL,
	[cAug] [real] NULL,
	[cSep] [real] NULL,
	[cOct] [real] NULL,
	[cNov] [real] NULL,
	[cDec] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMAnalysis]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMAnalysis](
	[AnalysisID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DataID] [int] NULL,
	[FileName] [nvarchar](200) NULL,
	[PriceFileDate] [datetime] NULL,
	[FDBDate] [datetime] NULL,
	[WholeSaler] [int] NULL,
	[Discount] [numeric](10, 2) NULL,
	[DispensingFee] [numeric](10, 2) NULL,
	[Fromdt] [datetime] NULL,
	[Todt] [datetime] NULL,
	[Stores] [int] NULL,
	[days] [int] NULL,
	[daytype] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_GMAnalysis] PRIMARY KEY CLUSTERED 
(
	[AnalysisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMDataSource]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMDataSource](
	[DataID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DataSource] [nvarchar](50) NULL,
 CONSTRAINT [PK_switches] PRIMARY KEY CLUSTERED 
(
	[DataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMOutput]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMOutput](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[NDCCount] [numeric](28, 2) NULL,
	[NDCCountMatch] [numeric](28, 2) NULL,
	[Scripts] [numeric](28, 2) NULL,
	[ScriptsMatch] [numeric](28, 2) NULL,
	[PatientPaid] [numeric](28, 2) NULL,
	[PlanPaid] [numeric](28, 2) NULL,
	[AWP] [numeric](28, 2) NULL,
	[WAC] [numeric](28, 2) NULL,
	[PercentNDCMatch] [numeric](18, 4) NULL,
	[PercentScriptsMatch] [numeric](18, 4) NULL,
	[AnalysisID] [int] NULL,
 CONSTRAINT [PK_tmp_MagmaOutput] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMPrice]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMPrice](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GMRNP2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GMRNP2](
	[NDC] [varchar](11) NOT NULL,
	[NPT_TYPE] [varchar](2) NOT NULL,
	[NPT_DATEC] [datetime] NOT NULL,
	[NPT_PRICEX] [numeric](11, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoldenPlainsRebatesJan2018]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoldenPlainsRebatesJan2018](
	[Acctg Mo] [float] NULL,
	[Ordr#] [float] NULL,
	[Order Type] [nvarchar](255) NULL,
	[Cust#] [nvarchar](255) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item-Desc] [nvarchar](255) NULL,
	[Inv#] [float] NULL,
	[Inv Date] [float] NULL,
	[Rebate EA] [money] NULL,
	[Qty] [float] NULL,
	[RTRAMT1] [money] NULL,
	[Positive Rebate Amount] [money] NULL,
	[Rebate Sales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoldenPlainsSlsJan2018]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoldenPlainsSlsJan2018](
	[IDSROM] [nvarchar](255) NULL,
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
	[Calc Gross less Disc] [money] NULL,
	[Variance] [money] NULL,
	[Inv Date] [nvarchar](255) NULL,
	[Inv #] [nvarchar](255) NULL,
	[Ord Cls] [nvarchar](255) NULL,
	[Admin Grp] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesDirectory]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDirectory](
	[PMID] [int] NULL,
	[AccountName] [varchar](150) NULL,
	[Email] [varchar](255) NULL,
	[OwnerName] [varchar](200) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[MailAddr1] [varchar](100) NULL,
	[MailCity] [varchar](50) NULL,
	[MailState] [varchar](2) NULL,
	[STATE_Hayes] [nvarchar](255) NULL,
	[STATE2_Hayes] [nvarchar](255) NULL,
	[CITY_Hayes] [nvarchar](255) NULL,
	[CITY2_Hayes] [nvarchar](255) NULL,
	[Name_Hayes] [nvarchar](255) NULL,
	[MAIL_Hayes] [nvarchar](255) NULL,
	[FAX_Hayes] [nvarchar](255) NULL,
	[PHONE_Hayes] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_FAX] [real] NULL,
	[_Similarity_PHONE] [real] NULL,
	[_Similarity_MailAddr1] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_City] [real] NULL,
	[_Similarity_MailState] [real] NULL,
	[_Similarity_MailCity] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesDirectory_AddrAndName]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDirectory_AddrAndName](
	[PMID] [int] NULL,
	[AccountName] [varchar](150) NULL,
	[Email] [varchar](255) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Fax] [varchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[NAME_Hayes] [nvarchar](255) NULL,
	[CITY_Hayes] [nvarchar](255) NULL,
	[STATE_Hayes] [nvarchar](255) NULL,
	[ADDRESS_Hayes] [nvarchar](255) NULL,
	[MAIL_Hayes] [nvarchar](255) NULL,
	[FAX_Hayes] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_Addr1] [real] NULL,
	[_Similarity_City] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_Fax] [real] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesDirectory_FuzzyMatch]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDirectory_FuzzyMatch](
	[PMID] [int] NULL,
	[AccountName] [varchar](150) NULL,
	[Email] [varchar](255) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Fax] [varchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[NAME_Hayes] [nvarchar](255) NULL,
	[CITY_Hayes] [nvarchar](255) NULL,
	[STATE_Hayes] [nvarchar](255) NULL,
	[ADDRESS_Hayes] [nvarchar](255) NULL,
	[MAIL_Hayes] [nvarchar](255) NULL,
	[FAX_Hayes] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_City] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_Fax] [real] NULL,
	[AccountDescription] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADCHPD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADCHPD123109](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADCHPD123109_0615]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADCHPD123109_0615](
	[UD #] [float] NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADCHPD123109mod]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADCHPD123109mod](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADMLPD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADMLPD123109](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD0701edit_070110]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD0701edit_070110](
	[UD #] [float] NULL,
	[PMID] [float] NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID1] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD0701rerun]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD0701rerun](
	[acct_no] [nvarchar](255) NULL,
	[vendor_id] [float] NULL,
	[vendorpair] [float] NULL,
	[vendor] [nvarchar](255) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[basispoints] [float] NULL,
	[MemberStatus] [nvarchar](255) NULL,
	[PercentageOfTotal] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPeffective] [nvarchar](255) NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [datetime] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[MonthsPaidFor] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD070610]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD070610](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD070610mod]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD070610mod](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD123109](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD123109_replaced0702]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD123109_replaced0702](
	[UD #] [float] NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD123109_used070210]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD123109_used070210](
	[UD #] [float] NULL,
	[PMID] [float] NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID1] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AADPD123109mod]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AADPD123109mod](
	[UD #] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL,
	[Basis Points] [float] NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_APIPD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_APIPD123109](
	[PMID] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand RX (Less brincr)] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_APIPD123109_v0615]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_APIPD123109_v0615](
	[PMID] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_APIPD123109_v0625]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_APIPD123109_v0625](
	[PMID] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand RX (Less brincr)] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_GR0510_Final]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GR0510_Final](
	[PMID] [nvarchar](255) NULL,
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
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import_GR0510_IPA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_GR0510_IPA](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[CA Store number] [nvarchar](255) NULL,
	[Generic Volume] [money] NULL,
	[Highest Tier achieved] [float] NULL,
	[Average Rebate] [float] NULL,
	[Generic Rebate] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_GR0510_Sales]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GR0510_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](128) NULL,
	[SourceSales] [money] NULL,
	[Rebate] [money] NULL,
	[AverageRebatePct] [float] NULL,
	[HRTA] [float] NULL,
	[Mailed to address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[Contact] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_merge_PD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109](
	[PPMID] [nvarchar](255) NULL,
	[PMID1] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand Rx-Brincr] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[PMID2] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[AVolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL,
	[TotalContributionAll] [float] NULL,
	[factor] [float] NULL,
	[PDividend] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_merge_PD123109_final_all]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109_final_all](
	[PPMID] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand Rx-Brincr] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[VolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL,
	[TotalContributionAll] [float] NULL,
	[factor] [float] NULL,
	[PDividend] [float] NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[chaincode] [int] NULL,
	[BothAPIandAAD] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_merge_PD123109_final_payonly]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109_final_payonly](
	[PPMID] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand Rx-Brincr] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[VolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL,
	[TotalContributionAll] [float] NULL,
	[factor] [float] NULL,
	[PDividend] [float] NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[chaincode] [int] NULL,
	[BothAPIandAAD] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_merge_PD123109_tmp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109_tmp](
	[PPMID] [nvarchar](255) NULL,
	[PMID1] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Brand Rx-Brincr] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[PMID2] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[AVolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_merge_PD123109_tmp_v0615]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109_tmp_v0615](
	[PPMID] [nvarchar](255) NULL,
	[PMID1] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[PMID2] [nvarchar](255) NULL,
	[ud #] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[AVolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_merge_PD123109_v0615]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_merge_PD123109_v0615](
	[PPMID] [nvarchar](255) NULL,
	[PMID1] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Date of Membership] [datetime] NULL,
	[Termination of Membership] [nvarchar](255) NULL,
	[Volume Included] [nvarchar](255) NULL,
	[Bs Cls] [nvarchar](255) NULL,
	[Cardinal Total Purchases] [money] NULL,
	[Volume Admin Fee] [money] NULL,
	[Validate Admin fee] [float] NULL,
	[Cardinal Source Purchases] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[Validate Generic Admin] [float] NULL,
	[Brand RX- warehouse] [money] NULL,
	[Gross Margin on brand] [money] NULL,
	[Validate GM on Brand] [float] NULL,
	[Generics- warehouse] [money] NULL,
	[Gross Margin on generics] [money] NULL,
	[Validate GM on Generics] [float] NULL,
	[Brand Credits Pd-Neg] [money] NULL,
	[Total Contribution API] [money] NULL,
	[PMID2] [nvarchar](255) NULL,
	[ud #] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[AVolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL,
	[TotalContributionAll] [float] NULL,
	[factor] [float] NULL,
	[PDividend] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_payments_PD123109_v9]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_payments_PD123109_v9](
	[pmid] [nvarchar](255) NULL,
	[aap#] [nvarchar](255) NULL,
	[aapparentno] [varchar](20) NULL,
	[api#] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[accountname] [varchar](65) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[TotalContributionAll] [float] NULL,
	[PDividend] [float] NULL,
	[CorporateName] [varchar](100) NULL,
	[FedTaxID] [varchar](12) NULL,
	[f_address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[email] [varchar](80) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_pivot_AADPD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_pivot_AADPD123109](
	[pmid] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL,
	[AVolumeTotalAAD] [numeric](20, 4) NULL,
	[RebateTotalAAD] [numeric](20, 4) NULL,
	[RebatePaidAAD] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_pivot_AADPD123109_tmp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_pivot_AADPD123109_tmp](
	[pmid] [nvarchar](255) NULL,
	[ud #] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [nvarchar](255) NULL,
	[VolumeCH] [numeric](19, 4) NULL,
	[RebateCH] [numeric](19, 4) NULL,
	[BasisPointsCH] [float] NULL,
	[VolumeML] [numeric](19, 4) NULL,
	[RebateML] [numeric](19, 4) NULL,
	[BasisPointsML] [float] NULL,
	[Months Paid For] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndexingGenRebate]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexingGenRebate](
	[GRID] [int] NULL,
	[FILEID] [int] NULL,
	[DC_NUM] [int] NULL,
	[WHOLESALER_ACCT] [int] NULL,
	[UD_ACCT] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[APPLY_DT] [datetime] NULL,
	[ADJUSTMENT_DT] [datetime] NULL,
	[REBATE_PERCENT] [numeric](3, 3) NULL,
	[GEN_VOL_AMT] [numeric](11, 2) NULL,
	[RX_VOL_AMT] [numeric](11, 2) NULL,
	[SUBMITTED_REBATE_AMT] [numeric](12, 2) NULL,
	[PAYBACK_PERCENT] [numeric](4, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[joncopeland]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[joncopeland](
	[Pharmacy Master Record] [int] NULL,
	[UD_ACCT_NO] [varchar](20) NULL,
	[AAP_ACCT_NO] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[TAX ID] [varchar](12) NULL,
	[API_ACCOUNT_NO] [varchar](20) NULL,
	[NAME] [varchar](65) NULL,
	[ADDR1] [varchar](80) NULL,
	[ADDR2] [varchar](80) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [varchar](2) NULL,
	[ZIP] [varchar](10) NULL,
	[EFFECTIVE NOT PREVIOUS API] [datetime] NULL,
	[UD START DATE] [datetime] NULL,
	[UD QUIT DATE] [datetime] NULL,
	[CARDINAL ADMIN FEES] [numeric](14, 2) NULL,
	[MIAMI LUKEN ADMIN FEES] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Load_Description]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Load_Description](
	[load_type_id] [int] NOT NULL,
	[load_description] [nvarchar](50) NULL,
	[load_frequency] [nvarchar](50) NULL,
 CONSTRAINT [PK_Load_Description] PRIMARY KEY CLUSTERED 
(
	[load_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Load_Log]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Load_Log](
	[load_type_id] [int] NULL,
	[data_date] [datetime] NOT NULL,
	[load_date] [datetime] NOT NULL,
	[filename] [varchar](255) NULL,
	[type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M2QY]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M2QY](
	[date] [datetime] NULL,
	[ycal] [int] NULL,
	[yfy] [int] NULL,
	[qcal] [int] NULL,
	[qfy] [int] NULL,
	[mcal] [int] NULL,
	[mfy] [int] NULL,
	[qscal] [nvarchar](6) NULL,
	[qsfy] [nvarchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertype]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype](
	[acct_no] [varchar](5) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertype_all]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype_all](
	[acct_no] [varchar](5) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[resigned] [varchar](1) NULL,
	[chain_code] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertype_all_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype_all_bkp_del](
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[resigned] [varchar](1) NULL,
	[chain_code] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertype_all_test_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype_all_test_del](
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[resigned] [varchar](1) NULL,
	[chain_code] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertype_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype_bkp_del](
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membertype_test_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membertype_test_del](
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missy_Mail_temp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missy_Mail_temp_del](
	[NANUM] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL,
	[NANAME] [nvarchar](255) NULL,
	[NAADR1] [nvarchar](255) NULL,
	[NAADR2] [nvarchar](255) NULL,
	[NAADR4] [nvarchar](255) NULL,
	[BUSCLS] [nvarchar](255) NULL,
	[CONTACT] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[NABP] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_Provider]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_Provider](
	[PROVIDER_ID] [int] NULL,
	[LOC_CONTACT_ID] [int] NULL,
	[NCPDP] [varchar](9) NULL,
	[BUSINESS_NAME] [varchar](60) NULL,
	[NAME] [varchar](60) NULL,
	[STORE_NUMBER] [varchar](10) NULL,
	[MSA] [varchar](4) NULL,
	[PMSA] [varchar](4) NULL,
	[HOURS] [varchar](35) NULL,
	[VOTING_DISTRICT] [varchar](4) NULL,
	[OPEN_DT] [datetime] NULL,
	[CLOSE_DT] [datetime] NULL,
	[DISPENSER_CLASS_CODE] [char](2) NULL,
	[CONTACT_ID] [int] NULL,
	[MEDICARE_PROVIDER_ID] [varchar](10) NULL,
	[NPI] [varchar](10) NULL,
	[DEA] [varchar](12) NULL,
	[EIN] [varchar](15) NULL,
	[STATE_LIC] [varchar](20) NULL,
	[STATE_TAX_ID] [varchar](15) NULL,
	[DELETE_DT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPDP_ProviderRelationship]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ProviderRelationship](
	[PROVIDER_RELATIONSHIP_ID] [int] NULL,
	[RELATIONSHIP_ID] [varchar](3) NULL,
	[PROVIDER_ID] [int] NULL,
	[PAYMENT_CTR_ID] [numeric](6, 0) NULL,
	[EFF_START_DT] [datetime] NULL,
	[EFF_THROUGH_DT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NDC_DOWNLOAD_MASTER_ALL_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDC_DOWNLOAD_MASTER_ALL_del](
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [nvarchar](50) NULL,
	[TRx Quantity Dispensed] [nvarchar](50) NULL,
	[Total  AWP] [nvarchar](50) NULL,
	[Patient Paid Amount] [nvarchar](50) NULL,
	[Total Paid Amount] [nvarchar](50) NULL,
	[Dispensing Fee Amount] [nvarchar](50) NULL,
	[Total Ingredient Cost] [nvarchar](50) NULL,
	[Usual Customary Amount] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NDCList]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDCList](
	[Store] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[UPC #] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[SumOfQuantity] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewMembers_November15]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewMembers_November15](
	[Eff# Date] [datetime] NULL,
	[TM] [float] NULL,
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewMembers_October15]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewMembers_October15](
	[Eff# Date] [datetime] NULL,
	[TM] [float] NULL,
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newvol_pivot]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newvol_pivot](
	[acct_no] [varchar](4) NULL,
	[dt] [datetime] NULL,
	[vendor_id] [int] NULL,
	[volume] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewVolume]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewVolume](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newvolumehybrid]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newvolumehybrid](
	[VOLUMEHYBRID_ID] [int] IDENTITY(1,1) NOT NULL,
	[ACCT_NO] [varchar](50) NULL,
	[DEA] [varchar](50) NULL,
	[CARDVOLUME_M1] [numeric](14, 2) NULL,
	[CARDVOLUME_M2] [numeric](14, 2) NULL,
	[CARDVOLUME_M3] [numeric](14, 2) NULL,
	[ANDAVOLUME_M1] [numeric](14, 2) NULL,
	[ANDAVOLUME_M2] [numeric](14, 2) NULL,
	[ANDAVOLUME_M3] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M1] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M2] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M3] [numeric](14, 2) NULL,
	[CARDVOLUME_AVG] [numeric](14, 2) NULL,
	[ANDAVOLUME_SUM] [numeric](14, 0) NULL,
	[PARMEDVOLUME_SUM] [numeric](14, 2) NULL,
	[GENERICCOMPLIANCE] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[No Matches]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[No Matches](
	[PMID] [nvarchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[ASW NCPDP] [nvarchar](255) NULL,
	[PM NCPDP] [nvarchar](255) NULL,
	[F6] [nvarchar](255) NULL,
	[F7] [nvarchar](255) NULL,
	[F8] [nvarchar](255) NULL,
	[F9] [nvarchar](255) NULL,
	[F10] [nvarchar](255) NULL,
	[F11] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL,
	[F13] [nvarchar](255) NULL,
	[F14] [nvarchar](255) NULL,
	[F15] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[F26] [nvarchar](255) NULL,
	[F27] [nvarchar](255) NULL,
	[F28] [nvarchar](255) NULL,
	[F29] [nvarchar](255) NULL,
	[F30] [nvarchar](255) NULL,
	[F31] [nvarchar](255) NULL,
	[F32] [nvarchar](255) NULL,
	[F33] [nvarchar](255) NULL,
	[F34] [nvarchar](255) NULL,
	[F35] [nvarchar](255) NULL,
	[F36] [nvarchar](255) NULL,
	[F37] [nvarchar](255) NULL,
	[F38] [nvarchar](255) NULL,
	[F39] [nvarchar](255) NULL,
	[F40] [nvarchar](255) NULL,
	[F41] [nvarchar](255) NULL,
	[F42] [nvarchar](255) NULL,
	[F43] [nvarchar](255) NULL,
	[F44] [nvarchar](255) NULL,
	[F45] [nvarchar](255) NULL,
	[F46] [nvarchar](255) NULL,
	[F47] [nvarchar](255) NULL,
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
	[F72] [nvarchar](255) NULL,
	[F73] [nvarchar](255) NULL,
	[F74] [nvarchar](255) NULL,
	[F75] [nvarchar](255) NULL,
	[F76] [nvarchar](255) NULL,
	[F77] [nvarchar](255) NULL,
	[F78] [nvarchar](255) NULL,
	[F79] [nvarchar](255) NULL,
	[F80] [nvarchar](255) NULL,
	[F81] [nvarchar](255) NULL,
	[F82] [nvarchar](255) NULL,
	[F83] [nvarchar](255) NULL,
	[F84] [nvarchar](255) NULL,
	[F85] [nvarchar](255) NULL,
	[F86] [nvarchar](255) NULL,
	[F87] [nvarchar](255) NULL,
	[F88] [nvarchar](255) NULL,
	[F89] [nvarchar](255) NULL,
	[F90] [nvarchar](255) NULL,
	[F91] [nvarchar](255) NULL,
	[F92] [nvarchar](255) NULL,
	[F93] [nvarchar](255) NULL,
	[F94] [nvarchar](255) NULL,
	[F95] [nvarchar](255) NULL,
	[F96] [nvarchar](255) NULL,
	[F97] [nvarchar](255) NULL,
	[F98] [nvarchar](255) NULL,
	[F99] [nvarchar](255) NULL,
	[F100] [nvarchar](255) NULL,
	[F101] [nvarchar](255) NULL,
	[F102] [nvarchar](255) NULL,
	[F103] [nvarchar](255) NULL,
	[F104] [nvarchar](255) NULL,
	[F105] [nvarchar](255) NULL,
	[F106] [nvarchar](255) NULL,
	[F107] [nvarchar](255) NULL,
	[F108] [nvarchar](255) NULL,
	[F109] [nvarchar](255) NULL,
	[F110] [nvarchar](255) NULL,
	[F111] [nvarchar](255) NULL,
	[F112] [nvarchar](255) NULL,
	[F113] [nvarchar](255) NULL,
	[F114] [nvarchar](255) NULL,
	[F115] [nvarchar](255) NULL,
	[F116] [nvarchar](255) NULL,
	[F117] [nvarchar](255) NULL,
	[F118] [nvarchar](255) NULL,
	[F119] [nvarchar](255) NULL,
	[F120] [nvarchar](255) NULL,
	[F121] [nvarchar](255) NULL,
	[F122] [nvarchar](255) NULL,
	[F123] [nvarchar](255) NULL,
	[F124] [nvarchar](255) NULL,
	[F125] [nvarchar](255) NULL,
	[F126] [nvarchar](255) NULL,
	[F127] [nvarchar](255) NULL,
	[F128] [nvarchar](255) NULL,
	[F129] [nvarchar](255) NULL,
	[F130] [nvarchar](255) NULL,
	[F131] [nvarchar](255) NULL,
	[F132] [nvarchar](255) NULL,
	[F133] [nvarchar](255) NULL,
	[F134] [nvarchar](255) NULL,
	[F135] [nvarchar](255) NULL,
	[F136] [nvarchar](255) NULL,
	[F137] [nvarchar](255) NULL,
	[F138] [nvarchar](255) NULL,
	[F139] [nvarchar](255) NULL,
	[F140] [nvarchar](255) NULL,
	[F141] [nvarchar](255) NULL,
	[F142] [nvarchar](255) NULL,
	[F143] [nvarchar](255) NULL,
	[F144] [nvarchar](255) NULL,
	[F145] [nvarchar](255) NULL,
	[F146] [nvarchar](255) NULL,
	[F147] [nvarchar](255) NULL,
	[F148] [nvarchar](255) NULL,
	[F149] [nvarchar](255) NULL,
	[F150] [nvarchar](255) NULL,
	[F151] [nvarchar](255) NULL,
	[F152] [nvarchar](255) NULL,
	[F153] [nvarchar](255) NULL,
	[F154] [nvarchar](255) NULL,
	[F155] [nvarchar](255) NULL,
	[F156] [nvarchar](255) NULL,
	[F157] [nvarchar](255) NULL,
	[F158] [nvarchar](255) NULL,
	[F159] [nvarchar](255) NULL,
	[F160] [nvarchar](255) NULL,
	[F161] [nvarchar](255) NULL,
	[F162] [nvarchar](255) NULL,
	[F163] [nvarchar](255) NULL,
	[F164] [nvarchar](255) NULL,
	[F165] [nvarchar](255) NULL,
	[F166] [nvarchar](255) NULL,
	[F167] [nvarchar](255) NULL,
	[F168] [nvarchar](255) NULL,
	[F169] [nvarchar](255) NULL,
	[F170] [nvarchar](255) NULL,
	[F171] [nvarchar](255) NULL,
	[F172] [nvarchar](255) NULL,
	[F173] [nvarchar](255) NULL,
	[F174] [nvarchar](255) NULL,
	[F175] [nvarchar](255) NULL,
	[F176] [nvarchar](255) NULL,
	[F177] [nvarchar](255) NULL,
	[F178] [nvarchar](255) NULL,
	[F179] [nvarchar](255) NULL,
	[F180] [nvarchar](255) NULL,
	[F181] [nvarchar](255) NULL,
	[F182] [nvarchar](255) NULL,
	[F183] [nvarchar](255) NULL,
	[F184] [nvarchar](255) NULL,
	[F185] [nvarchar](255) NULL,
	[F186] [nvarchar](255) NULL,
	[F187] [nvarchar](255) NULL,
	[F188] [nvarchar](255) NULL,
	[F189] [nvarchar](255) NULL,
	[F190] [nvarchar](255) NULL,
	[F191] [nvarchar](255) NULL,
	[F192] [nvarchar](255) NULL,
	[F193] [nvarchar](255) NULL,
	[F194] [nvarchar](255) NULL,
	[F195] [nvarchar](255) NULL,
	[F196] [nvarchar](255) NULL,
	[F197] [nvarchar](255) NULL,
	[F198] [nvarchar](255) NULL,
	[F199] [nvarchar](255) NULL,
	[F200] [nvarchar](255) NULL,
	[F201] [nvarchar](255) NULL,
	[F202] [nvarchar](255) NULL,
	[F203] [nvarchar](255) NULL,
	[F204] [nvarchar](255) NULL,
	[F205] [nvarchar](255) NULL,
	[F206] [nvarchar](255) NULL,
	[F207] [nvarchar](255) NULL,
	[F208] [nvarchar](255) NULL,
	[F209] [nvarchar](255) NULL,
	[F210] [nvarchar](255) NULL,
	[F211] [nvarchar](255) NULL,
	[F212] [nvarchar](255) NULL,
	[F213] [nvarchar](255) NULL,
	[F214] [nvarchar](255) NULL,
	[F215] [nvarchar](255) NULL,
	[F216] [nvarchar](255) NULL,
	[F217] [nvarchar](255) NULL,
	[F218] [nvarchar](255) NULL,
	[F219] [nvarchar](255) NULL,
	[F220] [nvarchar](255) NULL,
	[F221] [nvarchar](255) NULL,
	[F222] [nvarchar](255) NULL,
	[F223] [nvarchar](255) NULL,
	[F224] [nvarchar](255) NULL,
	[F225] [nvarchar](255) NULL,
	[F226] [nvarchar](255) NULL,
	[F227] [nvarchar](255) NULL,
	[F228] [nvarchar](255) NULL,
	[F229] [nvarchar](255) NULL,
	[F230] [nvarchar](255) NULL,
	[F231] [nvarchar](255) NULL,
	[F232] [nvarchar](255) NULL,
	[F233] [nvarchar](255) NULL,
	[F234] [nvarchar](255) NULL,
	[F235] [nvarchar](255) NULL,
	[F236] [nvarchar](255) NULL,
	[F237] [nvarchar](255) NULL,
	[F238] [nvarchar](255) NULL,
	[F239] [nvarchar](255) NULL,
	[F240] [nvarchar](255) NULL,
	[F241] [nvarchar](255) NULL,
	[F242] [nvarchar](255) NULL,
	[F243] [nvarchar](255) NULL,
	[F244] [nvarchar](255) NULL,
	[F245] [nvarchar](255) NULL,
	[F246] [nvarchar](255) NULL,
	[F247] [nvarchar](255) NULL,
	[F248] [nvarchar](255) NULL,
	[F249] [nvarchar](255) NULL,
	[F250] [nvarchar](255) NULL,
	[F251] [nvarchar](255) NULL,
	[F252] [nvarchar](255) NULL,
	[F253] [nvarchar](255) NULL,
	[F254] [nvarchar](255) NULL,
	[F255] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nov16NewMems]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nov16NewMems](
	[Eff# Date] [datetime] NULL,
	[TM] [float] NULL,
	[AAP #] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[City ] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[M or S] [nvarchar](255) NULL,
	[Average Mthly Vol] [float] NULL,
	[Whslr  (CAH    or ML)] [nvarchar](255) NULL,
	[*Exist, Comp or New] [nvarchar](255) NULL,
	[New Mem] [float] NULL,
	[Satellite Location] [float] NULL,
	[Existing PVA Customer] [nvarchar](255) NULL,
	[Affiliate] [datetime] NULL,
	[Exist API Whse Cust] [float] NULL,
	[New Whse] [float] NULL,
	[New MC] [nvarchar](255) NULL,
	[Change of ownership] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[TM Cold Call] [float] NULL,
	[CAH Rep] [float] NULL,
	[Web Inquiry] [nvarchar](255) NULL,
	[Phone In Inquiry] [nvarchar](255) NULL,
	[Current WH Cust ] [float] NULL,
	[Mem Referral ] [nvarchar](255) NULL,
	[Identiiy…] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[November2009Sales]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[November2009Sales](
	[Cust#] [nvarchar](11) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item] [nvarchar](35) NULL,
	[Group] [nvarchar](5) NULL,
	[Desc] [nvarchar](30) NULL,
	[Qty] [decimal](15, 3) NULL,
	[Sales Price] [decimal](17, 4) NULL,
	[Ext Sales] [float] NULL,
	[Inv Date] [decimal](8, 0) NULL,
	[Inv #] [decimal](7, 0) NULL,
	[Ord Cls] [nvarchar](2) NULL,
	[Admin Grp] [nvarchar](6) NULL,
	[Smn] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[October2009Sales]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[October2009Sales](
	[Cust#] [nvarchar](11) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item] [nvarchar](35) NULL,
	[Group] [nvarchar](5) NULL,
	[Desc] [nvarchar](30) NULL,
	[Qty] [decimal](15, 3) NULL,
	[Sales Price] [decimal](17, 4) NULL,
	[Ext Sales] [float] NULL,
	[Inv Date] [decimal](8, 0) NULL,
	[Inv #] [decimal](7, 0) NULL,
	[Ord Cls] [nvarchar](2) NULL,
	[Admin Grp] [nvarchar](6) NULL,
	[Smn] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OLE DB Destination]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLE DB Destination](
	[Parent] [nvarchar](255) NULL,
	[Aff#] [float] NULL,
	[DC] [float] NULL,
	[Acct#] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Master#] [float] NULL,
	[AAP Member Start Date] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Store#] [float] NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Exp] [datetime] NULL,
	[SBOP] [float] NULL,
	[SBOP Exp] [datetime] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Date Documentation Sent to CCDB] [datetime] NULL,
	[New AAP Affiliation] [float] NULL,
	[New Rx COGs] [float] NULL,
	[New Store Number] [nvarchar](255) NULL,
	[Committed Volume] [money] NULL,
	[Terms] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[Name] [varchar](255) NULL,
	[Derived Column 1] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Sample]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Sample](
	[order_id] [int] NULL,
	[order_date] [date] NULL,
	[customer_name] [varchar](250) NULL,
	[city] [varchar](100) NULL,
	[order_amount] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OurStoreList_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OurStoreList_del](
	[NCPDP] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OurStoreListNew_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OurStoreListNew_del](
	[NABP] [varchar](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parmed sales may 2008_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parmed sales may 2008_del](
	[UD Acct #] [nvarchar](50) NULL,
	[Segment] [nvarchar](50) NULL,
	[ParMed #] [nvarchar](50) NULL,
	[Customer Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[2nd Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Total Sales] [numeric](15, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerCategory]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCategory](
	[PARTNER_CATEGORY_ID] [int] NULL,
	[CATEGORY] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatDiv2016]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatDiv2016](
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
	[MC Contribution] [float] NULL,
	[ML Admin Fee] [float] NULL,
	[HIGH VOL INCENTIVE] [nvarchar](255) NULL,
	[AAP PVA Vol Admin Fee] [float] NULL,
	[AAP PVA Vol Admin Fee Retained] [float] NULL,
	[AAP PVA Gen Admin Fee] [float] NULL,
	[AAP PVA Gen Admin Fee Retained] [float] NULL,
	[Cardinal Annual Rebate] [float] NULL,
	[Subtotal Cardinal] [float] NULL,
	[Cardinal Upfront Admin] [float] NULL,
	[Cardinal, HV Total] [float] NULL,
	[AAP Parent Contribution] [float] NULL,
	[WH Brand Year] [float] NULL,
	[WH Gen Year] [float] NULL,
	[WH Gen Contribution] [float] NULL,
	[WH OTC Year] [float] NULL,
	[MC, Cardinal and API Whse Contribution] [float] NULL,
	[Prelim Allocation] [float] NULL,
	[Under $15 deleted] [float] NULL,
	[Final Allocation] [float] NULL,
	[Half of Allocation] [float] NULL,
	[Payment Method] [nvarchar](255) NULL,
	[Check Process Charge] [float] NULL,
	[First Payment] [float] NULL,
	[Second Payment] [float] NULL,
	[Total to be paid] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatDiv2016_HVI]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatDiv2016_HVI](
	[PMID] [float] NULL,
	[HIGH VOL INCENTIVE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payee]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payee](
	[PAYEE_ID] [int] NULL,
	[ACCOUNT_ID] [char](12) NULL,
	[NABP] [char](7) NULL,
	[STATUS] [char](1) NULL,
	[STORE_NAME] [varchar](50) NULL,
	[STORE_STREET] [varchar](50) NULL,
	[STORE_POBOX] [varchar](25) NULL,
	[STORE_CITY] [varchar](25) NULL,
	[STORE_STATE] [varchar](2) NULL,
	[STORE_ZIP] [varchar](10) NULL,
	[STORE_PHONE] [varchar](14) NULL,
	[STORE_FAX] [varchar](14) NULL,
	[CHECK_NAME] [varchar](50) NULL,
	[CHECK_STREET] [varchar](50) NULL,
	[CHECK_POBOX] [varchar](25) NULL,
	[CHECK_CITY] [varchar](25) NULL,
	[CHECK_STATE] [varchar](2) NULL,
	[CHECK_ZIP] [varchar](10) NULL,
	[CHECK_PHONE] [varchar](14) NULL,
	[CHECK_FAX] [varchar](14) NULL,
	[EFF_DT] [datetime] NULL,
	[QUIT_DT] [datetime] NULL,
	[NPP_PHARM] [smallint] NULL,
	[SUBCON_PHARM] [smallint] NULL,
	[NON_UD] [smallint] NULL,
	[EMAIL] [varchar](120) NULL,
	[DEA] [varchar](10) NULL,
	[ACTIVE_PAYEE] [int] NULL,
	[SENDER_ID] [varchar](15) NULL,
	[RECEIVER_ID] [varchar](15) NULL,
	[FED_TAX_ID] [varchar](12) NULL,
	[FTP_ACCT] [varchar](32) NULL,
	[NPI] [varchar](10) NULL,
	[EMAIL_NOTIFY] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDOD_ADMINFEEDETAILv4$]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDOD_ADMINFEEDETAILv4$](
	[acct_no] [nvarchar](255) NULL,
	[vendor_id] [float] NULL,
	[vendorpair] [float] NULL,
	[vendor] [nvarchar](255) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[basispoints] [float] NULL,
	[MemberStatus] [nvarchar](255) NULL,
	[PercentageOfTotal] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPeffective] [nvarchar](255) NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [datetime] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[MonthsPaidFor] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDOD_Detail]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDOD_Detail](
	[acct_no] [nvarchar](4) NULL,
	[vendor_id] [int] NULL,
	[vendorpair] [int] NULL,
	[vendor] [nvarchar](64) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[WSVolume] [float] NULL,
	[WSAdminFees] [float] NULL,
	[GenRebate] [float] NULL,
	[CRFactor] [float] NULL,
	[CR90] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PDOD_Totals]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDOD_Totals](
	[acct_no] [nvarchar](4) NULL,
	[store] [nvarchar](35) NULL,
	[city] [nvarchar](20) NULL,
	[state] [nvarchar](2) NULL,
	[nsterritory] [nvarchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[eligible] [smallint] NULL,
	[NonWSRebate] [float] NULL,
	[CRFactor] [float] NULL,
	[CR90] [float] NULL,
	[NonWSVolume] [float] NULL,
	[GenRebate] [float] NULL,
	[WSAdminFees] [float] NULL,
	[ContributionPercentage] [float] NULL,
	[ProfitDistributionFactor] [float] NULL,
	[ProfitDistribution90] [float] NULL,
	[WSRXSales] [money] NULL,
	[WSGenericSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[NewCustomerDiscount] [money] NULL,
	[ConversionDiscount] [money] NULL,
	[AutoSubstitution] [money] NULL,
	[CurrentCustomerDiscount] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhysiciansEntireList]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysiciansEntireList](
	[Practice] [varchar](500) NULL,
	[Address] [varchar](500) NULL,
	[Address2] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[Zip] [varchar](500) NULL,
	[County] [varchar](500) NULL,
	[Phone] [varchar](500) NULL,
	[Fax] [varchar](500) NULL,
	[First Name] [varchar](500) NULL,
	[Last Name] [varchar](500) NULL,
	[Full Name] [varchar](500) NULL,
	[Email] [varchar](500) NULL,
	[Gender] [varchar](500) NULL,
	[Title] [varchar](500) NULL,
	[Specialty] [varchar](500) NULL,
	["SIC Code"] [varchar](500) NULL,
	[Employees] [varchar](500) NULL,
	[Sales] [varchar](500) NULL,
	[Latitude] [varchar](500) NULL,
	[Longitude] [varchar](500) NULL,
	[Website] [varchar](500) NULL,
	[Sq Footage] [varchar](500) NULL,
	[LocationAddress] [varchar](500) NULL,
	[Specialty 2] [varchar](500) NULL,
	[Specialty 3] [varchar](500) NULL,
	[Specialty 4] [varchar](500) NULL,
	[Specialty 5] [varchar](500) NULL,
	[NPI] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhysiciansList_112217]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysiciansList_112217](
	[EMAIL] [nvarchar](255) NULL,
	[FIRST] [nvarchar](255) NULL,
	[LAST] [nvarchar](255) NULL,
	[COMPANY] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[JOBTITLE] [nvarchar](255) NULL,
	[MED_TYPE] [nvarchar](255) NULL,
	[GENDER] [nvarchar](255) NULL,
	[EMPLOYEES] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhysiciansList_MembersApproved]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhysiciansList_MembersApproved](
	[PMID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pivot_AADPD123109]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pivot_AADPD123109](
	[PMID] [nvarchar](255) NULL,
	[UD #] [float] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[AAPEffective] [datetime] NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [nvarchar](255) NULL,
	[UDQuit] [nvarchar](255) NULL,
	[Months Paid For] [float] NULL,
	[VolumeCH] [int] NOT NULL,
	[RebateCH] [int] NOT NULL,
	[BasisPointsCH] [int] NOT NULL,
	[VolumeML] [int] NOT NULL,
	[RebateML] [int] NOT NULL,
	[BasisPointsML] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDetails]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDetails](
	[PLAN_ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[BIN_NUM] [char](6) NULL,
	[PROC_ID] [varchar](20) NULL,
	[STREET] [varchar](50) NULL,
	[PO_BOX] [varchar](50) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [varchar](10) NULL,
	[PHONE] [varchar](15) NULL,
	[FAX] [varchar](15) NULL,
	[CONTACT] [varchar](30) NULL,
	[BANK] [varchar](20) NULL,
	[BRANCH] [varchar](20) NULL,
	[ACCOUNT] [varchar](20) NULL,
	[ABBREVIATION] [varchar](30) NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanDetails_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanDetails_del](
	[PLAN_ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[BIN_NUM] [char](6) NULL,
	[PROC_ID] [varchar](20) NULL,
	[STREET] [varchar](50) NULL,
	[PO_BOX] [varchar](50) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [varchar](10) NULL,
	[PHONE] [varchar](15) NULL,
	[FAX] [varchar](15) NULL,
	[CONTACT] [varchar](30) NULL,
	[BANK] [varchar](20) NULL,
	[BRANCH] [varchar](20) NULL,
	[ACCOUNT] [varchar](20) NULL,
	[ABBREVIATION] [varchar](30) NULL,
	[PAYEE_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanOGram2016_AddPMID]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanOGram2016_AddPMID](
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[AAP ID] [float] NULL,
	[API ID] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanOGram2016_wPMID]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanOGram2016_wPMID](
	[PMID] [float] NULL,
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[AAP ID] [float] NULL,
	[API ID] [float] NULL,
	[FullName] [nvarchar](255) NULL,
	[Rebate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planograms]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planograms](
	[Territory_DO NOT USE] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Street 1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Main Phone] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[AAP #] [nvarchar](255) NULL,
	[AAP Effective] [datetime] NULL,
	[AAP Parent #] [nvarchar](255) NULL,
	[API #] [nvarchar](255) NULL,
	[Arete Network] [nvarchar](255) NULL,
	[Combined Volume] [float] NULL,
	[Primary Contact] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanOGrams2016]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanOGrams2016](
	[2015] [nvarchar](255) NULL,
	[2016] [nvarchar](255) NULL,
	[Account] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAP ID] [float] NULL,
	[API ID] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[2016 Rebate] [money] NULL,
	[2016 Delta %] [float] NULL,
	[2015 Rebate] [money] NULL,
	[2014 Rebate] [money] NULL,
	[2015 Delta %] [float] NULL,
	[2013 Rebate] [money] NULL,
	[%Delta] [float] NULL,
	[2012 Rebate] [money] NULL,
	[% Delta] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaOGram2017]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaOGram2017](
	[2017] [nvarchar](255) NULL,
	[2016] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Terr] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAP ID] [nvarchar](255) NULL,
	[API ID] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[2016 Rebate] [money] NULL,
	[2016 Delta %] [float] NULL,
	[2017 Rebate] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_pharmacy02042014]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_pharmacy02042014](
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
/****** Object:  Table [dbo].[pmid_list]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pmid_list](
	[PMID] [float] NULL,
	[CUSTOMER_NAME] [nvarchar](255) NULL,
	[Oct CAH Gen] [money] NULL,
	[Nov CAH Gen] [money] NULL,
	[Dec CAH Gen] [money] NULL,
	[Jan CAH Gen] [money] NULL,
	[Oct Actual CAH Gen] [money] NULL,
	[Nov Actual CAH Gen] [money] NULL,
	[Dec Actual CAH Gen] [money] NULL,
	[Jan Actual CAH Gen] [money] NULL,
	[Oct CAH Units] [float] NULL,
	[Nov CAH Units] [float] NULL,
	[Dec CAH Units] [float] NULL,
	[Jan CAH Units] [float] NULL,
	[Oct % Difference] [float] NULL,
	[Nov % Difference] [float] NULL,
	[Dec % Difference] [float] NULL,
	[Jan % Difference] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMIDList_2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMIDList_2](
	[PMID] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[ExecutiveEmail] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMIDList_ForTracie]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMIDList_ForTracie](
	[PMID] [float] NULL,
	[Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceFile_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceFile_del](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WholeSaler] [nvarchar](50) NULL,
	[seq] [int] NULL,
 CONSTRAINT [PK_WholeSaler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qrtrly_gen_rebate_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtrly_gen_rebate_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StoreName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Store] [nvarchar](50) NULL,
	[IsTotal] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[CCA] [nvarchar](50) NULL,
	[TotalRxSales] [nvarchar](50) NULL,
	[UnitedCCA] [nvarchar](50) NULL,
	[GenRebatePerc] [nvarchar](50) NULL,
	[GenRebateAmt] [nvarchar](50) NULL,
	[qtrEnd] [datetime] NULL,
 CONSTRAINT [PK_qrtrly_gen_rebate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RejectCodes_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RejectCodes_del](
	[Reject Code] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_baselineFY2008_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_baselineFY2008_del](
	[acct_no] [varchar](4) NULL,
	[ncpdp] [varchar](7) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[pwsname] [varchar](3) NOT NULL,
	[dec07] [numeric](14, 2) NULL,
	[jan08] [numeric](14, 2) NULL,
	[feb08] [numeric](14, 2) NULL,
	[mar08] [numeric](14, 2) NULL,
	[apr08] [numeric](14, 2) NULL,
	[may08] [numeric](14, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Anda0408] [numeric](15, 2) NULL,
	[Anda0508] [float] NULL,
	[AndaAvg] [float] NULL,
	[Parmed0508] [numeric](15, 2) NULL,
	[TotalAvg] [float] NULL,
	[owsvol] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_baselineFY2008_members_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_baselineFY2008_members_del](
	[acct_no] [varchar](4) NULL,
	[ncpdp] [varchar](7) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_NCDV_101613]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_NCDV_101613](
	[pharm id] [nvarchar](50) NULL,
	[number_of_rows] [int] NULL,
	[total_paid] [numeric](38, 3) NULL,
	[fee_paid] [numeric](38, 3) NULL,
	[cost_paid] [numeric](38, 3) NULL,
	[plan_amount] [numeric](38, 3) NULL,
	[min_rx_date] [datetime] NULL,
	[max_rx_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30attendeeoptinlist]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30attendeeoptinlist](
	[Company] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Email Address] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary State/Prov#] [nvarchar](255) NULL,
	[Primary Zip/Postal Code] [float] NULL,
	[Registration Type] [nvarchar](255) NULL,
	[Can we share your contact information with our Exhibitors/Sponso] [nvarchar](255) NULL,
	[Please select all that apply:] [nvarchar](255) NULL,
	[Please select whether you are a Prospect or Customer?] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30Load_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30Load_del](
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [datetime] NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 0) NULL,
	[Day Supply] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 3) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Plan Amount] [numeric](38, 3) NULL,
	[Co Pay Amount] [numeric](38, 3) NULL,
	[U and C] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[BS] [nvarchar](5) NULL,
	[BR] [nvarchar](5) NULL,
	[OI] [nvarchar](5) NULL,
	[DAW] [nvarchar](5) NULL,
	[DAW Desc] [nvarchar](50) NULL,
	[Patient Paid] [numeric](38, 3) NULL,
	[Gross Amt Due] [numeric](38, 3) NULL,
	[Bill Code] [nvarchar](10) NULL,
	[Rej Code] [nvarchar](10) NULL,
	[Message Response] [nvarchar](300) NULL,
	[Tx Response] [nvarchar](3) NULL,
	[Rx Nbr] [nvarchar](10) NULL,
	[RfNbr] [nvarchar](10) NULL,
	[PID_Q] [nvarchar](10) NULL,
	[PID] [nvarchar](50) NULL,
	[Doctor] [nvarchar](50) NULL,
	[RA] [nvarchar](10) NULL,
	[NDCWritten] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30MaxID_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30MaxID_del](
	[Rx Nbr] [nvarchar](10) NOT NULL,
	[RxID] [int] NULL,
 CONSTRAINT [PK_Rx30MaxID] PRIMARY KEY CLUSTERED 
(
	[Rx Nbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30Plans_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30Plans_del](
	[NABP] [nvarchar](50) NULL,
	[PlanID] [nvarchar](50) NULL,
	[PlanName] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30PMLast_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30PMLast_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RxId] [int] NULL,
	[Type] [int] NULL,
	[GeneratedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_Rx30PMGEN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30RejPM_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30RejPM_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RxNbr] [nvarchar](20) NOT NULL,
	[NCPDP] [nvarchar](15) NULL,
	[NDC] [nvarchar](20) NULL,
	[Fill_dt] [smalldatetime] NULL,
	[Bill_code] [nvarchar](20) NULL,
	[Drug_Name] [nvarchar](100) NULL,
	[Reject_Code] [nvarchar](10) NULL,
	[Reject_Text] [nvarchar](200) NULL,
	[RPH] [nvarchar](5) NULL,
	[Recovered_Amt] [numeric](10, 2) NULL,
	[Reject_Amt] [numeric](10, 2) NULL,
	[Recovery_Text] [nvarchar](300) NULL,
	[Complete] [int] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Complete_Dt] [smalldatetime] NULL,
	[UploadedOn] [datetime] NULL,
 CONSTRAINT [PK_Rx30RejPM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30Stores_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30Stores_del](
	[NABP] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProfitMinder] [int] NULL,
 CONSTRAINT [PK_Rx30Stores] PRIMARY KEY CLUSTERED 
(
	[NABP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30StoresLoad_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30StoresLoad_del](
	[NABP] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rx30UBPM_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30UBPM_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RxNbr] [nvarchar](20) NOT NULL,
	[NCPDP] [nvarchar](15) NULL,
	[NDC] [nvarchar](20) NULL,
	[Fill_dt] [smalldatetime] NULL,
	[Qty] [int] NULL,
	[Sale_Price] [numeric](10, 2) NULL,
	[Bill_code] [nvarchar](20) NULL,
	[Drug_Name] [nvarchar](100) NULL,
	[Recovered_Amt] [numeric](10, 2) NULL,
	[Recovery_Text] [nvarchar](300) NULL,
	[Complete] [int] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Complete_Dt] [smalldatetime] NULL,
	[UploadedOn] [datetime] NULL,
 CONSTRAINT [PK_Rx30UBPM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[AAP Top Generics Sell Price] [money] NULL,
	[AAP Top Generics Price Per Unit] [money] NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Color] [nvarchar](255) NULL,
	[NDC/UPC] [nvarchar](255) NULL,
	[CIN] [nvarchar](255) NULL,
	[DP#] [nvarchar](255) NULL,
	[GPI_ID] [nvarchar](255) NULL,
	[GCN] [nvarchar](255) NULL,
	[GCN SEQNO] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shelstorecount2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shelstorecount2_del](
	[ACCT_NO] [nvarchar](50) NULL,
	[STORE] [nvarchar](50) NULL,
	[NSTERRITORY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[EFFECTIVE] [nvarchar](50) NULL,
	[QUITDATE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SLX2USM_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLX2USM_del](
	[accountid] [nvarchar](50) NULL,
	[udacctno] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[snapshot_usm_territories_110509_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[snapshot_usm_territories_110509_del](
	[acct_no] [varchar](4) NULL,
	[nabp] [varchar](7) NULL,
	[nsterritory] [varchar](2) NULL,
	[mdmterritory] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreMember]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreMember](
	[WHYMODIFIED] [varchar](100) NULL,
	[CORPNAME] [varchar](50) NULL,
	[DBA] [varchar](50) NULL,
	[STORE] [varchar](65) NULL,
	[MEMSTORE] [varchar](25) NULL,
	[GROUP] [varchar](25) NULL,
	[NON-PHARMACY] [varchar](1) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[ADDR1] [varchar](60) NULL,
	[ADDR2] [varchar](60) NULL,
	[CITY] [varchar](20) NULL,
	[COUNTY] [varchar](50) NULL,
	[STATE] [varchar](2) NULL,
	[ZIP] [varchar](9) NULL,
	[ATTEND] [varchar](2) NULL,
	[COUNCIL] [varchar](20) NULL,
	[COUNCIL NAME] [varchar](30) NULL,
	[AREACODE] [varchar](3) NULL,
	[PHONE1] [varchar](8) NULL,
	[EMERGENCY PHONE] [varchar](15) NULL,
	[FAXAREACODE] [varchar](3) NULL,
	[FAX] [varchar](8) NULL,
	[EMAILADDRESS] [varchar](40) NULL,
	[WEBADDRESS] [varchar](50) NULL,
	[CONTACT_F] [varchar](16) NULL,
	[CONTACT_L] [varchar](20) NULL,
	[CONTACT PERSON'S TITLE] [varchar](20) NULL,
	[BoardOfDirectors] [varchar](50) NULL,
	[OFFICERS/YEAR] [varchar](50) NULL,
	[BOARD POSITION] [varchar](50) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[MDMTERRITORY] [varchar](2) NULL,
	[RESIGNED] [varchar](1) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[FEE_PD] [smallint] NULL,
	[NPP_MBR] [smallint] NULL,
	[FOREIGN_GRP] [varchar](50) NULL,
	[FEDID] [varchar](12) NULL,
	[DEA] [varchar](10) NULL,
	[STATE MED #] [varchar](15) NULL,
	[RURAL] [smallint] NULL,
	[STATE LIC #] [varchar](15) NULL,
	[ON CALL] [varchar](5) NULL,
	[OBRA 90] [varchar](5) NULL,
	[COUNSELING AREA] [varchar](5) NULL,
	[PATIENT MR] [varchar](5) NULL,
	[DRUG INFORMATION] [varchar](5) NULL,
	[FRAUD?] [varchar](1) NULL,
	[FRD_FEL_EXPLAN] [varchar](50) NULL,
	[RX LICENSE SUS/REV] [varchar](5) NULL,
	[SUS_REV_EXPLAN] [varchar](50) NULL,
	[UNRESTRICTED LIC] [varchar](5) NULL,
	[UNRES_LIC_EXPLAN] [varchar](50) NULL,
	[INV/SANC BY MEDICARE] [varchar](5) NULL,
	[JUDGEMENTS] [varchar](5) NULL,
	[COMPLY WITH ADA ACT] [varchar](5) NULL,
	[UAI COVERAGE] [smallint] NULL,
	[PROF LIAB INS] [varchar](5) NULL,
	[PROF LIAB CARRIER] [varchar](30) NULL,
	[PROF POL #] [varchar](20) NULL,
	[PROF LIAB LIMIT 1] [int] NULL,
	[PROF LIAB LIMIT 2] [int] NULL,
	[PROF LIAB INS COF] [varchar](5) NULL,
	[GEN LIAB INS] [varchar](5) NULL,
	[GEN LIAB INS CARRIER] [varchar](30) NULL,
	[GEN LIAB INS POLICY #] [varchar](20) NULL,
	[GEN LIAB LIMIT 1] [int] NULL,
	[GEN LIAB LIMIT 2] [int] NULL,
	[PHAR LIAB INS] [varchar](5) NULL,
	[AVE WAIT TIME] [int] NULL,
	[MEDICATION ERRORS DOCUMENTED] [varchar](5) NULL,
	[NUMBER ERRORS 12 MOS] [smallint] NULL,
	[RESOLUTION POLICY] [varchar](5) NULL,
	[COMPOUND PRESCRIPTIONS] [varchar](5) NULL,
	[UNIT DOSING] [smallint] NULL,
	[DUR MED EQ SVC] [smallint] NULL,
	[IV ADMIXTURE] [smallint] NULL,
	[CERTIFIED DISEASE MGMT] [smallint] NULL,
	[CDM EXPLANATION] [varchar](50) NULL,
	[GROUP PRESENTATIONS] [smallint] NULL,
	[CONTINUING EDUCATION] [varchar](5) NULL,
	[ST BOARD INSP] [varchar](5) NULL,
	[COPY RELEASE INFO] [varchar](5) NULL,
	[NABP] [varchar](7) NULL,
	[BULLETIN] [varchar](3) NULL,
	[STORE SIZE CLASSIFICATION] [varchar](1) NULL,
	[HOLIDAY HOURS] [varchar](20) NULL,
	[HOURS] [varchar](50) NULL,
	[DELIVERY SERVICE] [varchar](6) NULL,
	[EMERGENCY SERVICES] [varchar](6) NULL,
	[ANS MACH/ANS SERVICE] [varchar](4) NULL,
	[ALTERNATIVE LANGUAGES] [varchar](50) NULL,
	[SPECIALTY SERVICES] [varchar](50) NULL,
	[COMPUTER SOFTWARE] [varchar](50) NULL,
	[OUTSIDE ID] [varchar](4) NULL,
	[WHOLESALER NAME] [varchar](15) NULL,
	[WHOLESALER ACCT#] [varchar](15) NULL,
	[DC_NBR] [varchar](3) NULL,
	[COMPETITIVEACCT] [smallint] NULL,
	[GPPFORM] [varchar](5) NULL,
	[GPPLETTER] [varchar](5) NULL,
	[LEAST EXP GEN] [smallint] NULL,
	[HEALTH PLAN CONTACTS] [varchar](100) NULL,
	[UNITED ASSURANCE] [varchar](4) NULL,
	[MEMO LIT SIGN] [varchar](200) NULL,
	[INDOOR LIGHTED SIGN] [varchar](50) NULL,
	[RX CARE PROGRAM] [varchar](50) NULL,
	[PCS FORM] [smallint] NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[IPCFORM] [varchar](3) NULL,
	[SWITCHEDFROM] [varchar](50) NULL,
	[PRE-POST] [smallint] NULL,
	[ARGUS AGREE] [smallint] NULL,
	[AFFILIATION] [varchar](3) NULL,
	[BBC SECONDARY ACCT] [varchar](50) NULL,
	[GNP] [varchar](3) NULL,
	[MSR] [varchar](4) NULL,
	[PASSWORD] [varchar](25) NULL,
	[LOGIN] [varchar](25) NULL,
	[AVERAGE VOLUME] [int] NULL,
	[PLUSCARE] [varchar](3) NULL,
	[STEP_UP] [smallint] NULL,
	[ADDCHG] [varchar](6) NULL,
	[CHAIN_CODE] [varchar](3) NULL,
	[PAYEE_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[LASTMODIFIED] [datetime] NULL,
	[QUITDATE] [datetime] NULL,
	[EFFECTIVE] [datetime] NULL,
	[DEAEXP] [datetime] NULL,
	[ST LIC EXP DATE] [datetime] NULL,
	[PROF LIAB INS EXP DATE] [datetime] NULL,
	[GEN LIAB INS EXP DATE] [datetime] NULL,
	[GRPEFFDATE] [datetime] NULL,
	[NPI] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreProgram]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreProgram](
	[ID] [int] NULL,
	[PROGRAM_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[COMMENT] [varchar](50) NULL,
	[EFFECTIVE_DT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoresfromRx30_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoresfromRx30_del](
	[NABP] [nvarchar](50) NULL,
	[RX30 LIC] [nvarchar](50) NULL,
	[STORE NAME ] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Summary1209]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Summary1209](
	[Customer] [float] NULL,
	[store25bp] [float] NULL,
	[storename25bp] [nvarchar](255) NULL,
	[z] [nvarchar](255) NULL,
	[zz] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[NABP ID] [nvarchar](255) NULL,
	[Extended Sales] [money] NULL,
	[x35bp] [money] NULL,
	[x10bp] [money] NULL,
	[Total] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableA](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SSNum] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_3858Relay_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_3858Relay_del](
	[NDC11] [nvarchar](50) NULL,
	[DrugName] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[BrandType] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Whatever] [nvarchar](50) NULL,
	[DotNbr] [nvarchar](50) NULL,
	[TRxCount] [nvarchar](50) NULL,
	[TRxQtyDis] [nvarchar](50) NULL,
	[TotalAWP] [nvarchar](50) NULL,
	[PatientPaidAmount] [nvarchar](50) NULL,
	[TotalPaidAmount] [nvarchar](50) NULL,
	[DispensingFee] [nvarchar](50) NULL,
	[TotalIngCost] [nvarchar](50) NULL,
	[UCAmount] [nvarchar](50) NULL,
	[TableName] [nvarchar](50) NULL,
	[UnitPrice] [decimal](18, 4) NULL,
	[TotalWAC] [decimal](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE](
	[AFF Primary] [nvarchar](50) NULL,
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[Ship To Postal Code] [nvarchar](50) NULL,
	[Store Number] [nvarchar](50) NULL,
	[COG%] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL,
	[March 2009 Total Sales] [nvarchar](50) NULL,
	[February 2009 Total Sales] [nvarchar](50) NULL,
	[January 2009 Total Sales] [nvarchar](50) NULL,
	[March 2009 Total RX] [nvarchar](50) NULL,
	[February 2009 Total RX] [nvarchar](50) NULL,
	[January 2009 Total RX] [nvarchar](50) NULL,
	[March 2009 RX Brand] [nvarchar](50) NULL,
	[February 2009 RX Brand] [nvarchar](50) NULL,
	[January 2009 RX Brand] [nvarchar](50) NULL,
	[March 2009 Total Generics] [nvarchar](50) NULL,
	[February 2009 Total Generics] [nvarchar](50) NULL,
	[January 2009 Total Generics] [nvarchar](50) NULL,
	[March 2009 Source Generics] [nvarchar](50) NULL,
	[February 2009 Source Generic] [nvarchar](50) NULL,
	[January 2009 Source Generic] [nvarchar](50) NULL,
	[March 2009 OTC Cog Applied] [nvarchar](50) NULL,
	[February 2009 OTC Cog Applied] [nvarchar](50) NULL,
	[January 2009 OTC Cog Applied] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE_GEN_REBATE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE_GEN_REBATE](
	[StoreName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Store] [nvarchar](50) NULL,
	[IsTotal] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[CCA] [nvarchar](50) NULL,
	[TotalRxSales] [nvarchar](50) NULL,
	[UnitedCCA] [nvarchar](50) NULL,
	[GenRebatePerc] [nvarchar](50) NULL,
	[GenRebateAmt] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_Compare_genrebate_0909_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_Compare_genrebate_0909_del](
	[Store] [varchar](10) NULL,
	[GenericRebatePerc] [float] NULL,
	[GenericRebateAmt] [money] NULL,
	[Comment] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_Compare_group]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_Compare_group](
	[acct_no] [nvarchar](50) NULL,
	[store] [varchar](65) NULL,
	[nsterritory] [varchar](2) NULL,
	[AFF Primary] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[GroupId] [varchar](10) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG%] [nvarchar](50) NULL,
	[Q1_Total_Sales] [numeric](38, 2) NULL,
	[Q1_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[Q1_Total_RX] [numeric](38, 2) NULL,
	[Q1_Total_RX_BRAND] [numeric](38, 2) NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[Q1_Total_Generics] [numeric](38, 2) NULL,
	[Q1_Total_Source_Generic] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[Q1_OTC_COG_Applied] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL,
	[GCR%] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_Compare_upfrontdisc_0909_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_Compare_upfrontdisc_0909_del](
	[Store] [varchar](10) NULL,
	[UpfrontDiscount] [money] NULL,
	[Block] [varchar](2) NULL,
	[CurrUpfrontDiscount] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE0909_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE0909_del](
	[AFF] [float] NULL,
	[AFF Name] [nvarchar](255) NULL,
	[Div] [float] NULL,
	[Cust] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[Ship To Postal Code] [float] NULL,
	[Store Number] [varchar](50) NULL,
	[COG Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[Total Sales Extended Sales] [money] NULL,
	[Total RX] [money] NULL,
	[RX Generic] [money] NULL,
	[RX Brand] [money] NULL,
	[Total Generic Sales] [money] NULL,
	[Source Generics] [money] NULL,
	[OTC Cog Applied] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_Compare0909_group_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_Compare0909_group_del](
	[acct_no] [varchar](50) NULL,
	[store] [varchar](65) NULL,
	[nsterritory] [varchar](2) NULL,
	[AFF] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[GroupId] [varchar](10) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG Buy Plan %] [float] NULL,
	[Q3_Total_Sales] [numeric](38, 2) NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[Q3_Total_RX] [numeric](38, 2) NULL,
	[Q3_Total_RX_BRAND] [numeric](38, 2) NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[Q3_Total_Generics] [numeric](38, 2) NULL,
	[Q3_Total_Source_Generic] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[Q3_OTC_COG_Applied] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL,
	[GCR%] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE0909_orig_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE0909_orig_del](
	[AFF] [float] NULL,
	[AFF Name] [nvarchar](255) NULL,
	[Div] [float] NULL,
	[Cust] [float] NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[Ship To Postal Code] [float] NULL,
	[Store Number] [float] NULL,
	[COG Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[Total Sales Extended Sales] [money] NULL,
	[Total RX] [money] NULL,
	[RX Generic] [money] NULL,
	[RX Brand] [money] NULL,
	[Total Generic Sales] [money] NULL,
	[Source Generics] [money] NULL,
	[OTC Cog Applied] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_GenRebate_0909_RxSales_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_GenRebate_0909_RxSales_del](
	[Store] [varchar](10) NULL,
	[Comment] [varchar](10) NULL,
	[GenericRebatePerc] [float] NULL,
	[GenericRebateAmt] [money] NULL,
	[TotalRxSales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_COG_LOAD]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_LOAD](
	[Ship To Division] [nvarchar](50) NULL,
	[Ship To Division Name] [nvarchar](50) NULL,
	[Ship To Number] [nvarchar](50) NULL,
	[Ship To Name] [nvarchar](50) NULL,
	[Ship To Address 1] [nvarchar](50) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[Ship To Postal Code] [nvarchar](50) NULL,
	[Store Number] [nvarchar](50) NULL,
	[Default Buy Plan % (COG's)] [nvarchar](50) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ndc_gen_def_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ndc_gen_def_del](
	[NDC] [varchar](15) NULL,
	[QTY] [numeric](38, 0) NULL,
	[COST] [float] NULL,
	[TYPE] [varchar](3) NULL,
	[MFG] [varchar](15) NULL,
	[Description] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ndc_gen_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ndc_gen_del](
	[ndc] [varchar](15) NULL,
	[qty] [numeric](38, 0) NULL,
	[Cost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ndc_gen_orig_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ndc_gen_orig_del](
	[ndc] [varchar](15) NULL,
	[qty] [numeric](38, 0) NULL,
	[Cost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[territory_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[territory_del](
	[Terrid] [varchar](2) NOT NULL,
	[Territory] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_chph_trend_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_chph_trend_del](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[JUL_2008] [float] NULL,
	[AUG_2008] [float] NULL,
	[SEP_2008] [float] NULL,
	[OCT_2008] [float] NULL,
	[NOV_2008] [float] NULL,
	[DEC_2008] [float] NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[JAN_2009] [float] NULL,
	[AVG_PCT_CHG] [numeric](38, 2) NULL,
	[JAN_2008] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 2) NULL,
	[FCST_FEB_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[Q1_FY_2009] [numeric](38, 2) NULL,
	[Q2_FY_2009] [numeric](38, 2) NULL,
	[Q3_FY_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_NADAC]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_NADAC](
	[NDC Description] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[NADAC_Per Unit] [money] NULL,
	[Effective_Date] [datetime] NULL,
	[Pricing_Unit] [nvarchar](255) NULL,
	[Pharmacy_Type_Indicator] [nvarchar](255) NULL,
	[OTC] [nvarchar](255) NULL,
	[Explanation_Code] [nvarchar](255) NULL,
	[Classification_for Rate_Setting] [nvarchar](255) NULL,
	[Corresponding_Generic Drug_NADAC_Per Unit] [nvarchar](255) NULL,
	[Corresponding_Generic Drug_Effective_Date] [nvarchar](255) NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_Q_2008_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_Q_2008_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FY_Q1_2008] [numeric](38, 2) NULL,
	[FY_Q2_2008] [numeric](38, 2) NULL,
	[FY_Q3_2008] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_Q_2009_AP_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_Q_2009_AP_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FY_Q1_2009] [numeric](38, 2) NULL,
	[FY_Q2_2009] [numeric](38, 2) NULL,
	[FY_Q3_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_Q_2009_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_Q_2009_bkp_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FY_Q1_2009] [numeric](38, 2) NULL,
	[FY_Q2_2009] [numeric](38, 2) NULL,
	[FY_Q3_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_Q_2009_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_Q_2009_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FY_Q1_2009] [numeric](38, 2) NULL,
	[FY_Q2_2009] [numeric](38, 2) NULL,
	[FY_Q3_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_ryz_1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ryz_1_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](9) NULL,
	[Min Inv. Date] [datetime] NULL,
	[Max Inv.Date ] [datetime] NULL,
	[NDC 59011033530 Qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_ryz_2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ryz_2_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](9) NULL,
	[Min Inv. Date] [datetime] NULL,
	[Max Inv.Date ] [datetime] NULL,
	[NDC 59011033630 Qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_ryz_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ryz_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](9) NULL,
	[Min Inv. Date] [datetime] NULL,
	[Max Inv.Date ] [datetime] NULL,
	[NDC 59011033430 Qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_ssreport_1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ssreport_1_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[fytd09ss] [numeric](38, 2) NULL,
	[fytd08ss] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test_ssreport_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ssreport_del](
	[type] [varchar](15) NULL,
	[store] [varchar](4) NULL,
	[fytd09all] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tg_DataCleaningMaintenance_PendingDelete__20170207_000000_5ccc3970-89b5-4865-bc37-13e770b3b334]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tg_DataCleaningMaintenance_PendingDelete__20170207_000000_5ccc3970-89b5-4865-bc37-13e770b3b334](
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tg_DataCleaningMaintenance_PendingInsert__20170207_000000_ad446bf0-2b95-48f8-ae95-cac6c17ac90d]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tg_DataCleaningMaintenance_PendingInsert__20170207_000000_ad446bf0-2b95-48f8-ae95-cac6c17ac90d](
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_120513bg]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_120513bg](
	[PCLAIM_KEY] [int] NULL,
	[NABP] [char](7) NULL,
	[FEED_ID] [int] NULL,
	[PLAN_CYCLE_DT] [datetime] NULL,
	[PLAN_ID] [int] NULL,
	[RX_NUM] [varchar](25) NULL,
	[FILL_DT] [datetime] NULL,
	[BILL_AMT] [numeric](8, 2) NULL,
	[PAID_AMT] [numeric](8, 2) NULL,
	[REJECT_AMT] [numeric](8, 2) NULL,
	[INGRED_BILL_AMT] [numeric](8, 2) NULL,
	[INGRED_PD_AMT] [numeric](8, 2) NULL,
	[COPAY_AMT] [numeric](8, 2) NULL,
	[CONTRACT_FEE_AMT] [numeric](8, 2) NULL,
	[MISC_FEE_AMT] [numeric](8, 2) NULL,
	[REFILLS_QTY] [int] NULL,
	[CLAIM_TYPE] [char](2) NULL,
	[SUBMIT_CLARIF_CODE] [char](2) NULL,
	[GROUP_ID] [char](15) NULL,
	[PAYEE_ID] [int] NULL,
	[NPI] [varchar](10) NULL,
	[NDC] [varchar](17) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_13MoSalesbyItemNo]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_13MoSalesbyItemNo](
	[REPORTINGMONTH] [numeric](13, 0) NOT NULL,
	[ITEMNO] [varchar](35) NOT NULL,
	[IDPGRP] [char](5) NOT NULL,
	[QTY] [numeric](31, 3) NULL,
	[EXTPRICE] [numeric](31, 4) NULL,
	[PRICEAFTERPAYTERMDISCOUNT] [numeric](31, 4) NULL,
	[PRICEAFTERREBATE] [numeric](31, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[july_r] [numeric](38, 2) NULL,
	[august_r] [numeric](38, 2) NULL,
	[september_r] [numeric](38, 2) NULL,
	[october_r] [numeric](38, 2) NULL,
	[november_r] [numeric](38, 2) NULL,
	[december_r] [numeric](38, 2) NULL,
	[july_v] [numeric](38, 2) NULL,
	[august_v] [numeric](38, 2) NULL,
	[september_v] [numeric](38, 2) NULL,
	[october_v] [numeric](38, 2) NULL,
	[november_v] [numeric](38, 2) NULL,
	[december_v] [numeric](38, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate_bkp_del](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[july_r] [numeric](15, 2) NULL,
	[august_r] [numeric](15, 2) NULL,
	[september_r] [numeric](15, 2) NULL,
	[october_r] [numeric](15, 2) NULL,
	[november_r] [numeric](15, 2) NULL,
	[december_r] [numeric](15, 2) NULL,
	[july_v] [numeric](15, 2) NULL,
	[august_v] [numeric](15, 2) NULL,
	[september_v] [numeric](15, 2) NULL,
	[october_v] [numeric](15, 2) NULL,
	[november_v] [numeric](15, 2) NULL,
	[december_v] [numeric](15, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate_rpt]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate_rpt](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[January_r] [numeric](38, 2) NULL,
	[February_r] [numeric](38, 2) NULL,
	[March_r] [numeric](38, 2) NULL,
	[April_r] [numeric](38, 2) NULL,
	[May_r] [numeric](38, 2) NULL,
	[June_r] [numeric](38, 2) NULL,
	[January_v] [numeric](38, 2) NULL,
	[February_v] [numeric](38, 2) NULL,
	[March_v] [numeric](38, 2) NULL,
	[April_v] [numeric](38, 2) NULL,
	[May_v] [numeric](38, 2) NULL,
	[June_v] [numeric](38, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate_rpt_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate_rpt_AAP](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[May_r] [numeric](38, 2) NULL,
	[June_r] [numeric](38, 2) NULL,
	[July_r] [numeric](38, 2) NULL,
	[August_r] [numeric](38, 2) NULL,
	[September_r] [numeric](38, 2) NULL,
	[October_r] [numeric](38, 2) NULL,
	[May_v] [numeric](38, 2) NULL,
	[June_v] [numeric](38, 2) NULL,
	[July_v] [numeric](38, 2) NULL,
	[August_v] [numeric](38, 2) NULL,
	[September_v] [numeric](38, 2) NULL,
	[October_v] [numeric](38, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_all_active_1208_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_active_1208_del](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[June] [numeric](14, 2) NULL,
	[July] [numeric](14, 2) NULL,
	[August] [numeric](14, 2) NULL,
	[September] [numeric](14, 2) NULL,
	[October] [numeric](14, 2) NULL,
	[November] [numeric](14, 2) NULL,
	[December] [float] NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_June] [numeric](14, 2) NULL,
	[Anda_July] [numeric](14, 2) NULL,
	[Anda_August] [numeric](14, 2) NULL,
	[Anda_September] [numeric](14, 2) NULL,
	[Anda_October] [numeric](14, 2) NULL,
	[Anda_November] [numeric](14, 2) NULL,
	[Anda_December] [numeric](14, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_June] [numeric](14, 2) NULL,
	[Par_July] [numeric](14, 2) NULL,
	[Par_August] [numeric](14, 2) NULL,
	[Par_September] [numeric](14, 2) NULL,
	[Par_October] [numeric](14, 2) NULL,
	[Par_November] [numeric](14, 2) NULL,
	[Par_December] [numeric](14, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_all_active_compare]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_active_compare](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_July_2008] [numeric](38, 2) NULL,
	[Anda_August_2008] [numeric](38, 2) NULL,
	[Anda_September_2008] [numeric](38, 2) NULL,
	[Anda_October_2008] [numeric](38, 2) NULL,
	[Anda_November_2008] [numeric](38, 2) NULL,
	[Anda_December_2008] [numeric](38, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_July_2008] [numeric](38, 2) NULL,
	[Par_August_2008] [numeric](38, 2) NULL,
	[Par_September_2008] [numeric](38, 2) NULL,
	[Par_October_2008] [numeric](38, 2) NULL,
	[Par_November_2008] [numeric](38, 2) NULL,
	[Par_December_2008] [numeric](38, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_all_active_compare_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_active_compare_bkp_del](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[June] [numeric](14, 2) NULL,
	[July] [numeric](14, 2) NULL,
	[August] [numeric](14, 2) NULL,
	[September] [numeric](14, 2) NULL,
	[October] [numeric](14, 2) NULL,
	[November] [numeric](14, 2) NULL,
	[December] [float] NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_June] [numeric](14, 2) NULL,
	[Anda_July] [numeric](14, 2) NULL,
	[Anda_August] [numeric](14, 2) NULL,
	[Anda_September] [numeric](14, 2) NULL,
	[Anda_October] [numeric](14, 2) NULL,
	[Anda_November] [numeric](14, 2) NULL,
	[Anda_December] [numeric](14, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_June] [numeric](14, 2) NULL,
	[Par_July] [numeric](14, 2) NULL,
	[Par_August] [numeric](14, 2) NULL,
	[Par_September] [numeric](14, 2) NULL,
	[Par_October] [numeric](14, 2) NULL,
	[Par_November] [numeric](14, 2) NULL,
	[Par_December] [numeric](14, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_all_new_members_1208_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_new_members_1208_del](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[June] [numeric](14, 2) NULL,
	[July] [numeric](14, 2) NULL,
	[August] [numeric](14, 2) NULL,
	[September] [numeric](14, 2) NULL,
	[October] [numeric](14, 2) NULL,
	[November] [numeric](14, 2) NULL,
	[December] [float] NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_June] [numeric](14, 2) NULL,
	[Anda_July] [numeric](14, 2) NULL,
	[Anda_August] [numeric](14, 2) NULL,
	[Anda_September] [numeric](14, 2) NULL,
	[Anda_October] [numeric](14, 2) NULL,
	[Anda_November] [numeric](14, 2) NULL,
	[Anda_December] [numeric](14, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_June] [numeric](14, 2) NULL,
	[Par_July] [numeric](14, 2) NULL,
	[Par_August] [numeric](14, 2) NULL,
	[Par_September] [numeric](14, 2) NULL,
	[Par_October] [numeric](14, 2) NULL,
	[Par_November] [numeric](14, 2) NULL,
	[Par_December] [numeric](14, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_anda_parmed_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_anda_parmed_AAP](
	[acct_no] [varchar](5) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[vendor] [varchar](64) NULL,
	[vendor_id] [int] NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[Qtr_Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_anda_parmed_rpt]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_anda_parmed_rpt](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[vendor] [varchar](64) NULL,
	[vendor_id] [int] NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[Qtr_Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Anda_Parmed_SLX]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Anda_Parmed_SLX](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[vendor] [varchar](64) NULL,
	[QTR_4_08_TOTAL] [numeric](16, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_api_apv_jmw]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_api_apv_jmw](
	[dea] [varchar](255) NULL,
	[cog] [float] NULL,
	[name] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[st] [varchar](50) NULL,
	[CustNo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_api_apv_jmw_dup]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_api_apv_jmw_dup](
	[dea] [varchar](255) NULL,
	[cog] [float] NULL,
	[name] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[st] [varchar](50) NULL,
	[CustNo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_JMW]    Script Date: 12/22/2020 3:43:54 AM ******/
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
/****** Object:  Table [dbo].[tmp_AppendixAList]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AppendixAList](
	[mfg] [nvarchar](100) NULL,
	[andc] [nvarchar](15) NULL,
	[aname] [nvarchar](100) NULL,
	[ndc] [varchar](11) NULL,
	[gcn_seqno] [numeric](6, 0) NULL,
	[gcn] [numeric](5, 0) NULL,
	[GPI] [varchar](14) NULL,
	[CIN] [varchar](15) NULL,
	[type] [varchar](3) NULL,
	[name] [varchar](60) NULL,
	[strength] [varchar](60) NULL,
	[psize] [numeric](11, 3) NULL,
	[DEA] [varchar](1) NULL,
	[HCFA] [char](1) NULL,
	[USUnit] [float] NULL,
	[USPkg] [money] NULL,
	[Top100pkg] [money] NULL,
	[awp_unit] [float] NULL,
	[awp_pkg] [float] NULL,
	[wac_unit] [float] NULL,
	[wac_pkg] [float] NULL,
	[ful] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_attask_LOBDetail]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_attask_LOBDetail](
	[type] [varchar](9) NOT NULL,
	[name] [nvarchar](512) NULL,
	[hours] [numeric](10, 2) NOT NULL,
	[entered] [varchar](8) NULL,
	[prjname] [nvarchar](255) NOT NULL,
	[taskname] [nvarchar](255) NOT NULL,
	[LOB] [nvarchar](2000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX](
	[acct_no] [varchar](4) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX_AAP](
	[acct_no] [varchar](4) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX_AUTO]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX_AUTO](
	[acct_no] [varchar](4) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX_AUTO_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AVG_6_MO_VOL_LOAD_SLX_AUTO_bkp](
	[acct_no] [varchar](4) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_baseline_1208]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_baseline_1208](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[June] [numeric](14, 2) NULL,
	[July] [numeric](14, 2) NULL,
	[August] [numeric](14, 2) NULL,
	[September] [numeric](14, 2) NULL,
	[October] [numeric](14, 2) NULL,
	[November] [numeric](14, 2) NULL,
	[December] [float] NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_June] [numeric](14, 2) NULL,
	[Anda_July] [numeric](14, 2) NULL,
	[Anda_August] [numeric](14, 2) NULL,
	[Anda_September] [numeric](14, 2) NULL,
	[Anda_October] [numeric](14, 2) NULL,
	[Anda_November] [numeric](14, 2) NULL,
	[Anda_December] [numeric](14, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_June] [numeric](14, 2) NULL,
	[Par_July] [numeric](14, 2) NULL,
	[Par_August] [numeric](14, 2) NULL,
	[Par_September] [numeric](14, 2) NULL,
	[Par_October] [numeric](14, 2) NULL,
	[Par_November] [numeric](14, 2) NULL,
	[Par_December] [numeric](14, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_baseline_compare_test]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_baseline_compare_test](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[January_2008] [numeric](38, 2) NULL,
	[February_2008] [numeric](38, 2) NULL,
	[March_2008] [numeric](38, 2) NULL,
	[April_2008] [numeric](38, 2) NULL,
	[May_2008] [numeric](38, 2) NULL,
	[June_2008] [numeric](38, 2) NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_January_2008] [numeric](38, 2) NULL,
	[Anda_February_2008] [numeric](38, 2) NULL,
	[Anda_March_2008] [numeric](38, 2) NULL,
	[Anda_April_2008] [numeric](38, 2) NULL,
	[Anda_May_2008] [numeric](38, 2) NULL,
	[Anda_June_2008] [numeric](38, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_January_2008] [numeric](38, 2) NULL,
	[Par_February_2008] [numeric](38, 2) NULL,
	[Par_March_2008] [numeric](38, 2) NULL,
	[Par_April_2008] [numeric](38, 2) NULL,
	[Par_May_2008] [numeric](38, 2) NULL,
	[Par_June_2008] [numeric](38, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 4) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_baselineReport_vpri]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_baselineReport_vpri](
	[acct_no] [varchar](4) NULL,
	[ncpdp] [varchar](7) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Nov07] [numeric](14, 2) NULL,
	[Dec07] [numeric](14, 2) NULL,
	[Jan08] [numeric](14, 2) NULL,
	[Feb08] [numeric](14, 2) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[May07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](16, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_baselineReport_vsum]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_baselineReport_vsum](
	[acct_no] [varchar](4) NULL,
	[ncpdp] [varchar](7) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[Apr08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[May08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[May07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](38, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_bgreport]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_bgreport](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[February_CHUD] [numeric](38, 2) NULL,
	[March_CHUD] [numeric](38, 2) NULL,
	[April_CHUD] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CHPH_1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHPH_1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_1_070308]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_1_070308](
	[ID] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_1_duplicates]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_1_duplicates](
	[ID] [int] NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CHPH_1_loadlog]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHPH_1_loadlog](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_1_small]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_1_small](
	[ID] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_Exception]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_Exception](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_qtr]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_qtr](
	[store] [varchar](50) NOT NULL,
	[Q4_2008] [float] NULL,
	[Q4_2009] [float] NULL,
	[QQ_PCT_CHG] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_test]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_test](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[DEC_2007] [float] NULL,
	[JAN_2008] [float] NULL,
	[FEB_2008] [float] NULL,
	[MAR_2008] [float] NULL,
	[APR_2008] [float] NULL,
	[MAY_2008] [float] NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[JUN_2008] [float] NULL,
	[AVG_PCT_CHG] [numeric](38, 2) NULL,
	[JUN_2007] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 2) NULL,
	[Q2_2008] [numeric](38, 2) NULL,
	[Q2_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 2) NULL,
	[FCST_JUL_2008] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_trend]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_trend](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[JUL_2008] [float] NULL,
	[AUG_2008] [float] NULL,
	[SEP_2008] [float] NULL,
	[OCT_2008] [float] NULL,
	[NOV_2008] [float] NULL,
	[DEC_2008] [float] NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[JAN_2009] [float] NULL,
	[AVG_PCT_CHG] [numeric](38, 2) NULL,
	[JAN_2008] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 2) NULL,
	[FCST_FEB_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph_trend_test]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_trend_test](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[July_2009] [numeric](38, 2) NULL,
	[August_2009] [numeric](38, 2) NULL,
	[September_2009] [numeric](38, 2) NULL,
	[October_2009] [numeric](38, 2) NULL,
	[November_2009] [numeric](38, 2) NULL,
	[December_2009] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_2010] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2009] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[February_2010] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_chph1_compare_OTC_RX]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph1_compare_OTC_RX](
	[ID] [int] NOT NULL,
	[STORE] [varchar](31) NULL,
	[OTC_Only] [float] NULL,
	[OTC_RX] [float] NULL,
	[OTC_RX_Percentage] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_COG_Compare_rpt]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COG_Compare_rpt](
	[store] [varchar](65) NULL,
	[Ship To City] [nvarchar](50) NULL,
	[Ship To State] [nvarchar](50) NULL,
	[acct_no] [nvarchar](50) NULL,
	[nsterritory] [varchar](2) NULL,
	[GroupId] [varchar](10) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG%] [numeric](38, 4) NULL,
	[AR2000 Terms Code] [nvarchar](50) NULL,
	[Statement Frequency] [nvarchar](50) NULL,
	[Q1_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[Q109Base] [numeric](38, 4) NULL,
	[BrandAtWac] [numeric](38, 2) NULL,
	[Q109Savings] [numeric](38, 2) NULL,
	[ProposedCOG] [numeric](38, 4) NULL,
	[COGDelta] [numeric](38, 4) NULL,
	[Q109NewBase] [numeric](38, 4) NULL,
	[ProposedMnthlyBrands] [numeric](38, 2) NULL,
	[ProposedBrandSavings] [numeric](38, 2) NULL,
	[ProposedSavingsLoss] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL,
	[OTCdivTotalPurchases] [numeric](38, 4) NULL,
	[OTCAtWAC] [numeric](38, 2) NULL,
	[OTCLoss] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[CurrAvgMoRebate] [numeric](38, 2) NULL,
	[ProposedAvgMoRebate] [numeric](38, 2) NULL,
	[ProposedGenericSavingLoss] [numeric](38, 2) NULL,
	[TotalSavingLoss] [numeric](38, 2) NULL,
	[BasisPointsValueOfSavings] [numeric](38, 4) NULL,
	[GCR%] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_COG_Compare0909_rpt]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COG_Compare0909_rpt](
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[acct_no] [varchar](50) NULL,
	[nsterritory] [varchar](2) NULL,
	[GroupId] [varchar](10) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG Buy Plan %] [numeric](38, 4) NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[Q309Base] [numeric](38, 4) NULL,
	[BrandAtWac] [numeric](38, 2) NULL,
	[Q309Savings] [numeric](38, 2) NULL,
	[ProposedCOG] [numeric](38, 4) NULL,
	[COGDelta] [numeric](38, 4) NULL,
	[Q309NewBase] [numeric](38, 4) NULL,
	[ProposedMnthlyBrands] [numeric](38, 2) NULL,
	[ProposedBrandSavings] [numeric](38, 2) NULL,
	[ProposedSavingsLoss] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL,
	[OTCdivTotalPurchases] [numeric](38, 4) NULL,
	[OTCAtWAC] [numeric](38, 2) NULL,
	[OTCLoss] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[CurrAvgMoRebate] [numeric](38, 2) NULL,
	[ProposedAvgMoRebate] [numeric](38, 2) NULL,
	[ProposedGenericSavingLoss] [numeric](38, 2) NULL,
	[TotalSavingLoss] [numeric](38, 2) NULL,
	[BasisPointsValueOfSavings] [numeric](38, 4) NULL,
	[GCR%] [numeric](38, 4) NULL,
	[Curr_UpfrontDiscount] [numeric](38, 2) NULL,
	[New_UpfrontDiscount] [numeric](38, 2) NULL,
	[COG% 12/1] [numeric](38, 4) NULL,
	[Est Pay Term Disc] [numeric](38, 4) NULL,
	[Pay Term Savings] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_COG_XLS_0909]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COG_XLS_0909](
	[NCPDP] [varchar](7) NULL,
	[DEA] [varchar](10) NULL,
	[StoreName] [varchar](65) NULL,
	[UD_ACCT_NO] [varchar](50) NULL,
	[AAP_ACCT_NO] [varchar](20) NULL,
	[API_ACCT_NO] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[NSTerritory] [varchar](2) NULL,
	[SLXTerritory] [varchar](32) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG Buy Plan %] [float] NULL,
	[Q3_Total_RX] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[avg_mo_total_sales_group] [numeric](38, 2) NULL,
	[Curr_UpfrontDiscount] [numeric](38, 2) NULL,
	[New_UpfrontDiscount] [numeric](38, 2) NULL,
	[AVG_Total_RX] [money] NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_COGS_report]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COGS_report](
	[ship to number] [float] NULL,
	[UDacct] [varchar](4) NULL,
	[COGS0608] [float] NULL,
	[COGS1208] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Compare_SLX_DEA_VAL]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Compare_SLX_DEA_VAL](
	[ncpdp] [varchar](50) NULL,
	[slx_dea_value] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_compare_wac]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_compare_wac](
	[gcn] [numeric](5, 0) NULL,
	[tmp_UnitPrice] [numeric](38, 14) NULL,
	[tmp_TotalWAC] [numeric](28, 4) NULL,
	[CARDPrice] [numeric](18, 4) NULL,
	[CARDTotalWAC] [numeric](29, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ConversionMaster051110]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ConversionMaster051110](
	[territory] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [nvarchar](255) NULL,
	[Parent] [nvarchar](255) NULL,
	[Aff#] [varchar](255) NULL,
	[DC] [varchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Master#] [varchar](255) NULL,
	[AAP Member Start Date] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Store#] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Exp] [datetime] NULL,
	[SBOP] [nvarchar](255) NULL,
	[SBOP Exp] [datetime] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Date Documentation Sent to CCDB] [datetime] NULL,
	[New AAP Affiliation] [varchar](255) NULL,
	[New Rx COGs] [float] NULL,
	[New Store Number] [nvarchar](255) NULL,
	[Committed Volume] [money] NULL,
	[Terms] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[Field27] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_customer_list]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_customer_list](
	[ACCOUNT] [varchar](128) NULL,
	[NCPDP] [varchar](32) NULL,
	[UDACCTNO] [varchar](32) NULL,
	[DEA] [varchar](15) NULL,
	[NPI_NUMBER] [varchar](32) NULL,
	[AAPID] [varchar](32) NULL,
	[api_id] [varchar](32) NULL,
	[ADDRESS1] [varchar](64) NULL,
	[CITY] [varchar](32) NULL,
	[STATE] [varchar](32) NULL,
	[POSTALCODE] [varchar](24) NULL,
	[STATUS] [varchar](64) NULL,
	[SUBTYPE] [varchar](64) NULL,
	[BUSINESSDESCRIPTION] [varchar](2000) NULL,
	[MAINPHONE] [varchar](32) NULL,
	[FAX] [varchar](32) NULL,
	[TERRITORY] [varchar](32) NULL,
	[RXNETWORK] [varchar](32) NULL,
	[RXCOMPUTER] [varchar](32) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFYDATE] [datetime] NULL,
	[ACCOUNTID] [char](12) NOT NULL,
	[TYPE] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_Cal2010YTD_CAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_Cal2010YTD_CAS](
	[fy_end] [varchar](4) NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](14, 2) NULL,
	[february] [numeric](14, 2) NULL,
	[march] [numeric](14, 2) NULL,
	[april] [numeric](14, 2) NULL,
	[may] [numeric](14, 2) NULL,
	[june] [numeric](14, 2) NULL,
	[1Q10Paid] [bit] NULL,
	[2Q10Paid] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_Cal2010YTD_CAS_v1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_Cal2010YTD_CAS_v1](
	[fy_end] [varchar](4) NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [int] NOT NULL,
	[february] [int] NOT NULL,
	[march] [int] NOT NULL,
	[april] [numeric](14, 2) NULL,
	[may] [numeric](14, 2) NULL,
	[june] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_tr_volumesnap]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr_volumesnap](
	[acct_no] [varchar](4) NULL,
	[vendor_id] [int] NULL,
	[october] [numeric](14, 2) NULL,
	[november] [numeric](14, 2) NULL,
	[december] [numeric](14, 2) NULL,
	[january] [numeric](14, 2) NULL,
	[february] [numeric](14, 2) NULL,
	[march] [numeric](14, 2) NULL,
	[april] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_tr_volumesnap_allws]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr_volumesnap_allws](
	[acct_no] [varchar](4) NULL,
	[vendor_id] [int] NULL,
	[aug08] [numeric](14, 2) NULL,
	[sep08] [numeric](14, 2) NULL,
	[oct08] [numeric](14, 2) NULL,
	[nov08] [numeric](14, 2) NULL,
	[dec08] [numeric](14, 2) NULL,
	[jan09] [numeric](14, 2) NULL,
	[feb09] [numeric](14, 2) NULL,
	[feb08] [numeric](38, 2) NULL,
	[dec07] [numeric](38, 2) NULL,
	[nov07] [numeric](38, 2) NULL,
	[oct07] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_tr_volumesnap_priws]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr_volumesnap_priws](
	[acct_no] [varchar](4) NULL,
	[vendor_id] [int] NULL,
	[aug08] [numeric](14, 2) NULL,
	[sep08] [numeric](14, 2) NULL,
	[oct08] [numeric](14, 2) NULL,
	[nov08] [numeric](14, 2) NULL,
	[dec08] [numeric](14, 2) NULL,
	[jan09] [numeric](14, 2) NULL,
	[feb09] [numeric](14, 2) NULL,
	[feb08] [numeric](38, 2) NULL,
	[dec07] [numeric](38, 2) NULL,
	[nov07] [numeric](38, 2) NULL,
	[oct07] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_tr1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr1](
	[acct_no] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_tr2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_tr2](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_TrueCal2010YTD_CAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_TrueCal2010YTD_CAS](
	[Cal_Year] [varchar](4) NOT NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[1Q10Paid] [bit] NULL,
	[2Q10Paid] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_TrueCal2010YTD_CAS_v1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_TrueCal2010YTD_CAS_v1](
	[Cal_Year] [varchar](4) NOT NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [int] NULL,
	[february] [int] NULL,
	[march] [int] NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[1Q10Paid] [bit] NULL,
	[2Q10Paid] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_TRUECal2010YTD_CASbyPMID]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_TRUECal2010YTD_CASbyPMID](
	[volAcct] [int] NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[1Q10Paid] [int] NULL,
	[2Q10Paid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_TRUECal2010YTD_CASwPMID]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_TRUECal2010YTD_CASwPMID](
	[volAcct] [int] NULL,
	[Cal_Year] [varchar](4) NOT NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[1Q10Paid] [bit] NULL,
	[2Q10Paid] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009CAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009CAS](
	[volacct] [varchar](8) NULL,
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009GrpedCAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009GrpedCAS](
	[volacct] [varchar](8) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[july] [numeric](38, 2) NULL,
	[august] [numeric](38, 2) NULL,
	[september] [numeric](38, 2) NULL,
	[october] [numeric](38, 2) NULL,
	[november] [numeric](38, 2) NULL,
	[december] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2010CAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2010CAS](
	[volacct] [varchar](8) NULL,
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2010GrpedCAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2010GrpedCAS](
	[volacct] [varchar](8) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[july] [numeric](38, 2) NULL,
	[august] [numeric](38, 2) NULL,
	[september] [numeric](38, 2) NULL,
	[october] [numeric](38, 2) NULL,
	[november] [numeric](38, 2) NULL,
	[december] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2011CAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2011CAS](
	[volacct] [varchar](8) NULL,
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2011GrpedCAS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2011GrpedCAS](
	[volacct] [varchar](8) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[july] [numeric](38, 2) NULL,
	[august] [numeric](38, 2) NULL,
	[september] [numeric](38, 2) NULL,
	[october] [numeric](38, 2) NULL,
	[november] [numeric](38, 2) NULL,
	[december] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_deletePMIDLookup]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_deletePMIDLookup](
	[pmid] [int] NOT NULL,
	[acct_no] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_F2_Q4UD]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_F2_Q4UD](
	[UD_acct] [varchar](5) NULL,
	[UD_group] [varchar](25) NULL,
	[q4total] [numeric](16, 2) NULL,
	[q4average] [numeric](20, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_F2_Q4UD_final]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_F2_Q4UD_final](
	[ud_acct] [varchar](5) NULL,
	[ud_group] [varchar](25) NULL,
	[memstore] [varchar](25) NULL,
	[q4UDtotal] [numeric](16, 2) NULL,
	[q4UDaverage] [numeric](20, 6) NULL,
	[q4UDgrptotal] [numeric](38, 2) NULL,
	[q4UDgrpaverage] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_F2_Q4UDGroup]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_F2_Q4UDGroup](
	[memstore] [varchar](25) NULL,
	[q4grptotal] [numeric](38, 2) NULL,
	[q4grpaverage] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_fytd_qtr_all]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_fytd_qtr_all](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](5) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[Q1_FY_2010] [numeric](38, 2) NULL,
	[Q2_FY_2010] [numeric](38, 2) NULL,
	[Q3_FY_2010] [numeric](38, 2) NULL,
	[Q4_FY_2010] [numeric](38, 2) NULL,
	[Q1_FY_2009] [numeric](38, 2) NULL,
	[Q2_FY_2009] [numeric](38, 2) NULL,
	[Q3_FY_2009] [numeric](38, 2) NULL,
	[Q4_FY_2009] [numeric](38, 2) NULL,
	[Q1_FY_2010_AP] [numeric](38, 2) NULL,
	[Q2_FY_2010_AP] [numeric](38, 2) NULL,
	[Q3_FY_2010_AP] [numeric](38, 2) NULL,
	[Q4_FY_2010_AP] [numeric](38, 2) NULL,
	[Q1_FY_2009_AP] [numeric](38, 2) NULL,
	[Q2_FY_2009_AP] [numeric](38, 2) NULL,
	[Q3_FY_2009_AP] [numeric](38, 2) NULL,
	[Q4_FY_2009_AP] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_fytd_qtr_all_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_fytd_qtr_all_AAP](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](5) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[Q1_FY_2009] [numeric](38, 2) NULL,
	[Q2_FY_2009] [numeric](38, 2) NULL,
	[Q3_FY_2009] [numeric](38, 2) NULL,
	[Q4_FY_2009] [numeric](38, 2) NULL,
	[Q1_FY_2008] [numeric](38, 2) NULL,
	[Q2_FY_2008] [numeric](38, 2) NULL,
	[Q3_FY_2008] [numeric](38, 2) NULL,
	[Q4_FY_2008] [numeric](38, 2) NULL,
	[Q1_FY_2009_AP] [numeric](38, 2) NULL,
	[Q2_FY_2009_AP] [numeric](38, 2) NULL,
	[Q3_FY_2009_AP] [numeric](38, 2) NULL,
	[Q4_FY_2009_AP] [numeric](38, 2) NULL,
	[Q1_FY_2008_AP] [numeric](38, 2) NULL,
	[Q2_FY_2008_AP] [numeric](38, 2) NULL,
	[Q3_FY_2008_AP] [numeric](38, 2) NULL,
	[Q4_FY_2008_AP] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_fytd_qtr_cur_bg]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_fytd_qtr_cur_bg](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[Q1_FY_2009] [numeric](38, 2) NULL,
	[Q2_FY_2009] [numeric](38, 2) NULL,
	[Q3_FY_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_fytd_qtr_prev_bg]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_fytd_qtr_prev_bg](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[Q1_FY_2008] [numeric](38, 2) NULL,
	[Q2_FY_2008] [numeric](38, 2) NULL,
	[Q3_FY_2008] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_gen_brnd_qtr]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_brnd_qtr](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[generic_Q1_2009] [numeric](38, 2) NULL,
	[brand_Q1_2009] [numeric](38, 2) NULL,
	[generic_Q1_2008] [numeric](38, 2) NULL,
	[brand_Q1_2008] [numeric](38, 2) NULL,
	[wholesaler] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_gen_brnd_qtr_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_brnd_qtr_AAP](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[generic_Q1_2008] [numeric](38, 2) NULL,
	[brand_Q1_2008] [numeric](38, 2) NULL,
	[generic_Q2_2008] [numeric](38, 2) NULL,
	[brand_Q2_2008] [numeric](38, 2) NULL,
	[generic_Q3_2008] [numeric](38, 2) NULL,
	[brand_Q3_2008] [numeric](38, 2) NULL,
	[generic_Q4_2008] [numeric](38, 2) NULL,
	[brand_Q4_2008] [numeric](38, 2) NULL,
	[generic_Q1_2007] [numeric](38, 2) NULL,
	[brand_Q1_2007] [numeric](38, 2) NULL,
	[generic_Q2_2007] [numeric](38, 2) NULL,
	[brand_Q2_2007] [numeric](38, 2) NULL,
	[generic_Q3_2007] [numeric](38, 2) NULL,
	[brand_Q3_2007] [numeric](38, 2) NULL,
	[generic_Q4_2007] [numeric](38, 2) NULL,
	[brand_Q4_2007] [numeric](38, 2) NULL,
	[wholesaler] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_gen_brnd_qtr_all]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_brnd_qtr_all](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[generic_Q1_2009] [numeric](38, 2) NULL,
	[brand_Q1_2009] [numeric](38, 2) NULL,
	[generic_Q2_2009] [numeric](38, 2) NULL,
	[brand_Q2_2009] [numeric](38, 2) NULL,
	[generic_Q3_2009] [numeric](38, 2) NULL,
	[brand_Q3_2009] [numeric](38, 2) NULL,
	[generic_Q1_2008] [numeric](38, 2) NULL,
	[brand_Q1_2008] [numeric](38, 2) NULL,
	[generic_Q2_2008] [numeric](38, 2) NULL,
	[brand_Q2_2008] [numeric](38, 2) NULL,
	[generic_Q3_2008] [numeric](38, 2) NULL,
	[brand_Q3_2008] [numeric](38, 2) NULL,
	[wholesaler] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_gen_brnd_qtr_all_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_brnd_qtr_all_bkp](
	[acct_no] [char](4) NULL,
	[store] [varchar](65) NULL,
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[generic_Q1_2009] [numeric](38, 2) NULL,
	[brand_Q1_2009] [numeric](38, 2) NULL,
	[generic_Q2_2009] [numeric](38, 2) NULL,
	[brand_Q2_2009] [numeric](38, 2) NULL,
	[generic_Q3_2009] [numeric](38, 2) NULL,
	[brand_Q3_2009] [numeric](38, 2) NULL,
	[generic_Q1_2008] [numeric](38, 2) NULL,
	[brand_Q1_2008] [numeric](38, 2) NULL,
	[generic_Q2_2008] [numeric](38, 2) NULL,
	[brand_Q2_2008] [numeric](38, 2) NULL,
	[generic_Q3_2008] [numeric](38, 2) NULL,
	[brand_Q3_2008] [numeric](38, 2) NULL,
	[vendor_id] [int] NULL,
	[wholesaler] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Gen_GR_SLX_VAL]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Gen_GR_SLX_VAL](
	[nabp] [varchar](7) NULL,
	[slxvalue] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Gen_GR_SLX_VAL_DEA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Gen_GR_SLX_VAL_DEA](
	[DEA] [varchar](20) NULL,
	[slxvalue] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_gen_reb_load_slx]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_reb_load_slx](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[DEA] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[oct_gen_vol_amt] [numeric](38, 2) NULL,
	[oct_rx_vol_amt] [numeric](38, 2) NULL,
	[nov_gen_vol_amt] [numeric](38, 2) NULL,
	[nov_rx_vol_amt] [numeric](38, 2) NULL,
	[dec_gen_vol_amt] [numeric](38, 2) NULL,
	[dec_rx_vol_amt] [numeric](38, 2) NULL,
	[gen_vol_avg] [numeric](38, 2) NULL,
	[rx_vol_avg] [numeric](38, 2) NULL,
	[compliancePerc] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GEN_REB_LOAD_SLX_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GEN_REB_LOAD_SLX_AAP](
	[Store_Name] [varchar](8000) NULL,
	[acct_no] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[mo1_gen_vol_amt] [numeric](38, 2) NULL,
	[mo1_rx_vol_amt] [numeric](38, 2) NULL,
	[mo2_gen_vol_amt] [numeric](38, 2) NULL,
	[mo2_rx_vol_amt] [numeric](38, 2) NULL,
	[mo3_gen_vol_amt] [numeric](38, 2) NULL,
	[mo3_rx_vol_amt] [numeric](38, 2) NULL,
	[gen_vol_tot] [numeric](38, 2) NULL,
	[rx_vol_tot] [numeric](38, 2) NULL,
	[compliancePerc] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GEN_REB_LOAD_SLX_AUTO]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GEN_REB_LOAD_SLX_AUTO](
	[Store_Name] [varchar](8000) NULL,
	[acct_no] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[mo1_gen_vol_amt] [numeric](38, 2) NULL,
	[mo1_rx_vol_amt] [numeric](38, 2) NULL,
	[mo2_gen_vol_amt] [numeric](38, 2) NULL,
	[mo2_rx_vol_amt] [numeric](38, 2) NULL,
	[mo3_gen_vol_amt] [numeric](38, 2) NULL,
	[mo3_rx_vol_amt] [numeric](38, 2) NULL,
	[gen_vol_tot] [numeric](38, 2) NULL,
	[rx_vol_tot] [numeric](38, 2) NULL,
	[compliancePerc] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Genericare_Rank]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Genericare_Rank](
	[2009 Genricare Utilizers ] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[F3] [nvarchar](255) NULL,
	[F4] [nvarchar](255) NULL,
	[F5] [float] NULL,
	[F6] [float] NULL,
	[F7] [float] NULL,
	[F8] [nvarchar](255) NULL,
	[F9] [nvarchar](255) NULL,
	[F10] [float] NULL,
	[F11] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_gpi_pbm_del_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gpi_pbm_del_del](
	[count] [int] NULL,
	[avg_price_per_unit] [numeric](38, 6) NULL,
	[min_price_per_unit] [numeric](18, 4) NULL,
	[gpi] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR_CH3Q08_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR_CH3Q08_del](
	[acct_no] [varchar](4) NULL,
	[Q308] [numeric](16, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0510_mailmerge]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[corporatename] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](8) NOT NULL,
	[SourceSales] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0510_mailmerge_IPA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_mailmerge_IPA](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[corporatename] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](8) NOT NULL,
	[SourceSales] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [float] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0510_ptjournal]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_ptjournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0510_ptJournal_IPA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_ptJournal_IPA](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0510_ptVendors]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_ptVendors](
	[Vendor ID] [nvarchar](255) NULL,
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
	[Vendor E-mail] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0510_ptVendors_IPA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0510_ptVendors_IPA](
	[Vendor ID] [nvarchar](255) NULL,
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
	[Vendor E-mail] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR1_del](
	[GRID] [int] NULL,
	[FILEID] [int] NULL,
	[DC_NUM] [int] NULL,
	[WHOLESALER_ACCT] [int] NULL,
	[UD_ACCT] [char](4) NULL,
	[VENDOR_ID] [int] NULL,
	[APPLY_DT] [datetime] NULL,
	[ADJUSTMENT_DT] [datetime] NULL,
	[REBATE_PERCENT] [numeric](3, 3) NULL,
	[GEN_VOL_AMT] [numeric](11, 2) NULL,
	[RX_VOL_AMT] [numeric](11, 2) NULL,
	[SUBMITTED_REBATE_AMT] [numeric](12, 2) NULL,
	[PAYBACK_PERCENT] [numeric](4, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GRProposedReport0_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GRProposedReport0_del](
	[ud_acct] [char](4) NULL,
	[totalvol] [float] NULL,
	[rxvol] [numeric](38, 2) NULL,
	[genvol] [numeric](38, 2) NULL,
	[GCRate] [numeric](38, 6) NULL,
	[CalcRebate] [float] NULL,
	[RebatePercent] [float] NULL,
	[ProposedRebate] [float] NULL,
	[EffectivePercent] [float] NULL,
	[Change] [float] NULL,
	[ChangePercent] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GRProposedReport1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GRProposedReport1_del](
	[ud_acct] [char](4) NULL,
	[totalvol] [float] NULL,
	[rxvol] [numeric](38, 2) NULL,
	[genvol] [numeric](38, 2) NULL,
	[GCRate] [numeric](38, 6) NULL,
	[CalcRebate] [float] NULL,
	[RebatePercent] [float] NULL,
	[ProposedRebate] [float] NULL,
	[EffectivePercent] [float] NULL,
	[Change] [float] NULL,
	[ChangePercent] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GRProposedReport2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GRProposedReport2_del](
	[store] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[eff] [datetime] NULL,
	[acct_no] [varchar](4) NULL,
	[ud_acct] [char](4) NULL,
	[totalvol] [float] NULL,
	[rxvol] [numeric](38, 2) NULL,
	[genvol] [numeric](38, 2) NULL,
	[GCRate] [numeric](38, 6) NULL,
	[CalcRebate] [float] NULL,
	[RebatePercent] [float] NULL,
	[ProposedRebate] [float] NULL,
	[EffectivePercent] [float] NULL,
	[Change] [float] NULL,
	[ChangePercent] [float] NULL,
	[COGS] [float] NULL,
	[terms] [nvarchar](4000) NULL,
	[ProposedOriginal] [float] NULL,
	[EffPctOriginal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_import_AAPConvTrack]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_import_AAPConvTrack](
	[AAP#] [nvarchar](255) NULL,
	[Parent] [nvarchar](255) NULL,
	[Aff#] [varchar](255) NULL,
	[DC] [varchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Master#] [varchar](255) NULL,
	[AAP Member Start Date] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Store#] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEA Exp] [datetime] NULL,
	[SBOP] [nvarchar](255) NULL,
	[SBOP Exp] [datetime] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Date Documentation Sent to CCDB] [datetime] NULL,
	[New AAP Affiliation] [varchar](255) NULL,
	[New Rx COGs] [float] NULL,
	[New Store Number] [nvarchar](255) NULL,
	[Committed Volume] [money] NULL,
	[Terms] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL,
	[Field27] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_IPA_CA_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_IPA_CA_del](
	[store] [varchar](65) NULL,
	[acct_no] [varchar](4) NULL,
	[memstore] [varchar](25) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Group Designation] [varchar](50) NULL,
	[WHOLESALER ACCT#] [varchar](15) NULL,
	[COG%] [numeric](38, 4) NULL,
	[Payment Terms] [varchar](50) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[GEN_July_2008] [numeric](38, 4) NULL,
	[GEN_July_2008_GCR] [numeric](38, 4) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[GEN_August_2008] [numeric](38, 4) NULL,
	[GEN_August_2008_GCR] [numeric](38, 4) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[GEN_September_2008] [numeric](38, 4) NULL,
	[GEN_September_2008_GCR] [numeric](38, 4) NULL,
	[Q3_2008] [numeric](38, 4) NULL,
	[GEN_Q3_2008] [numeric](38, 4) NULL,
	[GEN_Q3_2008_GCR] [numeric](38, 4) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[GEN_October_2008] [numeric](38, 4) NULL,
	[GEN_October_2008_GCR] [numeric](38, 4) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[GEN_November_2008] [numeric](38, 4) NULL,
	[GEN_November_2008_GCR] [numeric](38, 4) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[GEN_December_2008] [numeric](38, 4) NULL,
	[GEN_December_2008_GCR] [numeric](38, 4) NULL,
	[Q4_2008] [numeric](38, 4) NULL,
	[GEN_Q4_2008] [numeric](38, 4) NULL,
	[GEN_Q4_2008_GCR] [numeric](38, 4) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[GEN_January_2009] [numeric](38, 4) NULL,
	[GEN_January_2009_GCR] [numeric](38, 4) NULL,
	[February_2009] [numeric](38, 2) NULL,
	[GEN_February_2009] [numeric](38, 4) NULL,
	[GEN_February_2009_GCR] [numeric](38, 4) NULL,
	[March_2009] [numeric](38, 2) NULL,
	[GEN_March_2009] [numeric](38, 4) NULL,
	[GEN_March_2009_GCR] [numeric](38, 4) NULL,
	[Q1_2009] [numeric](38, 4) NULL,
	[GEN_Q1_2009] [numeric](38, 4) NULL,
	[GEN_Q1_2009_GCR] [numeric](38, 4) NULL,
	[April_2009] [numeric](38, 2) NULL,
	[GEN_April_2009] [numeric](38, 4) NULL,
	[GEN_April_2009_GCR] [numeric](38, 4) NULL,
	[May_2009] [numeric](38, 2) NULL,
	[GEN_May_2009] [numeric](38, 4) NULL,
	[GEN_May_2009_GCR] [numeric](38, 4) NULL,
	[June_2009] [numeric](38, 2) NULL,
	[GEN_June_2009] [numeric](38, 4) NULL,
	[GEN_June_2009_GCR] [numeric](38, 4) NULL,
	[Q2_2009] [numeric](38, 4) NULL,
	[GEN_Q2_2009] [numeric](38, 4) NULL,
	[GEN_Q2_2009_GCR] [numeric](38, 4) NULL,
	[July_2009] [numeric](38, 2) NULL,
	[GEN_July_2009] [numeric](38, 4) NULL,
	[GEN_July_2009_GCR] [numeric](38, 4) NULL,
	[Total Purchases] [numeric](38, 2) NULL,
	[Total Generic] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_jmw_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_del](
	[ud_acct] [char](4) NULL,
	[generic] [numeric](38, 2) NULL,
	[brand] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_jmw_wac_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_wac_del](
	[gcn] [numeric](5, 0) NULL,
	[RxCount] [int] NULL,
	[QtyDisp] [int] NULL,
	[TotalAWP] [numeric](38, 4) NULL,
	[PatientPaid] [numeric](38, 4) NULL,
	[TotalPaid] [numeric](38, 4) NULL,
	[CARDPrice] [numeric](18, 4) NULL,
	[TotalWAC] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_JMWClaims_GT90_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_JMWClaims_GT90_bkp_del](
	[NABP] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_JMWClaims_GT90_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_JMWClaims_GT90_del](
	[NABP] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC NDC] [numeric](28, 4) NULL,
	[TotalWAC GCN] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL,
	[UNIT PRICE BY NDC] [numeric](28, 4) NULL,
	[UNIT PRICE BY GCN] [numeric](28, 4) NULL,
	[RxNbr] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_JMWClaims_GT90_MultRx_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_JMWClaims_GT90_MultRx_del](
	[NABP] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC NDC] [numeric](28, 4) NULL,
	[TotalWAC GCN] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL,
	[UNIT PRICE BY NDC] [numeric](28, 4) NULL,
	[UNIT PRICE BY GCN] [numeric](28, 4) NULL,
	[RxNbr] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_june_chph_1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_june_chph_1_del](
	[ID] [int] NOT NULL,
	[STORE] [varchar](31) NULL,
	[JUNE_08] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MagmaClaims_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MagmaClaims_del](
	[NABP] [nvarchar](50) NULL,
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MagmaClaims90_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MagmaClaims90_del](
	[BIN] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group] [nvarchar](50) NULL,
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](150) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MagmaClaimsold_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MagmaClaimsold_del](
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [int] NULL,
	[TRx Quantity Dispensed] [int] NULL,
	[Total  AWP] [numeric](28, 4) NULL,
	[Patient Paid Amount] [numeric](28, 4) NULL,
	[Total Paid Amount] [numeric](28, 4) NULL,
	[Dispensing Fee Amount] [numeric](28, 4) NULL,
	[Total Ingredient Cost] [numeric](28, 4) NULL,
	[Usual Customary Amount] [numeric](28, 4) NULL,
	[TotalWAC] [numeric](28, 4) NULL,
	[UDS] [numeric](28, 4) NULL,
	[Top100] [numeric](28, 4) NULL,
	[GCN] [varchar](50) NULL,
	[ProjPaid] [numeric](28, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NCDV]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCDV](
	[Chain Code] [float] NULL,
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Mailing Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[FedID] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEAEXP] [datetime] NULL,
	[StateLicNo] [nvarchar](255) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateMedicaidNo] [nvarchar](255) NULL,
	[Claim Count] [float] NULL,
	[Unique Member Count] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ndc_ryzolt_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ndc_ryzolt_bkp_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[NDC 59011033430 Qty] [numeric](38, 0) NULL,
	[NDC 59011033530 Qty] [int] NULL,
	[NDC 59011033630 Qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ndc_ryzolt_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ndc_ryzolt_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[NDC 59011033430 Qty] [numeric](38, 0) NULL,
	[NDC 59011033530 Qty] [int] NULL,
	[NDC 59011033630 Qty] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ndc_sales_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ndc_sales_del](
	[ID] [int] NOT NULL,
	[ndc] [varchar](15) NULL,
	[YTD_Sales] [float] NULL,
	[PctTotalSales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_no_chph_stores_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_no_chph_stores_del](
	[acct_no] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_okdelete_scott052510]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_okdelete_scott052510](
	[Pharmacy] [nvarchar](255) NULL,
	[NABP] [nvarchar](255) NULL,
	[Card Acct Num] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[PMID] [numeric](29, 0) NULL,
	[AAPID] [numeric](29, 0) NULL,
	[API Account] [nvarchar](255) NULL,
	[Territory] [nvarchar](255) NULL,
	[Vendor Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Trade Name] [nvarchar](255) NULL,
	[CIN] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[Strength] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[UD] [nvarchar](255) NULL,
	[Vendor Abbr] [nvarchar](255) NULL,
	[Base Cost] [money] NULL,
	[Units] [float] NULL,
	[Dollars] [money] NULL,
	[MS % Cust#] [float] NULL,
	[MS % Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_mailmerge]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[StoreName] [varchar](65) NULL,
	[TaxName] [varchar](100) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Patr Div] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_ptJournal]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_ptJournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](11) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [float] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_ptVendors]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_ptVendors](
	[Vendor ID] [nvarchar](255) NULL,
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
	[Vendor E-mail] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PDiv1209_Sales]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PDiv1209_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[AAPParent] [varchar](20) NULL,
	[API#] [nvarchar](255) NULL,
	[UD#] [nvarchar](255) NULL,
	[territory] [varchar](4) NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit Address] [varchar](100) NULL,
	[Remit Address2] [varchar](100) NULL,
	[Remit City] [varchar](50) NULL,
	[Remit State] [varchar](2) NULL,
	[Remit Zip] [varchar](50) NULL,
	[Dividend] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_pharm_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pharm_del](
	[Pharm ID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_qtr_admin]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_admin](
	[acct_no] [varchar](5) NULL,
	[Q4_2007] [numeric](16, 2) NULL,
	[Q4_2008] [numeric](16, 2) NULL,
	[QQ_PCT_CHG] [numeric](36, 19) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_qtr_admin_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_admin_AAP](
	[acct_no] [varchar](5) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2009] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_qtr_admin_AAP_ST]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_admin_AAP_ST](
	[acct_no] [varchar](8) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_qtr_admin_bkp]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_admin_bkp](
	[acct_no] [varchar](4) NULL,
	[Q1_2008] [float] NULL,
	[Q1_2009] [float] NULL,
	[QQ_PCT_CHG] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_qtr_sales_detail]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_sales_detail](
	[Quarter] [varchar](2) NOT NULL,
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[Q_FY_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_qtr_sales_detail_2008]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_qtr_sales_detail_2008](
	[Quarter] [varchar](2) NOT NULL,
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[Q_FY_2008] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report_delete_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_delete_del](
	[type] [varchar](15) NULL,
	[fytd08all] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report_samestore]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_samestore](
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[fytd09ss] [numeric](38, 2) NULL,
	[fytd08ss] [numeric](38, 2) NULL,
	[stores_purchasing_fytd09] [int] NULL,
	[fytd09all] [numeric](38, 2) NULL,
	[stores_purchasing_fytd08] [int] NULL,
	[fytd08all] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report_samestore_detail]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_samestore_detail](
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[fytd09ss] [numeric](38, 2) NULL,
	[fytd08ss] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Rxcare_Rank]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Rxcare_Rank](
	[2009 RxCare Select Utilizers ] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[F3] [nvarchar](255) NULL,
	[F4] [nvarchar](255) NULL,
	[F5] [nvarchar](255) NULL,
	[F6] [nvarchar](255) NULL,
	[F7] [float] NULL,
	[F8] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SalesByCustomer#]    Script Date: 12/22/2020 3:43:54 AM ******/
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
/****** Object:  Table [dbo].[tmp_samestore]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore](
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[FYTD_2010_SS] [numeric](38, 2) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_SS_PERC_CHG] [numeric](38, 4) NULL,
	[Stores_Purchasing_FYTD_2010] [numeric](38, 0) NULL,
	[FYTD_2010_ALL] [numeric](38, 2) NULL,
	[Stores_Purchasing_FYTD_2009] [numeric](38, 0) NULL,
	[FYTD_2009_ALL] [numeric](38, 2) NULL,
	[FYTD_ALL_PERC_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_AAP](
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL,
	[FYTD_SS_PERC_CHG] [numeric](38, 4) NULL,
	[Stores_Purchasing_FYTD_2009] [numeric](38, 0) NULL,
	[FYTD_2009_ALL] [numeric](38, 2) NULL,
	[Stores_Purchasing_FYTD_2008] [numeric](38, 0) NULL,
	[FYTD_2008_ALL] [numeric](38, 2) NULL,
	[FYTD_ALL_PERC_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_bkp_2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_bkp_2_del](
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL,
	[FYTD_SS_PERC_CHG] [numeric](38, 4) NULL,
	[Stores_Purchasing_FYTD_2009] [numeric](38, 0) NULL,
	[FYTD_2009_ALL] [numeric](38, 2) NULL,
	[Stores_Purchasing_FYTD_2008] [numeric](38, 0) NULL,
	[FYTD_2008_ALL] [numeric](38, 2) NULL,
	[FYTD_ALL_PERC_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_bkp_3_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_bkp_3_del](
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL,
	[FYTD_SS_PERC_CHG] [numeric](38, 4) NULL,
	[Stores_Purchasing_FYTD_2009] [numeric](38, 0) NULL,
	[FYTD_2009_ALL] [numeric](38, 2) NULL,
	[Stores_Purchasing_FYTD_2008] [numeric](38, 0) NULL,
	[FYTD_2008_ALL] [numeric](38, 2) NULL,
	[FYTD_ALL_PERC_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_bkp_del](
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL,
	[FYTD_SS_PERC_CHG] [numeric](38, 4) NULL,
	[Stores_Purchasing_FYTD_2009] [numeric](38, 0) NULL,
	[FYTD_2009_ALL] [numeric](38, 2) NULL,
	[Stores_Purchasing_FYTD_2008] [numeric](38, 0) NULL,
	[FYTD_2008_ALL] [numeric](38, 2) NULL,
	[FYTD_ALL_PERC_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_detail]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_detail](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](5) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FYTD_2010_SS] [numeric](38, 2) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_detail_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_detail_AAP](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](8) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_detail_bkp_2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_detail_bkp_2_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_detail_bkp_3_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_detail_bkp_3_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_samestore_detail_bkp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_detail_bkp_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_slximport2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_slximport2](
	[accountid] [nvarchar](50) NULL,
	[udacctno] [nvarchar](50) NULL,
	[monthvolumeavg] [numeric](38, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_slximport3]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_slximport3](
	[accountid] [nvarchar](50) NULL,
	[udacctno] [nvarchar](50) NULL,
	[monthvolumeavg] [numeric](38, 2) NOT NULL,
	[Store Number] [nvarchar](50) NULL,
	[Expr1] [int] NULL,
	[payterm] [nvarchar](50) NULL,
	[cogs] [nvarchar](50) NULL,
	[gc] [real] NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ssreport_delete_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ssreport_delete_del](
	[type] [varchar](15) NULL,
	[Stores_Purchasing_FYTD_2008] [int] NULL,
	[FYTD_2008_ALL] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_startup_store_rpt]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_startup_store_rpt](
	[fy_end] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[Effective] [varchar](10) NULL,
	[acct_no] [varchar](4) NULL,
	[nsterritory] [varchar](2) NULL,
	[June] [numeric](38, 2) NULL,
	[July] [numeric](38, 2) NULL,
	[August] [numeric](38, 2) NULL,
	[September] [numeric](38, 2) NULL,
	[October] [numeric](38, 2) NULL,
	[November] [numeric](38, 2) NULL,
	[December] [numeric](38, 2) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL,
	[May] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_startup_store_rpt_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_startup_store_rpt_AAP](
	[year] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[Effective] [varchar](10) NULL,
	[acct_no] [varchar](8) NULL,
	[nsterritory] [varchar](2) NULL,
	[June] [numeric](38, 2) NULL,
	[July] [numeric](38, 2) NULL,
	[August] [numeric](38, 2) NULL,
	[September] [numeric](38, 2) NULL,
	[October] [numeric](38, 2) NULL,
	[November] [numeric](38, 2) NULL,
	[December] [numeric](38, 2) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL,
	[May] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_sum]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_sum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_sum_chph_1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_sum_chph_1](
	[ID] [int] NOT NULL,
	[STORE] [varchar](31) NULL,
	[EXT_COST] [float] NULL,
	[MONTH_DATE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_sum_june_chph_1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_sum_june_chph_1](
	[ID] [int] NOT NULL,
	[STORE] [varchar](31) NULL,
	[EXT_COST] [float] NULL,
	[MONTH_DATE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_terr_A_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_terr_A_del](
	[acct_no] [varchar](4) NULL,
	[terr] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_terr_B_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_terr_B_del](
	[acct_no] [varchar](4) NULL,
	[terr] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_test_ch_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test_ch_del](
	[store] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_test_ch1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test_ch1_del](
	[store] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_test_jmw_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test_jmw_del](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[vendor] [varchar](64) NULL,
	[vendor_id] [int] NULL,
	[december] [numeric](14, 2) NULL,
	[january] [numeric](14, 2) NULL,
	[Qtr_Total] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_test_sum_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test_sum_del](
	[store] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_test_sum1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test_sum1_del](
	[store] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_TestSSIS]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_TestSSIS](
	[Change Type] [nvarchar](255) NULL,
	[General Description] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[UM] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[CIN] [float] NULL,
	[DP] [float] NULL,
	[Old Price] [money] NULL,
	[New Price] [money] NULL,
	[WAC] [money] NULL,
	[F12] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Reason Code] [nvarchar](255) NULL,
	[Effect Dte] [datetime] NULL,
	[UOM] [nvarchar](255) NULL,
	[20% Increase] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Top100PriceNew]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Top100PriceNew](
	[CIN] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[ PSB Sell ] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[UOM] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 6) NULL,
	[GPI] [nvarchar](50) NULL,
	[GCN] [nvarchar](50) NULL,
	[GCNSEQ] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trend_ADMIN_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_ADMIN_AAP](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[July_2009] [numeric](38, 2) NULL,
	[August_2009] [numeric](38, 2) NULL,
	[September_2009] [numeric](38, 2) NULL,
	[October_2009] [numeric](38, 2) NULL,
	[November_2009] [numeric](38, 2) NULL,
	[December_2009] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_2010] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2009] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[February_2010] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL,
	[Delta] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trend_ADMIN_AAP_ST]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_ADMIN_AAP_ST](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_2008] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[February_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL,
	[Delta] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trend_ADMIN_AAP1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_ADMIN_AAP1](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[June_2008] [numeric](38, 2) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[December_2007] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL,
	[Delta] [numeric](38, 4) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trend_ADMIN_BY_STORE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_ADMIN_BY_STORE](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[October_2009] [numeric](38, 2) NULL,
	[November_2009] [numeric](38, 2) NULL,
	[December_2009] [numeric](38, 2) NULL,
	[January_2010] [numeric](38, 2) NULL,
	[February_2010] [numeric](38, 2) NULL,
	[March_2010] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[April_2010] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[April_2009] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q1_2010] [numeric](38, 2) NULL,
	[Q1_2009] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[May_2010] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL,
	[Delta] [numeric](38, 4) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trend_SLX]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_SLX](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[July_08] [numeric](14, 2) NULL,
	[August_08] [numeric](14, 2) NULL,
	[September_08] [numeric](14, 2) NULL,
	[October_08] [numeric](14, 2) NULL,
	[November_08] [numeric](14, 2) NULL,
	[December_08] [numeric](14, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_09] [numeric](14, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_08] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[QTR_4_08] [numeric](38, 2) NULL,
	[QTR_4_07] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trend_test_ADMIN]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_test_ADMIN](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_2008] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[February_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL,
	[Delta] [numeric](38, 4) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0208_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0208_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[Aug07] [numeric](38, 2) NULL,
	[Sep07] [numeric](38, 2) NULL,
	[Oct07] [numeric](38, 2) NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Feb07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q407] [numeric](38, 2) NULL,
	[Q406] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0209_status_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0209_status_del](
	[dt] [datetime] NOT NULL,
	[status] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0209_vpri_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0209_vpri_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Aug08] [numeric](14, 2) NULL,
	[Sep08] [numeric](14, 2) NULL,
	[Oct08] [numeric](14, 2) NULL,
	[Nov08] [numeric](14, 2) NULL,
	[Dec08] [numeric](14, 2) NULL,
	[Jan09] [numeric](14, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Feb09] [numeric](14, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q408] [numeric](16, 2) NULL,
	[Q407] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0209_vsum_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0209_vsum_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Aug08] [numeric](38, 2) NULL,
	[Sep08] [numeric](38, 2) NULL,
	[Oct08] [numeric](38, 2) NULL,
	[Nov08] [numeric](38, 2) NULL,
	[Dec08] [numeric](38, 2) NULL,
	[Jan09] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Feb09] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q408] [numeric](38, 2) NULL,
	[Q407] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0308_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0308_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[Sep07] [numeric](38, 2) NULL,
	[Oct07] [numeric](38, 2) NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Mar07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](38, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0408_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0408_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[Oct07] [numeric](38, 2) NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Apr08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Apr07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](38, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0408_v2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0408_v2_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[Oct07] [numeric](38, 2) NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Apr08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Apr07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](38, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0508_vpri_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0508_vpri_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Nov07] [numeric](14, 2) NULL,
	[Dec07] [numeric](14, 2) NULL,
	[Jan08] [numeric](14, 2) NULL,
	[Feb08] [numeric](14, 2) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[May07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](16, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0508_vsum_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0508_vsum_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[Apr08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[May08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[May07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](38, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0708_final_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0708_final_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Jan08] [numeric](14, 2) NULL,
	[Feb08] [numeric](14, 2) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[Jun08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Jul08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Jul07] [numeric](14, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q208] [numeric](38, 2) NULL,
	[Q207] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL,
	[ow_jul08] [numeric](38, 2) NULL,
	[ow_avg6mo] [numeric](38, 2) NULL,
	[sprimaryws] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0708_status_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0708_status_del](
	[dt] [datetime] NOT NULL,
	[status] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0708_vpri_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0708_vpri_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Jan08] [numeric](14, 2) NULL,
	[Feb08] [numeric](14, 2) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[Jun08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Jul08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Jul07] [numeric](14, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q208] [numeric](38, 2) NULL,
	[Q207] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0708_vsum_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0708_vsum_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[Apr08] [numeric](38, 2) NULL,
	[May08] [numeric](38, 2) NULL,
	[jun08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Jul08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Jul07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q208] [numeric](38, 2) NULL,
	[Q207] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0908_status_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0908_status_del](
	[dt] [datetime] NOT NULL,
	[status] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0908_vpri_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0908_vpri_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[Jun08] [numeric](38, 2) NULL,
	[Jul08] [numeric](38, 2) NULL,
	[Aug08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Sep08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Sep07] [numeric](14, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q308] [numeric](38, 2) NULL,
	[Q307] [numeric](16, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendreport0908_vsum_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0908_vsum_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[Apr08] [numeric](38, 2) NULL,
	[May08] [numeric](38, 2) NULL,
	[jun08] [numeric](38, 2) NULL,
	[Jul08] [numeric](38, 2) NULL,
	[Aug08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Sep08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Sep07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q308] [numeric](38, 2) NULL,
	[Q307] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_trendReportGR1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendReportGR1_del](
	[acct_no] [char](4) NULL,
	[month] [datetime] NULL,
	[rxvol] [numeric](38, 2) NULL,
	[genvol] [numeric](38, 2) NULL,
	[submitted_rebate] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_Anda]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_Anda](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_AndaGen]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_AndaGen](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_CH]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_CH](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_ML]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_ML](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_MLGEN]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_MLGEN](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udvolrollup_Parmed]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udvolrollup_Parmed](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[udaccountno] [varchar](20) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udVolume_changes]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udVolume_changes](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[filled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_udVolume_changes_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_udVolume_changes_del](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[filled] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_vendorMontotYY2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorMontotYY2_del](
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[vendorpair] [nvarchar](50) NULL,
	[factor] [numeric](16, 15) NULL,
	[Vol2008] [numeric](38, 2) NULL,
	[Vol2007] [float] NULL,
	[Rebate2008] [float] NULL,
	[Rebate2007] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_vendorVList_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorVList_del](
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_vendorVList2_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorVList2_del](
	[vendor_idV] [int] NULL,
	[vendor_idR] [int] NOT NULL,
	[vendor] [varchar](64) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Vol_Anda_SLX_VAL]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Vol_Anda_SLX_VAL](
	[nabp] [varchar](7) NULL,
	[slxvalue] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Vol_Anda_SLX_VAL_DEA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Vol_Anda_SLX_VAL_DEA](
	[DEA] [varchar](20) NULL,
	[slxvalue] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Vol_Avg6mo_SLX_VAL]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Vol_Avg6mo_SLX_VAL](
	[nabp] [varchar](7) NULL,
	[slxvalue] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Vol_Avg6mo_SLX_VAL_DEA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Vol_Avg6mo_SLX_VAL_DEA](
	[DEA] [varchar](20) NULL,
	[slxvalue] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_vol_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vol_del](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TABLE_TYPE] [varchar](50) NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_VOL_LOAD_SLX]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VOL_LOAD_SLX](
	[Store_Name] [varchar](8000) NULL,
	[acct_no] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[ANDA_QTR_TOTAL] [numeric](16, 2) NULL,
	[PARMED_QTR_TOTAL] [numeric](16, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_VOL_LOAD_SLX_AAP]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VOL_LOAD_SLX_AAP](
	[Store_Name] [varchar](8000) NULL,
	[acct_no] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[ANDA_QTR_TOTAL] [numeric](38, 2) NULL,
	[PARMED_QTR_TOTAL] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_VOL_LOAD_SLX_AUTO]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_VOL_LOAD_SLX_AUTO](
	[Store_Name] [varchar](8000) NULL,
	[acct_no] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[ANDA_QTR_TOTAL] [numeric](16, 2) NULL,
	[PARMED_QTR_TOTAL] [numeric](16, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Vol_Parmed_SLX_VAL]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Vol_Parmed_SLX_VAL](
	[nabp] [varchar](7) NULL,
	[slxvalue] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Vol_Parmed_SLX_VAL_DEA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Vol_Parmed_SLX_VAL_DEA](
	[DEA] [varchar](20) NULL,
	[slxvalue] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_WSPrice_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WSPrice_del](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[UOM] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_wspriceall_07109_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wspriceall_07109_del](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_wsvolume_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wsvolume_del](
	[ACCT_NO] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[EFFECTIVE] [datetime] NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[Month1] [numeric](14, 2) NULL,
	[Month2] [numeric](14, 2) NULL,
	[MChange] [numeric](14, 2) NULL,
	[Q1] [numeric](14, 2) NULL,
	[Q2] [numeric](14, 2) NULL,
	[QChange] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport](
	[Year] [char](4) NOT NULL,
	[vendorid] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[Rq1] [numeric](38, 2) NULL,
	[Rq2] [numeric](38, 2) NULL,
	[Rq3] [numeric](38, 2) NULL,
	[Rq4] [numeric](38, 2) NULL,
	[Ryeartot] [numeric](38, 2) NULL,
	[Vq1] [numeric](38, 2) NULL,
	[Vq2] [numeric](38, 2) NULL,
	[Vq3] [numeric](38, 2) NULL,
	[Vq4] [numeric](38, 2) NULL,
	[Vyeartot] [numeric](38, 2) NULL,
	[Sq1] [int] NULL,
	[Sq2] [int] NULL,
	[Sq3] [int] NULL,
	[Sq4] [int] NULL,
	[Syeartot] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step1]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step1](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step2](
	[vendor_id] [int] NULL,
	[date] [datetime] NULL,
	[volume] [numeric](38, 2) NULL,
	[vendorpair] [nvarchar](50) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step3]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step3](
	[vendor_id] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[qscal] [nvarchar](6) NULL,
	[qcal] [int] NULL,
	[ycal] [int] NULL,
	[volume] [numeric](38, 2) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step3_cal]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step3_cal](
	[vendor_id] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[qscal] [nvarchar](6) NULL,
	[qcal] [int] NULL,
	[ycal] [int] NULL,
	[volume] [numeric](38, 2) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step3_fy]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step3_fy](
	[vendor_id] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[qsfy] [nvarchar](6) NULL,
	[qfy] [int] NULL,
	[yfy] [int] NULL,
	[volume] [numeric](38, 2) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_yyreport_stepA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_stepA](
	[vendorname] [nvarchar](25) NOT NULL,
	[status] [int] NULL,
	[oldvendorid] [int] NULL,
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[vendorpair] [int] NULL,
	[fy_end1] [varchar](4) NULL,
	[acct_no1] [varchar](4) NULL,
	[reports1] [varchar](1) NULL,
	[JANUARY1] [numeric](14, 2) NULL,
	[FEBRUARY1] [numeric](14, 2) NULL,
	[MARCH1] [numeric](14, 2) NULL,
	[APRIL1] [numeric](14, 2) NULL,
	[MAY1] [numeric](14, 2) NULL,
	[JUNE1] [numeric](14, 2) NULL,
	[JULY1] [numeric](14, 2) NULL,
	[AUGUST1] [numeric](14, 2) NULL,
	[SEPTEMBER1] [numeric](14, 2) NULL,
	[OCTOBER1] [numeric](14, 2) NULL,
	[NOVEMBER1] [numeric](14, 2) NULL,
	[DECEMBER1] [numeric](14, 2) NULL,
	[MONTOT1] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpSLXAPI]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpSLXAPI](
	[SLX_accountID] [varchar](12) NULL,
	[SLX_ncpdp] [varchar](32) NULL,
	[SLX_city] [varchar](32) NULL,
	[SLX_state] [varchar](32) NULL,
	[SLX_territory] [varchar](32) NULL,
	[SLX_name] [varchar](128) NULL,
	[SLX_DEA] [varchar](15) NULL,
	[SLX_udacctno] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpSLXDEA]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpSLXDEA](
	[accountID] [varchar](12) NULL,
	[ncpdp] [varchar](32) NULL,
	[city] [varchar](32) NULL,
	[state] [varchar](32) NULL,
	[territory] [varchar](32) NULL,
	[name] [varchar](128) NULL,
	[DEA] [varchar](15) NULL,
	[udacctno] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpslxdea_prod]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpslxdea_prod](
	[accountID] [varchar](12) NULL,
	[ncpdp] [varchar](32) NULL,
	[city] [varchar](32) NULL,
	[state] [varchar](32) NULL,
	[territory] [varchar](32) NULL,
	[name] [varchar](128) NULL,
	[DEA] [varchar](15) NULL,
	[udacctno] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpSLXDEA_test]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpSLXDEA_test](
	[accountID] [varchar](12) NULL,
	[ncpdp] [varchar](32) NULL,
	[city] [varchar](32) NULL,
	[state] [varchar](32) NULL,
	[territory] [varchar](32) NULL,
	[name] [varchar](128) NULL,
	[DEA] [varchar](15) NULL,
	[udacctno] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraditionalMatrix_CAHAccts]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraditionalMatrix_CAHAccts](
	[PMID] [float] NULL,
	[Matrix] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transit_SLX_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transit_SLX_del](
	[ACCT_NO] [nvarchar](50) NULL,
	[ACCOUNTID] [nvarchar](50) NULL,
	[MSGRP] [nvarchar](50) NULL,
	[MULTISTORES] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_auth_user_jmw]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_auth_user_jmw](
	[USER_ID] [nvarchar](32) NULL,
	[USERNAME] [nvarchar](32) NULL,
	[PASSWORD] [nvarchar](32) NULL,
	[PERMS] [nvarchar](255) NULL,
	[OPT_IN] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_CONTACT]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_CONTACT](
	[CONTACT_ID] [int] NULL,
	[XREF_ID] [int] NULL,
	[XREF_TYPE] [char](6) NULL,
	[FIRST_NAME] [varchar](20) NULL,
	[LAST_NAME] [varchar](50) NULL,
	[TITLE] [varchar](60) NULL,
	[VOICE_AREA] [char](3) NULL,
	[VOICE_LOCAL] [char](7) NULL,
	[FAX_AREA] [char](3) NULL,
	[FAX_LOCAL] [char](7) NULL,
	[EMAIL] [varchar](64) NULL,
	[COMMENT] [varchar](254) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [char](2) NULL,
	[ZIP] [varchar](10) NULL,
	[CONTACT_TYPE] [varchar](15) NULL,
	[ADDRESS1] [varchar](40) NULL,
	[ADDRESS2] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_CONTRACT_NETWORK_TYPE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_CONTRACT_NETWORK_TYPE](
	[CONTRACT_ID] [int] NULL,
	[CONTRACT_TYPE_ID] [int] NULL,
	[NETWORK_TYPE_ID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_CONTRACT_TYPE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_CONTRACT_TYPE](
	[CONTRACT_TYPE_ID] [int] NULL,
	[DESCRIPTION] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_MC_CONTRACT_OPTION]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_MC_CONTRACT_OPTION](
	[MCCOD_ID] [int] NULL,
	[OPT_ID] [int] NULL,
	[CONTRACT_ID] [int] NULL,
	[SUB_OPT] [char](10) NULL,
	[OPT_START_DT] [datetime] NULL,
	[OPT_END_DT] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_MC_OPTION]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_MC_OPTION](
	[OPT_ID] [int] NULL,
	[OPT_DESCRIPTION] [varchar](65) NULL,
	[ABBREVIATION] [char](8) NULL,
	[SUB_OPTIONS] [varchar](30) NULL,
	[ACTIVE] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_NETWORK_TYPE]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_NETWORK_TYPE](
	[NETWORK_TYPE_ID] [int] NULL,
	[DESCRIPTION] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_PLAN_CONTRACT]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_PLAN_CONTRACT](
	[CONTRACT_ID] [int] NULL,
	[SERVICE_AREA] [varchar](100) NULL,
	[EFFECTIVE_DT] [datetime] NULL,
	[INDIVIDUAL_AGREEMENT] [smallint] NULL,
	[MEMBERS] [int] NULL,
	[INCLUDES_RURAL] [smallint] NULL,
	[POS_CHARGE] [numeric](6, 2) NULL,
	[MAND_FORMULARY] [char](6) NULL,
	[MAND_GEN_SUB] [char](6) NULL,
	[BRAND_REIMB] [varchar](255) NULL,
	[GEN_REIMB] [varchar](255) NULL,
	[PAY_METHOD] [varchar](40) NULL,
	[PAY_FREQ] [varchar](90) NULL,
	[BILL_TIME_LIMIT] [varchar](60) NULL,
	[ADD_INFO] [varchar](700) NULL,
	[CLIENT_DESC] [char](3) NULL,
	[ACTIVE] [smallint] NULL,
	[SIGNED_CONTRACT] [smallint] NULL,
	[EXPIRATION_DT] [datetime] NULL,
	[CANCEL_DT] [datetime] NULL,
	[NOTIFY] [smallint] NULL,
	[NOTIFY_NOTES] [varchar](200) NULL,
	[NOTIFY_DIR] [smallint] NULL,
	[NOTIFY_CO] [varchar](90) NULL,
	[COPAY] [varchar](47) NULL,
	[ADMIN_FEE] [varchar](248) NULL,
	[COPAY_MIN] [varchar](49) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[UPDATE_BY] [char](10) NULL,
	[AUDIT] [varchar](200) NULL,
	[LIABILITY] [varchar](110) NULL,
	[CONTRACT_TYPE] [varchar](25) NULL,
	[AUTO_RENEWAL] [smallint] NULL,
	[PLAN_NAME] [varchar](134) NULL,
	[ENVOY_BIN] [varchar](20) NULL,
	[ANSI_BIN] [varchar](6) NULL,
	[PRIOR_AUTHORIZATION] [smallint] NULL,
	[PCN] [varchar](28) NULL,
	[GROUP_NUM] [varchar](20) NULL,
	[ADD_NOTIFY] [smallint] NULL,
	[INCLUDES_ALASKA] [smallint] NULL,
	[NOTIFY_FORMAT] [char](3) NULL,
	[WEBSITE] [varchar](50) NULL,
	[PA_NOTE] [varchar](50) NULL,
	[PRICE_UPDATES] [varchar](12) NULL,
	[UPDATE_SOURCE] [varchar](20) NULL,
	[MSB_REIMB] [varchar](200) NULL,
	[ATTACH_KEY] [int] NULL,
	[PARENT_COMPANY] [varchar](134) NULL,
	[SSB_AWP_PCT] [float] NULL,
	[SSB_AWP_FEE] [float] NULL,
	[GEN_MAC_AMT] [float] NULL,
	[GEN_AWP_PCT] [float] NULL,
	[GEN_AWP_FEE] [float] NULL,
	[SSG_AWP_PCT] [float] NULL,
	[SSG_AWP_FEE] [float] NULL,
	[REMITTANCE_COMMENT] [varchar](255) NULL,
	[NETWORK_TYPE] [varchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_WEB_PLAN_CONTRACT_ATTACHMENT]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_WEB_PLAN_CONTRACT_ATTACHMENT](
	[ATTACH_KEY] [int] NULL,
	[ATTACHMENT] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ud_wholesaler_store]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_wholesaler_store](
	[WS_ID] [int] NULL,
	[VENDOR_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[ACCT_TYPE] [char](10) NULL,
	[ACCT_NUM] [int] NULL,
	[DC_NUM] [int] NULL,
	[UD_ACCT] [char](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udadmin]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udadmin](
	[Pharmacy Master Record] [int] NULL,
	[UD_ACCT_NO] [varchar](20) NULL,
	[AAP_ACCT_NO] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[TAX ID] [varchar](12) NULL,
	[API_ACCOUNT_NO] [varchar](20) NULL,
	[NAME] [varchar](65) NULL,
	[ADDR1] [varchar](80) NULL,
	[ADDR2] [varchar](80) NULL,
	[CITY] [varchar](25) NULL,
	[STATE] [varchar](2) NULL,
	[ZIP] [varchar](10) NULL,
	[EFFECTIVE NOT PREVIOUS API] [datetime] NULL,
	[UD START DATE] [datetime] NULL,
	[UD QUIT DATE] [datetime] NULL,
	[CARDINAL ADMIN FEES] [numeric](38, 2) NULL,
	[MIAMI LUKEN ADMIN FEES] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udmaster_tmp_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udmaster_tmp_del](
	[WHYMODIFIED] [varchar](100) NULL,
	[CORPNAME] [varchar](50) NULL,
	[DBA] [varchar](50) NULL,
	[STORE] [varchar](65) NULL,
	[MEMSTORE] [varchar](25) NULL,
	[GROUP] [varchar](25) NULL,
	[NON-PHARMACY] [varchar](1) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[ADDR1] [varchar](60) NULL,
	[ADDR2] [varchar](60) NULL,
	[CITY] [varchar](20) NULL,
	[COUNTY] [varchar](50) NULL,
	[STATE] [varchar](2) NULL,
	[ZIP] [varchar](9) NULL,
	[ATTEND] [varchar](2) NULL,
	[COUNCIL] [varchar](20) NULL,
	[COUNCIL NAME] [varchar](30) NULL,
	[AREACODE] [varchar](3) NULL,
	[PHONE1] [varchar](8) NULL,
	[EMERGENCY PHONE] [varchar](15) NULL,
	[FAXAREACODE] [varchar](3) NULL,
	[FAX] [varchar](8) NULL,
	[EMAILADDRESS] [varchar](40) NULL,
	[WEBADDRESS] [varchar](50) NULL,
	[CONTACT_F] [varchar](16) NULL,
	[CONTACT_L] [varchar](20) NULL,
	[CONTACT PERSON'S TITLE] [varchar](20) NULL,
	[BoardOfDirectors] [varchar](50) NULL,
	[OFFICERS/YEAR] [varchar](50) NULL,
	[BOARD POSITION] [varchar](50) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[MDMTERRITORY] [varchar](2) NULL,
	[RESIGNED] [varchar](1) NULL,
	[ARCHIVE] [varchar](1) NULL,
	[FEE_PD] [smallint] NULL,
	[NPP_MBR] [smallint] NULL,
	[FOREIGN_GRP] [varchar](50) NULL,
	[FEDID] [varchar](12) NULL,
	[DEA] [varchar](10) NULL,
	[STATE MED #] [varchar](15) NULL,
	[RURAL] [smallint] NULL,
	[STATE LIC #] [varchar](15) NULL,
	[ON CALL] [varchar](5) NULL,
	[OBRA 90] [varchar](5) NULL,
	[COUNSELING AREA] [varchar](5) NULL,
	[PATIENT MR] [varchar](5) NULL,
	[DRUG INFORMATION] [varchar](5) NULL,
	[FRAUD?] [varchar](1) NULL,
	[FRD_FEL_EXPLAN] [varchar](50) NULL,
	[RX LICENSE SUS/REV] [varchar](5) NULL,
	[SUS_REV_EXPLAN] [varchar](50) NULL,
	[UNRESTRICTED LIC] [varchar](5) NULL,
	[UNRES_LIC_EXPLAN] [varchar](50) NULL,
	[INV/SANC BY MEDICARE] [varchar](5) NULL,
	[JUDGEMENTS] [varchar](5) NULL,
	[COMPLY WITH ADA ACT] [varchar](5) NULL,
	[UAI COVERAGE] [smallint] NULL,
	[PROF LIAB INS] [varchar](5) NULL,
	[PROF LIAB CARRIER] [varchar](30) NULL,
	[PROF POL #] [varchar](20) NULL,
	[PROF LIAB LIMIT 1] [int] NULL,
	[PROF LIAB LIMIT 2] [int] NULL,
	[PROF LIAB INS COF] [varchar](5) NULL,
	[GEN LIAB INS] [varchar](5) NULL,
	[GEN LIAB INS CARRIER] [varchar](30) NULL,
	[GEN LIAB INS POLICY #] [varchar](20) NULL,
	[GEN LIAB LIMIT 1] [int] NULL,
	[GEN LIAB LIMIT 2] [int] NULL,
	[PHAR LIAB INS] [varchar](5) NULL,
	[AVE WAIT TIME] [int] NULL,
	[MEDICATION ERRORS DOCUMENTED] [varchar](5) NULL,
	[NUMBER ERRORS 12 MOS] [smallint] NULL,
	[RESOLUTION POLICY] [varchar](5) NULL,
	[COMPOUND PRESCRIPTIONS] [varchar](5) NULL,
	[UNIT DOSING] [smallint] NULL,
	[DUR MED EQ SVC] [smallint] NULL,
	[IV ADMIXTURE] [smallint] NULL,
	[CERTIFIED DISEASE MGMT] [smallint] NULL,
	[CDM EXPLANATION] [varchar](50) NULL,
	[GROUP PRESENTATIONS] [smallint] NULL,
	[CONTINUING EDUCATION] [varchar](5) NULL,
	[ST BOARD INSP] [varchar](5) NULL,
	[COPY RELEASE INFO] [varchar](5) NULL,
	[NABP] [varchar](7) NULL,
	[BULLETIN] [varchar](3) NULL,
	[STORE SIZE CLASSIFICATION] [varchar](1) NULL,
	[HOLIDAY HOURS] [varchar](20) NULL,
	[HOURS] [varchar](50) NULL,
	[DELIVERY SERVICE] [varchar](6) NULL,
	[EMERGENCY SERVICES] [varchar](6) NULL,
	[ANS MACH/ANS SERVICE] [varchar](4) NULL,
	[ALTERNATIVE LANGUAGES] [varchar](50) NULL,
	[SPECIALTY SERVICES] [varchar](50) NULL,
	[COMPUTER SOFTWARE] [varchar](50) NULL,
	[OUTSIDE ID] [varchar](4) NULL,
	[WHOLESALER NAME] [varchar](15) NULL,
	[WHOLESALER ACCT#] [varchar](15) NULL,
	[DC_NBR] [varchar](3) NULL,
	[COMPETITIVEACCT] [smallint] NULL,
	[GPPFORM] [varchar](5) NULL,
	[GPPLETTER] [varchar](5) NULL,
	[LEAST EXP GEN] [smallint] NULL,
	[HEALTH PLAN CONTACTS] [varchar](100) NULL,
	[UNITED ASSURANCE] [varchar](4) NULL,
	[MEMO LIT SIGN] [varchar](200) NULL,
	[INDOOR LIGHTED SIGN] [varchar](50) NULL,
	[RX CARE PROGRAM] [varchar](50) NULL,
	[PCS FORM] [smallint] NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[IPCFORM] [varchar](3) NULL,
	[SWITCHEDFROM] [varchar](50) NULL,
	[PRE-POST] [smallint] NULL,
	[ARGUS AGREE] [smallint] NULL,
	[AFFILIATION] [varchar](3) NULL,
	[BBC SECONDARY ACCT] [varchar](50) NULL,
	[GNP] [varchar](3) NULL,
	[MSR] [varchar](4) NULL,
	[PASSWORD] [varchar](25) NULL,
	[LOGIN] [varchar](25) NULL,
	[AVERAGE VOLUME] [int] NULL,
	[PLUSCARE] [varchar](3) NULL,
	[STEP_UP] [smallint] NULL,
	[ADDCHG] [varchar](6) NULL,
	[CHAIN_CODE] [varchar](3) NULL,
	[PAYEE_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[LASTMODIFIED] [datetime] NULL,
	[QUITDATE] [datetime] NULL,
	[EFFECTIVE] [datetime] NULL,
	[DEAEXP] [datetime] NULL,
	[ST LIC EXP DATE] [datetime] NULL,
	[PROF LIAB INS EXP DATE] [datetime] NULL,
	[GEN LIAB INS EXP DATE] [datetime] NULL,
	[GRPEFFDATE] [datetime] NULL,
	[NPI] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udsource]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udsource](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[AWP] [numeric](18, 2) NULL,
	[ UDS Sell ] [numeric](18, 2) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UdSourceOld_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UdSourceOld_del](
	[NDC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[Price Per Unit] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolume]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolume](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolume_jmw_delete]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolume_jmw_delete](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolumebak]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolumebak](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolumebak_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolumebak_del](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolumenew_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolumenew_del](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolumeold]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolumeold](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[udVolumeold_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolumeold_del](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](5) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[united_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[united_del](
	[Pharm ID] [nvarchar](50) NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[PCN] [nvarchar](50) NULL,
	[Group Nbr] [nvarchar](50) NULL,
	[Submitted] [nvarchar](50) NULL,
	[Rx Date] [nvarchar](50) NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[Day Supply] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[Fee Submitted] [numeric](38, 2) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Plan Amount] [numeric](38, 3) NULL,
	[Co Pay Amount] [numeric](38, 3) NULL,
	[U and C] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[B] [nvarchar](50) NULL,
	[OI] [nvarchar](50) NULL,
	[AWP] [numeric](38, 5) NULL,
	[Discount] [numeric](38, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendormaster]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendormaster](
	[vendorid] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[vendorname] [nvarchar](25) NOT NULL,
	[vendortype] [int] NULL,
	[status] [int] NULL,
	[effectivedate] [smalldatetime] NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [char](2) NULL,
	[zip] [nvarchar](10) NULL,
	[phone1] [nvarchar](15) NULL,
	[phone2] [nvarchar](15) NULL,
	[email] [nvarchar](50) NULL,
	[website] [nvarchar](50) NULL,
	[comments] [text] NULL,
	[oldvendorid] [int] NULL,
	[vendorpair] [int] NULL,
	[lastmodifiedon] [datetime] NULL,
	[lastmodifiedby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[diffname] [bit] NULL,
 CONSTRAINT [PK_vendormaster] PRIMARY KEY CLUSTERED 
(
	[vendorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendormasterchild]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendormasterchild](
	[vendormasterid] [int] NOT NULL,
	[vendorchildid] [int] NOT NULL,
	[active] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendorrebate]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorrebate](
	[oldvendorid] [int] NOT NULL,
	[year] [char](4) NULL,
	[totalpercentrebate] [numeric](5, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendorreporttype]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorreporttype](
	[vendorid] [int] NOT NULL,
	[reporttype] [char](3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendors]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendors](
	[dummy] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendorstatus]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendorstatus](
	[vendorstatusid] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendortype]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendortype](
	[vendortypeid] [int] NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[comments] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumeCalYY]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeCalYY](
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL,
	[PMID] [bigint] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumeCHPH]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeCHPH](
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumeHybrid]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeHybrid](
	[VOLUMEHYBRID_ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ACCT_NO] [varchar](50) NULL,
	[DEA] [varchar](50) NULL,
	[CARDVOLUME_M1] [numeric](14, 2) NULL,
	[CARDVOLUME_M2] [numeric](14, 2) NULL,
	[CARDVOLUME_M3] [numeric](14, 2) NULL,
	[ANDAVOLUME_M1] [numeric](14, 2) NULL,
	[ANDAVOLUME_M2] [numeric](14, 2) NULL,
	[ANDAVOLUME_M3] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M1] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M2] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M3] [numeric](14, 2) NULL,
	[CARDVOLUME_AVG] [numeric](14, 2) NULL,
	[ANDAVOLUME_SUM] [numeric](14, 0) NULL,
	[PARMEDVOLUME_SUM] [numeric](14, 2) NULL,
	[GENERICCOMPLIANCE] [float] NULL,
 CONSTRAINT [PK_VolumeHybrid] PRIMARY KEY CLUSTERED 
(
	[VOLUMEHYBRID_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[volumehybrid2]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[volumehybrid2](
	[VOLUMEHYBRID_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEA] [varchar](50) NULL,
	[CARDVOLUME_M1] [numeric](14, 2) NULL,
	[CARDVOLUME_M2] [numeric](14, 2) NULL,
	[CARDVOLUME_M3] [numeric](14, 2) NULL,
	[ANDAVOLUME_M1] [numeric](14, 2) NULL,
	[ANDAVOLUME_M2] [numeric](14, 2) NULL,
	[ANDAVOLUME_M3] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M1] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M2] [numeric](14, 2) NULL,
	[PARMEDVOLUME_M3] [numeric](14, 2) NULL,
	[CARDVOLUME_AVG] [numeric](14, 2) NULL,
	[ANDAVOLUME_SUM] [numeric](14, 0) NULL,
	[PARMEDVOLUME_SUM] [numeric](14, 2) NULL,
	[GENERICCOMPLIANCE] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VolumeNorm]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeNorm](
	[acct_no] [varchar](8) NULL,
	[dt] [datetime] NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[volume] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[volvndrs050608_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[volvndrs050608_del](
	[ACTIVE?] [bit] NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [nvarchar](25) NULL,
	[FOOTNOTE] [nvarchar](35) NULL,
	[EFFECTDATE] [datetime] NULL,
	[FACTOR] [float] NULL,
	[REPORTS] [nvarchar](1) NULL,
	[TOTAL PERCENT REBATE] [real] NULL,
	[ACTIVE2007] [bit] NULL,
	[VENDORPAIR] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vvcopy]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vvcopy](
	[ACTIVE?] [bit] NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [nvarchar](50) NULL,
	[FOOTNOTE] [nvarchar](35) NULL,
	[EFFECTDATE] [datetime] NULL,
	[FACTOR] [float] NULL,
	[REPORTS] [nvarchar](1) NULL,
	[TOTAL PERCENT REBATE] [real] NULL,
	[ACTIVE2007] [bit] NULL,
	[VENDORPAIR] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vvcopy1_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vvcopy1_del](
	[ACTIVE?] [bit] NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [nvarchar](25) NULL,
	[FOOTNOTE] [nvarchar](35) NULL,
	[EFFECTDATE] [datetime] NULL,
	[FACTOR] [float] NULL,
	[REPORTS] [nvarchar](1) NULL,
	[TOTAL PERCENT REBATE] [real] NULL,
	[ACTIVE2007] [bit] NULL,
	[VENDORPAIR] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WSPrice_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSPrice_del](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WSPriceAll_del]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WSPriceAll_del](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[z5plus0715]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z5plus0715](
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
/****** Object:  Table [NDCAnalysisServices].[Time]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NDCAnalysisServices].[Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Week] [datetime] NULL,
	[Week_Name] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Day_Of_Week] [int] NULL,
	[Day_Of_Week_Name] [nvarchar](50) NULL,
	[Week_Of_Year] [int] NULL,
	[Week_Of_Year_Name] [nvarchar](50) NULL,
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
/****** Object:  Table [TestAS].[Time]    Script Date: 12/22/2020 3:43:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TestAS].[Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Day_of_Year] [int] NULL,
	[Day_of_Year_Name] [nvarchar](50) NULL,
	[Day_of_Quarter] [int] NULL,
	[Day_of_Quarter_Name] [nvarchar](50) NULL,
	[Day_of_Month] [int] NULL,
	[Day_of_Month_Name] [nvarchar](50) NULL,
	[Month_of_Year] [int] NULL,
	[Month_of_Year_Name] [nvarchar](50) NULL,
	[Month_of_Quarter] [int] NULL,
	[Month_of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_of_Year] [int] NULL,
	[Quarter_of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Year] [datetime] NULL,
	[Fiscal_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter] [datetime] NULL,
	[Fiscal_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Month] [datetime] NULL,
	[Fiscal_Month_Name] [nvarchar](50) NULL,
	[Fiscal_Day] [datetime] NULL,
	[Fiscal_Day_Name] [nvarchar](50) NULL,
	[Fiscal_Day_of_Year] [int] NULL,
	[Fiscal_Day_of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Day_of_Quarter] [int] NULL,
	[Fiscal_Day_of_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Day_of_Month] [int] NULL,
	[Fiscal_Day_of_Month_Name] [nvarchar](50) NULL,
	[Fiscal_Month_of_Year] [int] NULL,
	[Fiscal_Month_of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Month_of_Quarter] [int] NULL,
	[Fiscal_Month_of_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter_of_Year] [int] NULL,
	[Fiscal_Quarter_of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_1_RX]  DEFAULT ((0)) FOR [WEEK_1_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_1_OTC]  DEFAULT ((0)) FOR [WEEK_1_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_2_RX]  DEFAULT ((0)) FOR [WEEK_2_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_2_OTC]  DEFAULT ((0)) FOR [WEEK_2_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_3_RX]  DEFAULT ((0)) FOR [WEEK_3_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_3_OTC]  DEFAULT ((0)) FOR [WEEK_3_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_4_RX]  DEFAULT ((0)) FOR [WEEK_4_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_4_OTC]  DEFAULT ((0)) FOR [WEEK_4_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_5_RX]  DEFAULT ((0)) FOR [WEEK_5_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_5_OTC]  DEFAULT ((0)) FOR [WEEK_5_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_6_RX]  DEFAULT ((0)) FOR [WEEK_6_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_6_OTC]  DEFAULT ((0)) FOR [WEEK_6_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_7_RX]  DEFAULT ((0)) FOR [WEEK_7_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_7_OTC]  DEFAULT ((0)) FOR [WEEK_7_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_8_RX]  DEFAULT ((0)) FOR [WEEK_8_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_8_OTC]  DEFAULT ((0)) FOR [WEEK_8_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_9_RX]  DEFAULT ((0)) FOR [WEEK_9_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_9_OTC]  DEFAULT ((0)) FOR [WEEK_9_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_10_RX]  DEFAULT ((0)) FOR [WEEK_10_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_10_OTC]  DEFAULT ((0)) FOR [WEEK_10_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_11_RX]  DEFAULT ((0)) FOR [WEEK_11_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_11_OTC]  DEFAULT ((0)) FOR [WEEK_11_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_12_RX]  DEFAULT ((0)) FOR [WEEK_12_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_12_OTC]  DEFAULT ((0)) FOR [WEEK_12_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_13_RX]  DEFAULT ((0)) FOR [WEEK_13_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_13_OTC]  DEFAULT ((0)) FOR [WEEK_13_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_14_RX]  DEFAULT ((0)) FOR [WEEK_14_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_14_OTC]  DEFAULT ((0)) FOR [WEEK_14_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_15_RX]  DEFAULT ((0)) FOR [WEEK_15_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_15_OTC]  DEFAULT ((0)) FOR [WEEK_15_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_16_RX]  DEFAULT ((0)) FOR [WEEK_16_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_16_OTC]  DEFAULT ((0)) FOR [WEEK_16_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_17_RX]  DEFAULT ((0)) FOR [WEEK_17_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_17_OTC]  DEFAULT ((0)) FOR [WEEK_17_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_18_RX]  DEFAULT ((0)) FOR [WEEK_18_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_18_OTC]  DEFAULT ((0)) FOR [WEEK_18_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_19_RX]  DEFAULT ((0)) FOR [WEEK_19_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_19_OTC]  DEFAULT ((0)) FOR [WEEK_19_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_20_RX]  DEFAULT ((0)) FOR [WEEK_20_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_20_OTC]  DEFAULT ((0)) FOR [WEEK_20_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_21_RX]  DEFAULT ((0)) FOR [WEEK_21_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_21_OTC]  DEFAULT ((0)) FOR [WEEK_21_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_22_RX]  DEFAULT ((0)) FOR [WEEK_22_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_22_OTC]  DEFAULT ((0)) FOR [WEEK_22_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_23_RX]  DEFAULT ((0)) FOR [WEEK_23_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_23_OTC]  DEFAULT ((0)) FOR [WEEK_23_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_24_RX]  DEFAULT ((0)) FOR [WEEK_24_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_24_OTC]  DEFAULT ((0)) FOR [WEEK_24_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_25_RX]  DEFAULT ((0)) FOR [WEEK_25_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_25_OTC]  DEFAULT ((0)) FOR [WEEK_25_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_26_RX]  DEFAULT ((0)) FOR [WEEK_26_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_26_OTC]  DEFAULT ((0)) FOR [WEEK_26_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_27_RX]  DEFAULT ((0)) FOR [WEEK_27_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_27_OTC]  DEFAULT ((0)) FOR [WEEK_27_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_28_RX]  DEFAULT ((0)) FOR [WEEK_28_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_28_OTC]  DEFAULT ((0)) FOR [WEEK_28_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_29_RX]  DEFAULT ((0)) FOR [WEEK_29_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_29_OTC]  DEFAULT ((0)) FOR [WEEK_29_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_30_RX]  DEFAULT ((0)) FOR [WEEK_30_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_30_OTC]  DEFAULT ((0)) FOR [WEEK_30_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_31_RX]  DEFAULT ((0)) FOR [WEEK_31_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_31_OTC]  DEFAULT ((0)) FOR [WEEK_31_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_32_RX]  DEFAULT ((0)) FOR [WEEK_32_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_32_OTC]  DEFAULT ((0)) FOR [WEEK_32_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_33_RX]  DEFAULT ((0)) FOR [WEEK_33_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_33_OTC]  DEFAULT ((0)) FOR [WEEK_33_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_34_RX]  DEFAULT ((0)) FOR [WEEK_34_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_34_OTC]  DEFAULT ((0)) FOR [WEEK_34_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_35_RX]  DEFAULT ((0)) FOR [WEEK_35_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_35_OTC]  DEFAULT ((0)) FOR [WEEK_35_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_36_RX]  DEFAULT ((0)) FOR [WEEK_36_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_36_OTC]  DEFAULT ((0)) FOR [WEEK_36_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_37_RX]  DEFAULT ((0)) FOR [WEEK_37_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_37_OTC]  DEFAULT ((0)) FOR [WEEK_37_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_38_RX]  DEFAULT ((0)) FOR [WEEK_38_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_38_OTC]  DEFAULT ((0)) FOR [WEEK_38_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_39_RX]  DEFAULT ((0)) FOR [WEEK_39_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_39_OTC]  DEFAULT ((0)) FOR [WEEK_39_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_40_RX]  DEFAULT ((0)) FOR [WEEK_40_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_40_OTC]  DEFAULT ((0)) FOR [WEEK_40_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_41_RX]  DEFAULT ((0)) FOR [WEEK_41_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_41_OTC]  DEFAULT ((0)) FOR [WEEK_41_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_42_RX]  DEFAULT ((0)) FOR [WEEK_42_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_42_OTC]  DEFAULT ((0)) FOR [WEEK_42_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_43_RX]  DEFAULT ((0)) FOR [WEEK_43_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_43_OTC]  DEFAULT ((0)) FOR [WEEK_43_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_44_RX]  DEFAULT ((0)) FOR [WEEK_44_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_44_OTC]  DEFAULT ((0)) FOR [WEEK_44_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_45_RX]  DEFAULT ((0)) FOR [WEEK_45_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_45_OTC]  DEFAULT ((0)) FOR [WEEK_45_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_46_RX]  DEFAULT ((0)) FOR [WEEK_46_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_46_OTC]  DEFAULT ((0)) FOR [WEEK_46_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_47_RX]  DEFAULT ((0)) FOR [WEEK_47_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_47_OTC]  DEFAULT ((0)) FOR [WEEK_47_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_48_RX]  DEFAULT ((0)) FOR [WEEK_48_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_48_OTC]  DEFAULT ((0)) FOR [WEEK_48_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_49_RX]  DEFAULT ((0)) FOR [WEEK_49_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_49_OTC]  DEFAULT ((0)) FOR [WEEK_49_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_50_RX]  DEFAULT ((0)) FOR [WEEK_50_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_50_OTC]  DEFAULT ((0)) FOR [WEEK_50_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_51_RX]  DEFAULT ((0)) FOR [WEEK_51_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_51_OTC]  DEFAULT ((0)) FOR [WEEK_51_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_52_RX]  DEFAULT ((0)) FOR [WEEK_52_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_52_OTC]  DEFAULT ((0)) FOR [WEEK_52_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_53_RX]  DEFAULT ((0)) FOR [WEEK_53_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_53_OTC]  DEFAULT ((0)) FOR [WEEK_53_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_54_RX]  DEFAULT ((0)) FOR [WEEK_54_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_54_OTC]  DEFAULT ((0)) FOR [WEEK_54_OTC]
GO
ALTER TABLE [dbo].[GMAnalysis] ADD  CONSTRAINT [DF_GMAnalysis_WholeSaler]  DEFAULT ((1)) FOR [WholeSaler]
GO
ALTER TABLE [dbo].[GMAnalysis] ADD  CONSTRAINT [DF_GMAnalysis_Stores]  DEFAULT ((0)) FOR [Stores]
GO
ALTER TABLE [dbo].[GMAnalysis] ADD  CONSTRAINT [DF_GMAnalysis_90days]  DEFAULT ((0)) FOR [days]
GO
ALTER TABLE [dbo].[GMPrice] ADD  CONSTRAINT [GMDF_CAHPrice_Wholesaler]  DEFAULT ((1)) FOR [Wholesaler]
GO
ALTER TABLE [dbo].[IndexingGenRebate] ADD  CONSTRAINT [DF_IndexingGenRebate_PAYBACK_PERCENT]  DEFAULT ((0.500)) FOR [PAYBACK_PERCENT]
GO
ALTER TABLE [dbo].[Rx30RejPM_del] ADD  CONSTRAINT [DF_Rx30RejPM_Complete]  DEFAULT ((0)) FOR [Complete]
GO
ALTER TABLE [dbo].[Rx30Stores_del] ADD  CONSTRAINT [DF_Rx30Stores_ProfitMinder]  DEFAULT ((0)) FOR [ProfitMinder]
GO
ALTER TABLE [dbo].[Rx30UBPM_del] ADD  CONSTRAINT [DF_Rx30UBPM_Complete]  DEFAULT ((0)) FOR [Complete]
GO
ALTER TABLE [dbo].[TableA] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[tmp_udVolume_changes] ADD  DEFAULT ((0)) FOR [filled]
GO
ALTER TABLE [dbo].[tmp_udVolume_changes_del] ADD  DEFAULT ((0)) FOR [filled]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Month1]  DEFAULT ((0.00)) FOR [Month1]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Month2]  DEFAULT ((0.00)) FOR [Month2]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_MChange]  DEFAULT ((0.00)) FOR [MChange]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Q1]  DEFAULT ((0.00)) FOR [Q1]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_Q2]  DEFAULT ((0.00)) FOR [Q2]
GO
ALTER TABLE [dbo].[tmp_wsvolume_del] ADD  CONSTRAINT [DF_tmp_wsvolume_QChange]  DEFAULT ((0.00)) FOR [QChange]
GO
ALTER TABLE [dbo].[WSPrice_del] ADD  CONSTRAINT [DF_CAHPrice_Wholesaler]  DEFAULT ((1)) FOR [Wholesaler]
GO
ALTER TABLE [dbo].[WSPriceAll_del] ADD  CONSTRAINT [DF_CAHPriceAll_Wholesaler]  DEFAULT ((1)) FOR [Wholesaler]
GO
ALTER TABLE [dbo].[GMAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_GMAnalysis_GMDataSource] FOREIGN KEY([DataID])
REFERENCES [dbo].[GMDataSource] ([DataID])
GO
ALTER TABLE [dbo].[GMAnalysis] CHECK CONSTRAINT [FK_GMAnalysis_GMDataSource]
GO
ALTER TABLE [dbo].[GMAnalysis]  WITH CHECK ADD  CONSTRAINT [FK_GMAnalysis_WholeSaler] FOREIGN KEY([WholeSaler])
REFERENCES [dbo].[PriceFile_del] ([id])
GO
ALTER TABLE [dbo].[GMAnalysis] CHECK CONSTRAINT [FK_GMAnalysis_WholeSaler]
GO
ALTER TABLE [dbo].[GMOutput]  WITH CHECK ADD  CONSTRAINT [FK_GMOutput_GMAnalysis] FOREIGN KEY([AnalysisID])
REFERENCES [dbo].[GMAnalysis] ([AnalysisID])
GO
ALTER TABLE [dbo].[GMOutput] CHECK CONSTRAINT [FK_GMOutput_GMAnalysis]
GO
ALTER TABLE [dbo].[Load_Log]  WITH CHECK ADD  CONSTRAINT [FK_Load_Log_Load_Description] FOREIGN KEY([load_type_id])
REFERENCES [dbo].[Load_Description] ([load_type_id])
GO
ALTER TABLE [dbo].[Load_Log] CHECK CONSTRAINT [FK_Load_Log_Load_Description]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Month' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Week' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Week_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Month' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Month_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Month' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Week' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Day_of_Week_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Day_of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_of_Month' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Week_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Week_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Month_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Month_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Month_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Month_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Quarter_of_Year' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Reporting_Quarter_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Reporting_Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'CONSTRAINT',@level2name=N'PK_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'Time' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'57371e56-9b9b-4352-b417-aca12c586b4e' , @level0type=N'SCHEMA',@level0name=N'CHPHAnalysisServices', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Week_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_Of_Week_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Week_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Week_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'CONSTRAINT',@level2name=N'PK_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'Time' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'38a77c47-8c02-423b-b259-f365d2752e7c' , @level0type=N'SCHEMA',@level0name=N'NDCAnalysisServices', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'CONSTRAINT',@level2name=N'PK_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'Time' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'6ecd20aa-52ac-497b-a142-20ceac4f731b' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time'
GO
