USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_PP_PaymentDetail]    Script Date: 12/22/2020 4:45:20 AM ******/
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
