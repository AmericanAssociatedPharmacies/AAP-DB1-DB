USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_jmw_MTM]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_jmw_MTM](
	[PMID] [int] NOT NULL,
	[Store Name] [varchar](65) NULL,
	[Owner] [varchar](200) NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](80) NULL,
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
