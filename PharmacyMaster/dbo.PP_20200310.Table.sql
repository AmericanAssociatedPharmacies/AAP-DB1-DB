USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PP_20200310]    Script Date: 12/22/2020 4:45:20 AM ******/
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
