USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_NonMC_changed]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_changed](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
