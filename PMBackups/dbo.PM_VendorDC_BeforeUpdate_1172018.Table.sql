USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_VendorDC_BeforeUpdate_1172018]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_VendorDC_BeforeUpdate_1172018](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[DCNum] [int] NOT NULL,
	[Source] [varchar](3) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
