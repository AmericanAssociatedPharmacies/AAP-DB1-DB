USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDocumentTextContent]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentTextContent](
	[DocumentKey] [char](36) NOT NULL,
	[FullTextContent] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
