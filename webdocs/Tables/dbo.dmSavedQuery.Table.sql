USE [webdocs]
GO
/****** Object:  Table [dbo].[dmSavedQuery]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmSavedQuery](
	[Query] [varchar](250) NOT NULL,
	[UserKey] [char](36) NULL,
	[Count] [int] NOT NULL,
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SavedQuery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmSavedQuery] ADD  DEFAULT ((0)) FOR [Count]
GO
