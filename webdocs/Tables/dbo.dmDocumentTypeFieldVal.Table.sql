USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDocumentTypeFieldVal]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocumentTypeFieldVal](
	[DocTypeKey] [char](36) NOT NULL,
	[FieldKey] [int] NOT NULL,
	[ValKey] [int] NOT NULL,
	[FieldValue] [varchar](256) NOT NULL,
 CONSTRAINT [PK_dmDocumentTypeFieldVal] PRIMARY KEY CLUSTERED 
(
	[DocTypeKey] ASC,
	[FieldKey] ASC,
	[ValKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
