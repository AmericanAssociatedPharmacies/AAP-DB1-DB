USE [ReportServerTempDB]
GO
/****** Object:  Table [dbo].[TempDataSources]    Script Date: 12/22/2020 5:08:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempDataSources](
	[DSID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](260) NULL,
	[Extension] [nvarchar](260) NULL,
	[Link] [uniqueidentifier] NULL,
	[CredentialRetrieval] [int] NULL,
	[Prompt] [ntext] NULL,
	[ConnectionString] [image] NULL,
	[OriginalConnectionString] [image] NULL,
	[OriginalConnectStringExpressionBased] [bit] NULL,
	[UserName] [image] NULL,
	[Password] [image] NULL,
	[Flags] [int] NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_DataSource] PRIMARY KEY CLUSTERED 
(
	[DSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TempDataSources]  WITH NOCHECK ADD  CONSTRAINT [FK_DataSourceItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[TempCatalog] ([TempCatalogID])
GO
ALTER TABLE [dbo].[TempDataSources] CHECK CONSTRAINT [FK_DataSourceItemID]
GO
