USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[Pharmacy1]    Script Date: 12/22/2020 4:45:19 AM ******/
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
ALTER TABLE [dbo].[Pharmacy1] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Pharmacy1] ADD  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Pharmacy1] ADD  DEFAULT ((1)) FOR [RowVersion]
GO
