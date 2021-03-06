USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_VendorAccts_BCO]    Script Date: 12/22/2020 4:47:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorAccts_BCO](
	[PMID] [int] NULL,
	[VendorID] [int] NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NULL
) ON [PRIMARY]
GO
