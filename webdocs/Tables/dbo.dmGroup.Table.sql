USE [webdocs]
GO
/****** Object:  Table [dbo].[dmGroup]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmGroup](
	[GroupKey] [char](36) NOT NULL,
	[GroupName] [varchar](256) NOT NULL,
	[Description] [varchar](1024) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[GroupLoginMessage] [varchar](2048) NOT NULL,
 CONSTRAINT [PK_dmGroup] PRIMARY KEY NONCLUSTERED 
(
	[GroupKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmGroup] ADD  DEFAULT ('') FOR [GroupLoginMessage]
GO
