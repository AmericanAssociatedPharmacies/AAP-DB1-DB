USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Groups_xref_BeforeUpdate_12112018]    Script Date: 12/22/2020 4:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups_xref_BeforeUpdate_12112018](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
