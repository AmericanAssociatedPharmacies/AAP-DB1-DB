USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDPProviderRelationship]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPProviderRelationship](
	[NCPDP] [nvarchar](7) NULL,
	[Relationship ID] [nvarchar](3) NULL,
	[Payment Center ID] [nvarchar](6) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Effective Through Date] [nvarchar](8) NULL,
	[filler] [nvarchar](118) NULL,
	[endline] [nvarchar](2) NULL
) ON [PRIMARY]
GO
