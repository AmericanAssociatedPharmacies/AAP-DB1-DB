USE [webdocs]
GO
/****** Object:  Table [dbo].[dmLocation]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmLocation](
	[LocationKey] [char](36) NOT NULL,
	[Path] [varchar](255) NULL,
	[TimeStamp] [timestamp] NULL,
	[AutoSynch] [bit] NOT NULL,
	[PathFTP] [varchar](255) NOT NULL,
	[PathUNC] [varchar](255) NOT NULL,
	[PathHTTP] [varchar](255) NOT NULL,
	[ServerFTP] [varchar](255) NOT NULL,
	[ServerHTTP] [varchar](255) NOT NULL,
	[UserFTP] [varchar](25) NOT NULL,
	[PasswordFTP] [varchar](25) NOT NULL,
	[UserHTTP] [varchar](25) NOT NULL,
	[PasswordHTTP] [varchar](25) NOT NULL,
	[Title] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_dmLocation] PRIMARY KEY CLUSTERED 
(
	[LocationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_AutoSynch]  DEFAULT ((0)) FOR [AutoSynch]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PathFTP]  DEFAULT ('') FOR [PathFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PathUNC]  DEFAULT ('') FOR [PathUNC]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PathHTTP]  DEFAULT ('') FOR [PathHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_ServerFTP]  DEFAULT ('') FOR [ServerFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_ServerHTTP]  DEFAULT ('') FOR [ServerHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_UserFTP]  DEFAULT ('') FOR [UserFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PasswordFTP]  DEFAULT ('') FOR [PasswordFTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_UserHTTP]  DEFAULT ('') FOR [UserHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_PasswordHTTP]  DEFAULT ('') FOR [PasswordHTTP]
GO
ALTER TABLE [dbo].[dmLocation] ADD  CONSTRAINT [DF_dmLocation_Title]  DEFAULT ('') FOR [Title]
GO
