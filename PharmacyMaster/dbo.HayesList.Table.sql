USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[HayesList]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesList](
	[NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[PHONE] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
	[COUNTY] [nvarchar](50) NULL,
	[POP] [nvarchar](50) NULL,
	[CHAIN] [nvarchar](50) NULL,
	[CHQ] [nvarchar](50) NULL,
	[STORENUM] [nvarchar](50) NULL,
	[BRANCH] [nvarchar](50) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
