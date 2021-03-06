USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDocument]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDocument](
	[DocumentKey] [char](36) NOT NULL,
	[ChangeDate] [datetime] NULL,
	[DocumentTitle] [varchar](256) NOT NULL,
	[FileName] [varchar](255) NOT NULL,
	[DocTypeKey] [char](36) NULL,
	[LocationKey] [char](36) NULL,
	[LastVerified] [datetime] NULL,
	[TimeStamp] [timestamp] NULL,
	[UserDefined1] [varchar](256) NULL,
	[UserDefined2] [varchar](256) NULL,
	[UserDefined3] [varchar](256) NULL,
	[UserDefined4] [varchar](256) NULL,
	[UserDefined5] [varchar](256) NULL,
	[UserDefined6] [varchar](256) NULL,
	[UserDefined7] [varchar](256) NULL,
	[UserDefined8] [varchar](256) NULL,
	[UserDefined9] [varchar](256) NULL,
	[UserDefined10] [varchar](256) NULL,
	[UserDefined11] [varchar](256) NULL,
	[UserDefined12] [varchar](256) NULL,
	[UserDefined13] [varchar](256) NULL,
	[UserDefined14] [varchar](256) NULL,
	[UserDefined15] [varchar](256) NULL,
	[UserDefined16] [varchar](256) NULL,
	[UserDefined17] [varchar](256) NULL,
	[UserDefined18] [varchar](256) NULL,
	[UserDefined19] [varchar](256) NULL,
	[UserDefined20] [varchar](256) NULL,
	[InsertDate] [datetime] NOT NULL,
	[CheckoutUserKey] [char](36) NULL,
	[LocationInsertDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[UserDefined21] [varchar](256) NULL,
	[UserDefined22] [varchar](256) NULL,
	[UserDefined23] [varchar](256) NULL,
	[UserDefined24] [varchar](256) NULL,
	[UserDefined25] [varchar](256) NULL,
	[UserDefined26] [varchar](256) NULL,
	[UserDefined27] [varchar](256) NULL,
	[UserDefined28] [varchar](256) NULL,
	[UserDefined29] [varchar](256) NULL,
	[UserDefined30] [varchar](256) NULL,
	[FullTextIndexStatus] [varchar](255) NULL,
	[NeedsKeyIndex] [bit] NOT NULL,
	[NeedsFullTextIndex] [bit] NOT NULL,
	[FolderKey] [char](36) NOT NULL,
 CONSTRAINT [PK_dmDocument] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_LocationInsertDate]  DEFAULT (getdate()) FOR [LocationInsertDate]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_NeedsKeyIndex]  DEFAULT ((1)) FOR [NeedsKeyIndex]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_NeedsFullTextIndex]  DEFAULT ((1)) FOR [NeedsFullTextIndex]
GO
ALTER TABLE [dbo].[dmDocument] ADD  CONSTRAINT [DF_dmDocument_FolderKey]  DEFAULT ('') FOR [FolderKey]
GO
