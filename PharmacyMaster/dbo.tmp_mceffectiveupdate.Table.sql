USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_mceffectiveupdate]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_mceffectiveupdate](
	[effective] [datetime] NULL,
	[PK_ManagedCare] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[MCNews_EmailAddress] [varchar](150) NULL,
	[emailMCNews] [smallint] NULL,
	[McQuitReasonInternal] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[ESI] [smallint] NULL,
	[accountname] [varchar](65) NULL,
	[aapquitdate] [datetime] NULL
) ON [PRIMARY]
GO
