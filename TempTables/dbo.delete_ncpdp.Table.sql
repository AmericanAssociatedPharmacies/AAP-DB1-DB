USE [TempTables]
GO
/****** Object:  Table [dbo].[delete_ncpdp]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_ncpdp](
	[NCPDP] [nvarchar](7) NULL,
	[NPI] [nvarchar](10) NULL,
	[DEA] [nvarchar](12) NULL,
	[DEAEXP] [nvarchar](8) NULL,
	[Name] [nvarchar](60) NULL,
	[Address] [nvarchar](55) NULL,
	[Address1] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](9) NULL,
	[Phone] [nvarchar](10) NULL,
	[Ext] [nvarchar](5) NULL,
	[Fax] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[ChainCode] [nvarchar](3) NULL,
	[AffiliateName] [nvarchar](35) NULL,
	[AffiliateType] [varchar](max) NULL,
	[key] [nvarchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
