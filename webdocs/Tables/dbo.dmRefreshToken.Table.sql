USE [webdocs]
GO
/****** Object:  Table [dbo].[dmRefreshToken]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmRefreshToken](
	[Id] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](60) NOT NULL,
	[ClientId] [nvarchar](60) NOT NULL,
	[IssuedUtc] [datetime] NOT NULL,
	[ExpiresUtc] [datetime] NOT NULL,
	[ProtectedTicket] [varchar](1024) NULL,
	[Browser] [varchar](1024) NULL,
 CONSTRAINT [PK_dmRefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmRefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_dmRefreshToken_dmClient] FOREIGN KEY([ClientId])
REFERENCES [dbo].[dmClient] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dmRefreshToken] CHECK CONSTRAINT [FK_dmRefreshToken_dmClient]
GO
