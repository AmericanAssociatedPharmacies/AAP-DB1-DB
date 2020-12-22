USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[APITaxID]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APITaxID](
	[Status] [varchar](32) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[TaxID] [varchar](20) NULL
) ON [PRIMARY]
GO
