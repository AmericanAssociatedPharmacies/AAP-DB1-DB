USE [webdocs]
GO
/****** Object:  Table [dbo].[dmAuthenticationServer]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmAuthenticationServer](
	[Id] [char](36) NOT NULL,
	[Address] [varchar](128) NOT NULL,
	[PortNumber] [int] NOT NULL,
	[ServerType] [int] NOT NULL,
	[Description] [varchar](128) NOT NULL,
 CONSTRAINT [PK_dmAuthenticationServer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmAuthenticationServer] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[dmAuthenticationServer] ADD  DEFAULT ((0)) FOR [ServerType]
GO
ALTER TABLE [dbo].[dmAuthenticationServer] ADD  CONSTRAINT [dmAuthenticationServer_Description]  DEFAULT ('') FOR [Description]
GO
