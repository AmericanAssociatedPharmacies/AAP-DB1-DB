USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[RxPride Network Listing 093016]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RxPride Network Listing 093016](
	[NCPDP] [nvarchar](50) NULL,
	[NPI] [nvarchar](50) NULL,
	[DEA] [nvarchar](50) NULL,
	[DEAEXP] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[Address1] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Ext] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[ChainCode] [nvarchar](50) NULL,
	[AffiliateName] [nvarchar](50) NULL,
	[AffiliateType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
