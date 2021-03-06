USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDPChangeOfOwnershipInformation]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPChangeOfOwnershipInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Old NCPDP Provider ID] [nvarchar](7) NULL,
	[Old Store Close Date] [nvarchar](8) NULL,
	[Change of Ownership Effective Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](120) NULL
) ON [PRIMARY]
GO
