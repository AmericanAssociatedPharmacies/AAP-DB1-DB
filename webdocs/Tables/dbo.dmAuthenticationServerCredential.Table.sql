USE [webdocs]
GO
/****** Object:  Table [dbo].[dmAuthenticationServerCredential]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmAuthenticationServerCredential](
	[AuthenticationServerId] [char](36) NOT NULL,
	[ServerLogOnName] [varchar](128) NOT NULL,
	[ServerLogOnPassword] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmAuthenticationServerCredential]  WITH CHECK ADD  CONSTRAINT [FK_dmAuthenticationServerCredential_dmAuthenticationServer] FOREIGN KEY([AuthenticationServerId])
REFERENCES [dbo].[dmAuthenticationServer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dmAuthenticationServerCredential] CHECK CONSTRAINT [FK_dmAuthenticationServerCredential_dmAuthenticationServer]
GO
