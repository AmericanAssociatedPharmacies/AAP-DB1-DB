USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_VendorAccts_BU]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorAccts_BU](
	[PMID] [int] NULL,
	[VendorID] [int] NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NULL
) ON [PRIMARY]
GO
