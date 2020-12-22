USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDP_Provider]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_Provider](
	[ProviderID] [nvarchar](7) NULL,
	[Legal Business Name] [nvarchar](60) NULL,
	[Name] [nvarchar](60) NULL,
	[Doctors Name] [nvarchar](60) NULL,
	[Store Number] [nvarchar](10) NULL,
	[Physical Location Address 1] [nvarchar](55) NULL,
	[Physical Location Address 2] [nvarchar](55) NULL,
	[Physical Location City] [nvarchar](30) NULL,
	[Physical Location State Code] [nvarchar](2) NULL,
	[Physical Location Zip Code] [nvarchar](9) NULL,
	[Physical Location Phone Number] [nvarchar](10) NULL,
	[Physical Location Extension] [nvarchar](5) NULL,
	[Physical Location FAX Number] [nvarchar](10) NULL,
	[Physical Location E-Mail Address] [nvarchar](50) NULL,
	[Physical Location Cross Street or Directions] [nvarchar](50) NULL,
	[Physical Location County/Parish] [nvarchar](5) NULL,
	[Physical Location MSA] [nvarchar](4) NULL,
	[Physical Location PMSA] [nvarchar](4) NULL,
	[Physical Location 24 Hour Operation Flag] [nvarchar](1) NULL,
	[Physical Location Provider Hours] [nvarchar](35) NULL,
	[Physical Location Congressional Voting District] [nvarchar](4) NULL,
	[Physical Location Language Code 1] [nvarchar](2) NULL,
	[Physical Location Language Code 2] [nvarchar](2) NULL,
	[Physical Location Language Code 3] [nvarchar](2) NULL,
	[Physical Location Language Code 4] [nvarchar](2) NULL,
	[Physical Location Language Code 5] [nvarchar](2) NULL,
	[Physical Location Store Open Date] [nvarchar](8) NULL,
	[Physical Location Store Closure Date] [nvarchar](8) NULL,
	[Mailing Address 1] [nvarchar](55) NULL,
	[Mailing Address 2] [nvarchar](55) NULL,
	[Mailing City] [nvarchar](30) NULL,
	[Mailing State Code] [nvarchar](2) NULL,
	[Mailing Zip Code] [nvarchar](9) NULL,
	[Contact Last Name] [nvarchar](20) NULL,
	[Contact First Name] [nvarchar](20) NULL,
	[Contact Middle Initial] [nvarchar](1) NULL,
	[Contact Title] [nvarchar](30) NULL,
	[Contact Phone Number] [nvarchar](10) NULL,
	[Contact Extension] [nvarchar](5) NULL,
	[Contact E-Mail Address] [nvarchar](50) NULL,
	[Dispenser Class Code] [nvarchar](2) NULL,
	[Primary Provider Type Code] [nvarchar](2) NULL,
	[Secondary Provider Type Code] [nvarchar](2) NULL,
	[Tertiary Provider Type Code] [nvarchar](2) NULL,
	[Medicare Provider (Supplier) ID] [nvarchar](10) NULL,
	[NPI] [nvarchar](10) NULL,
	[DEA] [nvarchar](12) NULL,
	[DEA Expiration Date] [nvarchar](8) NULL,
	[Federal Tax ID Number] [nvarchar](15) NULL,
	[State Income Tax ID Number] [nvarchar](15) NULL,
	[Deactivation Code] [nvarchar](2) NULL,
	[Reinstatement Code] [nvarchar](2) NULL,
	[Reinstatement Date] [nvarchar](8) NULL,
	[Transaction Code] [nvarchar](1) NULL,
	[Transaction Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](62) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
