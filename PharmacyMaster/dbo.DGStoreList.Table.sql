USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[DGStoreList]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DGStoreList](
	[NCPDP] [nvarchar](50) NULL,
	[RequestsCount] [nvarchar](50) NULL,
	[LatestRequestDate] [nvarchar](50) NULL,
	[AccountName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[PharmacySystem] [nvarchar](50) NULL,
	[% of Total] [nvarchar](50) NULL,
	[DG Candidate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
