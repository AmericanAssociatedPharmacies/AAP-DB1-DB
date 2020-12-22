USE [PMBackups]
GO
/****** Object:  Table [dbo].[apiaccountmaster_orig_BU]    Script Date: 12/22/2020 4:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apiaccountmaster_orig_BU](
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
