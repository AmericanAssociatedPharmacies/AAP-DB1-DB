USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_pm_memberprograms]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_memberprograms](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
