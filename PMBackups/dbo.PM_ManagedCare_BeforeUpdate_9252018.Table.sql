USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_ManagedCare_BeforeUpdate_9252018]    Script Date: 12/22/2020 4:47:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ManagedCare_BeforeUpdate_9252018](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
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
	[ESI] [smallint] NULL
) ON [PRIMARY]
GO
