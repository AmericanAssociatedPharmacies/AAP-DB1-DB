USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_API_PM_VendAcct_Add]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_PM_VendAcct_Add](
	[AccountName] [varchar](100) NULL,
	[DEA] [varchar](25) NULL,
	[PMID] [int] NULL,
	[Vendor_id] [int] NULL,
	[VendAcctNum] [varchar](25) NULL,
	[PVA] [varchar](25) NULL,
	[PaymentTerms] [varchar](100) NULL,
	[IsPrimary] [varchar](1) NULL
) ON [PRIMARY]
GO
