USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RxAlly_bkp]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RxAlly_bkp](
	[PMID] [int] NOT NULL,
	[IdentificationID] [varchar](6) NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[Owner/Officer] [varchar](30) NULL,
	[Name] [varchar](20) NULL,
	[StreetNumber] [varchar](7) NULL,
	[StreetName1] [varchar](30) NULL,
	[StreetName2] [varchar](30) NULL,
	[CityName] [varchar](15) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](5) NULL,
	[Owner/Officer email] [varchar](30) NULL,
	[Fax number] [varchar](10) NULL,
	[Affiliate] [varchar](30) NULL,
	[Notes] [varchar](255) NULL
) ON [PRIMARY]
GO
