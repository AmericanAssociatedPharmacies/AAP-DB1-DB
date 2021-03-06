USE [webdocs]
GO
/****** Object:  Table [dbo].[dmFolder]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmFolder](
	[FolderKey] [char](36) NOT NULL,
	[FolderTitle] [varchar](256) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[SetLo] [int] NULL,
	[SetHi] [int] NULL,
 CONSTRAINT [PK_dmFolder] PRIMARY KEY NONCLUSTERED 
(
	[FolderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
