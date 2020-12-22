USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_VendorDC_test_bkp]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_VendorDC_test_bkp](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[DCNum] [int] NOT NULL,
	[Source] [varchar](3) NOT NULL
) ON [PRIMARY]
GO
