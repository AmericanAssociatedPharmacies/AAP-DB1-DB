USE [WebDev]
GO
/****** Object:  Table [dbo].[usergroup]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergroup](
	[usergroupid] [int] IDENTITY(1,1) NOT NULL,
	[login_parent] [varchar](50) NOT NULL,
	[login_child] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
