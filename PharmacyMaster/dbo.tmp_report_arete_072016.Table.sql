USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_report_arete_072016]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_arete_072016](
	[pmid] [int] NOT NULL,
	[ncpdp] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[OIGData] [varchar](1) NOT NULL,
	[rxAAPLogin] [varchar](1) NOT NULL,
	[DBA] [varchar](100) NULL,
	[NPI] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL
) ON [PRIMARY]
GO
