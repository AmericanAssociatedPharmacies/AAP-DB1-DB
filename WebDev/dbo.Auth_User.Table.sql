USE [WebDev]
GO
/****** Object:  Table [dbo].[Auth_User]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_User](
	[USER_ID] [varchar](32) NULL,
	[USERNAME] [varchar](32) NULL,
	[PASSWORD] [varchar](32) NULL,
	[PERMS] [varchar](255) NULL,
	[OPT_IN] [bit] NULL,
	[OPT_IN2] [bit] NULL,
	[MANAGED_CARE] [bit] NULL
) ON [PRIMARY]
GO
