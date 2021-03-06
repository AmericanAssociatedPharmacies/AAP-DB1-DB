USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[vendorvolumerebate_01062017]    Script Date: 12/22/2020 4:45:20 AM ******/
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
