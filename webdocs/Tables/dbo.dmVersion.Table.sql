USE [webdocs]
GO
/****** Object:  Table [dbo].[dmVersion]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmVersion](
	[DocumentKey] [char](36) NOT NULL,
	[Extension] [varchar](10) NOT NULL,
	[Version] [int] NOT NULL,
	[VersionComment] [varchar](1024) NOT NULL,
	[UserKey] [char](36) NOT NULL,
 CONSTRAINT [PK_dmVersion] PRIMARY KEY CLUSTERED 
(
	[DocumentKey] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
