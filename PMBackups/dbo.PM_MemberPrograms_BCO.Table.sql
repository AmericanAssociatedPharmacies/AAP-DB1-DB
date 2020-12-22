USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_MemberPrograms_BCO]    Script Date: 12/22/2020 4:47:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_MemberPrograms_BCO](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL
) ON [PRIMARY]
GO
