USE [webdocs]
GO
/****** Object:  Table [dbo].[dmLdapAuthenticationServer]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmLdapAuthenticationServer](
	[AuthenticationServerId] [char](36) NOT NULL,
	[Domain] [varchar](256) NOT NULL,
	[BaseUserDn] [varchar](128) NOT NULL,
	[UseSsl] [bit] NOT NULL,
	[SecurePortNumber] [int] NOT NULL,
	[VerifySslCertificate] [bit] NOT NULL,
	[UseServerCredential] [bit] NOT NULL,
	[ServerAuthType] [int] NOT NULL,
	[UserAuthType] [int] NOT NULL,
	[UseSAMAccountName] [bit] NOT NULL,
	[EnableSearchOptionControl] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer] ADD  DEFAULT ((1)) FOR [UseSAMAccountName]
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer] ADD  DEFAULT ((1)) FOR [EnableSearchOptionControl]
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer]  WITH CHECK ADD  CONSTRAINT [FK_dmLdapAuthenticationServer_dmAuthenticationServer] FOREIGN KEY([AuthenticationServerId])
REFERENCES [dbo].[dmAuthenticationServer] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dmLdapAuthenticationServer] CHECK CONSTRAINT [FK_dmLdapAuthenticationServer_dmAuthenticationServer]
GO
