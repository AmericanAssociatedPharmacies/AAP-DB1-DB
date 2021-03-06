USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_ManagedCare_BCO]    Script Date: 12/22/2020 4:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_ManagedCare_BCO](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL
) ON [PRIMARY]
GO
