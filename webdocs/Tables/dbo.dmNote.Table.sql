USE [webdocs]
GO
/****** Object:  Table [dbo].[dmNote]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmNote](
	[DocumentKey] [char](36) NOT NULL,
	[NoteKey] [char](36) NOT NULL,
	[GroupKey] [char](36) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[UserKey] [char](36) NOT NULL,
	[InsertDate] [datetime] NULL,
 CONSTRAINT [PK_dmNote] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[NoteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmNote] ADD  CONSTRAINT [DF_dmNote_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
