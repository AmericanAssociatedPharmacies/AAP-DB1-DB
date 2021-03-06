USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDP_ParentOrganizationInformation]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ParentOrganizationInformation](
	[Parent Organization ID] [nvarchar](6) NULL,
	[Parent Organization Name] [nvarchar](35) NULL,
	[Address 1] [nvarchar](55) NULL,
	[Address 2] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State Code] [nvarchar](2) NULL,
	[Zip Code] [nvarchar](9) NULL,
	[Phone Number] [nvarchar](10) NULL,
	[Extension] [nvarchar](5) NULL,
	[FAX Number] [nvarchar](10) NULL,
	[Parent Organization NPI] [nvarchar](10) NULL,
	[Parent Organization Federal Tax ID] [nvarchar](15) NULL,
	[Contact Name] [nvarchar](30) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact E-mail] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
