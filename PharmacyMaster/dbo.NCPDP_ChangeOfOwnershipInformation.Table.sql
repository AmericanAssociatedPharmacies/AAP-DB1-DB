USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDP_ChangeOfOwnershipInformation]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDP_ChangeOfOwnershipInformation](
	[NCPDP Provider ID] [nvarchar](7) NULL,
	[Old NCPDP Provider ID] [nvarchar](7) NULL,
	[Old Store Close Date] [nvarchar](8) NULL,
	[Change of Ownership Effective Date] [nvarchar](8) NULL,
	[Filler] [nvarchar](120) NULL,
	[LoadDate] [datetime] NULL
) ON [PRIMARY]
GO
