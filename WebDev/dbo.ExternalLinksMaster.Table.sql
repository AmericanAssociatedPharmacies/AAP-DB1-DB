USE [WebDev]
GO
/****** Object:  Table [dbo].[ExternalLinksMaster]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalLinksMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LinkName] [nvarchar](50) NOT NULL,
	[RedirectLink] [nvarchar](255) NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_ExternalLinksMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
