USE [TempTables]
GO
/****** Object:  Table [dbo].[HayesMatch1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesMatch1](
	[pmid] [int] NULL,
	[accountdescription] [varchar](200) NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[apistatus] [varchar](32) NULL,
	[territory] [varchar](4) NULL,
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
	[FULLSTATE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
