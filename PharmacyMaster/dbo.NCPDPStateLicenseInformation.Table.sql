USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDPStateLicenseInformation]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPStateLicenseInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[License State Code] [nvarchar](2) NULL,
	[State License Number] [nvarchar](20) NULL,
	[State License Expiration Date] [nvarchar](8) NULL,
	[Delete Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](140) NULL
) ON [PRIMARY]
GO
