USE [WebTest]
GO
/****** Object:  Table [dbo].[userlogin]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlogin](
	[loginid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[roleid] [int] NULL,
	[perms] [varchar](255) NULL,
	[nslogin] [nvarchar](50) NULL,
	[nspwd] [nvarchar](50) NULL,
	[defaultpmid] [int] NULL,
	[createdon] [smalldatetime] NULL,
	[createdby] [nvarchar](50) NULL,
	[updatedon] [smalldatetime] NULL,
	[updatedby] [nvarchar](50) NULL,
	[active] [bit] NULL,
	[source] [int] NULL,
	[execpassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_userlogin_1] PRIMARY KEY CLUSTERED 
(
	[loginid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[userlogin] ADD  CONSTRAINT [DF_userlogin_active_1]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[userlogin] ADD  CONSTRAINT [DF_userlogin_execpassword]  DEFAULT (N'AAP43617') FOR [execpassword]
GO
