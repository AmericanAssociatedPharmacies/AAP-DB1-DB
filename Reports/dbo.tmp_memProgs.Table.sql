USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_memProgs]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_memProgs](
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
