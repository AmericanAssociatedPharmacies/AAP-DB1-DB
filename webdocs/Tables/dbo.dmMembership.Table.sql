USE [webdocs]
GO
/****** Object:  Table [dbo].[dmMembership]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmMembership](
	[UserKey] [char](36) NOT NULL,
	[GroupKey] [char](36) NOT NULL,
	[TimeStamp] [timestamp] NULL,
 CONSTRAINT [PK_dmMembership] PRIMARY KEY NONCLUSTERED 
(
	[UserKey] ASC,
	[GroupKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
