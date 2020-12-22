USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PMStoreNew]    Script Date: 12/22/2020 4:45:20 AM ******/
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
