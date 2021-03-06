USE [TempTables]
GO
/****** Object:  Table [dbo].[tmpPMIDCII_All]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpPMIDCII_All](
	[PMID] [int] NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIStatus] [varchar](32) NULL
) ON [PRIMARY]
GO
