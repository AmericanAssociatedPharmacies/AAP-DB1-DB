USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDPRelationshipDemographicInformation]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPRelationshipDemographicInformation](
	[RelationshipID] [nvarchar](3) NULL,
	[Relationship Type] [nvarchar](2) NULL,
	[Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Relationship NPI] [nvarchar](10) NULL,
	[Relationship Federal Tax ID] [nvarchar](15) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact E-mail] [nvarchar](50) NULL,
	[Contractual Name] [nvarchar](30) NULL,
	[Contractual Title] [nvarchar](30) NULL,
	[Contractual E-mail] [nvarchar](50) NULL,
	[Operational Name] [nvarchar](30) NULL,
	[Operational Title] [nvarchar](30) NULL,
	[Operational E-mail] [nvarchar](50) NULL,
	[Technical Name] [nvarchar](30) NULL,
	[Technical Title] [nvarchar](30) NULL,
	[Technical E-mail] [nvarchar](50) NULL,
	[Audit Name] [nvarchar](30) NULL,
	[Audit Title] [nvarchar](30) NULL,
	[Audit E-mail] [nvarchar](50) NULL,
	[Parent Organization ID] [nvarchar](6) NULL,
	[Effective From Date] [nvarchar](8) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](187) NULL
) ON [PRIMARY]
GO
