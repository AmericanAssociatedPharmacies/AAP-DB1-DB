USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDP_TaxonomyInformation]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_TaxonomyInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Taxonomy Code] [nvarchar](10) NULL,
	[Provider Type Code] [nvarchar](2) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](123) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
