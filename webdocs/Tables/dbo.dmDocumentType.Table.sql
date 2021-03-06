USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDocumentType]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentType](
	[DocTypeKey] [char](36) NOT NULL,
	[DocTypeTitle] [varchar](256) NOT NULL,
	[Description] [varchar](80) NOT NULL,
	[ExpireDays] [int] NOT NULL,
 CONSTRAINT [PK_dmDocumentType] PRIMARY KEY NONCLUSTERED 
(
	[DocTypeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmDocumentType] ADD  CONSTRAINT [dmDocumentType_Description]  DEFAULT ('') FOR [Description]
GO
