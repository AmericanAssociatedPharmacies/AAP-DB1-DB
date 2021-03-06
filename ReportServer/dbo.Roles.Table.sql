USE [ReportServer]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/22/2020 5:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](260) NOT NULL,
	[Description] [nvarchar](512) NULL,
	[TaskMask] [nvarchar](32) NOT NULL,
	[RoleFlags] [tinyint] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
