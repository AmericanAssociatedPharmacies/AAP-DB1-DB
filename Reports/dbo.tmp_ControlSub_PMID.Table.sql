USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ControlSub_PMID]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ControlSub_PMID](
	[Period] [varchar](10) NULL,
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CH_GenericUnits] [decimal](30, 2) NULL,
	[CH_BrandUnits] [decimal](30, 2) NULL,
	[CH_ControlUnitsCII] [decimal](30, 2) NULL,
	[CH_ControlUnits3_5] [decimal](30, 2) NULL,
	[CH_ControlUnitsTotal] [decimal](30, 2) NULL,
	[CH_NonControlUnits] [decimal](30, 2) NULL,
	[CH_Hydros] [decimal](30, 2) NULL,
	[CH_Oxys] [decimal](30, 2) NULL,
	[CH_Oxy30s] [decimal](30, 2) NULL,
	[CH_AllALP] [decimal](30, 2) NULL,
	[CH_ALP2MG] [decimal](30, 2) NULL,
	[CH_METHADONE] [decimal](30, 2) NULL,
	[CH_%CII-CV] [decimal](30, 4) NULL,
	[CH_%CII] [decimal](30, 4) NULL,
	[CH_GXtoBXRatio] [decimal](30, 4) NULL
) ON [PRIMARY]
GO
