USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmpStores]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpStores](
	[PMID] [nvarchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[OwnerName] [varchar](200) NULL,
	[DEA] [varchar](50) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[Affiliate] [varchar](125) NULL,
	[AAPQuitDate] [datetime] NULL,
	[PMParentID] [int] NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[CorporateName] [varchar](100) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[contactfullname] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](255) NULL,
	[fedid] [varchar](12) NULL,
	[territory] [varchar](4) NULL
) ON [PRIMARY]
GO
