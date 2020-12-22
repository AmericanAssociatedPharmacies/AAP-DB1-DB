USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_VendorDC_BCO]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorDC_BCO](
	[PMID] [int] NULL,
	[VendorID] [int] NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NULL,
	[DCNum] [int] NULL,
	[Source] [varchar](3) NULL
) ON [PRIMARY]
GO
