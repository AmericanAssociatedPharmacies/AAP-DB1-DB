USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RxAlly_NewMasterAsOf082712]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RxAlly_NewMasterAsOf082712](
	[IdentificationID] [nvarchar](255) NULL,
	[NCPDP] [float] NULL,
	[NPI] [float] NULL,
	[Owner/Officer] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[StreetNumber] [float] NULL,
	[StreetName1] [nvarchar](255) NULL,
	[StreetName2] [nvarchar](255) NULL,
	[CityName] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[ZipCode] [float] NULL,
	[Owner/Officer email] [nvarchar](255) NULL,
	[Fax number] [float] NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
