USE [reporting]
GO
/****** Object:  Table [dbo].[ud_auth_user_jmw]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ud_auth_user_jmw](
	[USER_ID] [nvarchar](32) NULL,
	[USERNAME] [nvarchar](32) NULL,
	[PASSWORD] [nvarchar](32) NULL,
	[PERMS] [nvarchar](255) NULL,
	[OPT_IN] [bit] NULL
) ON [PRIMARY]
GO
