USE [webdocs]
GO
/****** Object:  Table [dbo].[dmFiler]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmFiler](
	[DocumentKey] [char](36) NOT NULL,
	[FolderKey] [char](36) NOT NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmFiler] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
