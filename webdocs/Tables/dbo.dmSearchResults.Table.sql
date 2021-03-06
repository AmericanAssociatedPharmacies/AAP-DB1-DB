USE [webdocs]
GO
/****** Object:  Table [dbo].[dmSearchResults]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSearchResults](
	[DocumentId] [char](36) NOT NULL,
	[SearchId] [char](36) NOT NULL,
	[RelevanceScore] [float] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmSearchResults] ADD  CONSTRAINT [DF_dmSearchResults_Relevance]  DEFAULT ((1.0)) FOR [RelevanceScore]
GO
