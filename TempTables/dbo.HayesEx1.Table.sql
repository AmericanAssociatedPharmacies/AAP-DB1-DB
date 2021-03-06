USE [TempTables]
GO
/****** Object:  Table [dbo].[HayesEx1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesEx1](
	[NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[POP] [int] NULL,
	[CHAIN] [nvarchar](255) NULL,
	[CHQ] [nvarchar](255) NULL,
	[STORENUM] [nvarchar](255) NULL,
	[BRANCH] [nvarchar](255) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](255) NULL,
	[SName] [nvarchar](4000) NULL,
	[SAddress] [nvarchar](4000) NULL,
	[Zip5] [nvarchar](5) NULL,
	[SPhone] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
