USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_pm_programs_backup]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_programs_backup](
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
