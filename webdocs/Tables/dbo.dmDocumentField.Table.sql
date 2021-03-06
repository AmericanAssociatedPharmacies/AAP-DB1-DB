USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDocumentField]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentField](
	[FieldKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentKey] [char](36) NOT NULL,
	[FieldId] [varchar](10) NOT NULL,
	[FieldValue] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dmDocumentField] PRIMARY KEY NONCLUSTERED 
(
	[FieldKey] ASC,
	[DocumentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
