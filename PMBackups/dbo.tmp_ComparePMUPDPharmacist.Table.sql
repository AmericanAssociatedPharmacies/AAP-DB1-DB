USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_ComparePMUPDPharmacist]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ComparePMUPDPharmacist](
	[TableName] [varchar](16) NULL,
	[NDUPS] [int] NULL,
	[ID] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[PharPrime] [smallint] NULL,
	[PharFullName] [varchar](255) NULL,
	[PharTitle] [varchar](20) NULL,
	[PharState] [varchar](2) NULL,
	[PharLicNo] [varchar](20) NULL,
	[PharExpDate] [datetime] NULL
) ON [PRIMARY]
GO
