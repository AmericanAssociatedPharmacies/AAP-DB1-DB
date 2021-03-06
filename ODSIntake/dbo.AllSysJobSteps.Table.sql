USE [ODSIntake]
GO
/****** Object:  Table [dbo].[AllSysJobSteps]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllSysJobSteps](
	[job_id] [uniqueidentifier] NOT NULL,
	[name] [sysname] NOT NULL,
	[step_id] [int] NOT NULL,
	[step_name] [sysname] NOT NULL,
	[command] [nvarchar](max) NULL,
	[server] [sysname] NULL,
	[database_name] [sysname] NULL,
	[database_user_name] [sysname] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
