USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Programs_BeforeUpdate_11282017]    Script Date: 12/22/2020 4:47:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Programs_BeforeUpdate_11282017](
	[ProgramID] [int] NOT NULL,
	[Description] [varchar](50) NULL,
	[CommentConst] [varchar](255) NULL,
	[Category] [char](1) NULL,
	[AAP] [smallint] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[WebProfile] [smallint] NOT NULL
) ON [PRIMARY]
GO
