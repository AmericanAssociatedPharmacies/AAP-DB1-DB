USE [Reports]
GO
/****** Object:  Table [dbo].[import_PP2011Q1qa2]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PP2011Q1qa2](
	[VendorName] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[RebateReportDisplayName] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[volumeamt] [float] NULL,
	[rebateamt] [float] NULL,
	[paymentamt] [float] NULL,
	[NCPDP] [nvarchar](255) NULL,
	[AAPQuitDate] [nvarchar](255) NULL,
	[affiliate] [nvarchar](255) NULL,
	[LAST] [nvarchar](255) NULL
) ON [PRIMARY]
GO
