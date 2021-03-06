USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[APIMailAddress]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIMailAddress](
	[APIAccountNo] [varchar](20) NULL,
	[AddressNo] [float] NULL,
	[AccountName] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[City] [varchar](65) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL
) ON [PRIMARY]
GO
