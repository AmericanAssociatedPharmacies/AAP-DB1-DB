USE [WebDev]
GO
/****** Object:  Table [dbo].[login_history_backup_040115]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_backup_040115](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[username] [varchar](255) NULL,
	[login_type] [varchar](25) NULL,
	[password] [varchar](2550) NULL,
	[role] [varchar](50) NULL,
	[defaultpmid] [int] NULL
) ON [PRIMARY]
GO
