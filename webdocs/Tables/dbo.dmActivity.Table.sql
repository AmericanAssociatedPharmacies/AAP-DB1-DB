USE [webdocs]
GO
/****** Object:  Table [dbo].[dmActivity]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmActivity](
	[ActivityKey] [char](36) NOT NULL,
	[ActivityCode] [int] NOT NULL,
	[ActivityDateTime] [datetime] NULL,
	[DocumentKey] [char](36) NULL,
	[UserKey] [char](36) NULL,
	[ActivityDesc] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dmActivity] PRIMARY KEY NONCLUSTERED 
(
	[ActivityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmActivity] ADD  DEFAULT ('') FOR [ActivityDesc]
GO
