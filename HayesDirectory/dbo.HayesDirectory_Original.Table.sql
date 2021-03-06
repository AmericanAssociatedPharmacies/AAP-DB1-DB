USE [HayesDirectory]
GO
/****** Object:  Table [dbo].[HayesDirectory_Original]    Script Date: 12/22/2020 4:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDirectory_Original](
	[Name] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[CITY2] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[STATE2] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[PHONE_Reformatted] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[FAX_Reformatted] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[POP] [float] NULL,
	[CHAIN] [nvarchar](255) NULL,
	[CHQ] [nvarchar](255) NULL,
	[STORENUM] [nvarchar](255) NULL,
	[BRANCH] [nvarchar](255) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
