USE [webdocs]
GO
/****** Object:  Table [dbo].[dmClient]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmClient](
	[Id] [nvarchar](60) NOT NULL,
	[Secret] [varchar](1024) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Phone] [nvarchar](25) NOT NULL,
	[ApplicationType] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[RefreshTokenLifeTime] [int] NOT NULL,
	[AllowedOrigin] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_dmClient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
