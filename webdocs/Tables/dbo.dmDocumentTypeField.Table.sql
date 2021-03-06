USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDocumentTypeField]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentTypeField](
	[DocTypeKey] [char](36) NOT NULL,
	[FieldKey] [int] NOT NULL,
	[FieldDesc] [varchar](256) NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[FieldType] [char](1) NULL,
	[EditMask] [varchar](256) NULL,
	[ListType] [char](1) NULL,
	[Required] [bit] NULL,
 CONSTRAINT [PK_dmDocumentTypeField] PRIMARY KEY NONCLUSTERED 
(
	[DocTypeKey] ASC,
	[FieldKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_FieldType]  DEFAULT ('C') FOR [FieldType]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_EditMask]  DEFAULT ('') FOR [EditMask]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_ListType]  DEFAULT ('') FOR [ListType]
GO
ALTER TABLE [dbo].[dmDocumentTypeField] ADD  CONSTRAINT [DF_dmDocumentTypeField_Required]  DEFAULT ((0)) FOR [Required]
GO
