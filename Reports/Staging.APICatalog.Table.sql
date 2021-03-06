USE [Reports]
GO
/****** Object:  Table [Staging].[APICatalog]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APICatalog](
	[NDC] [nvarchar](255) NULL,
	[APIItemNum] [varchar](13) NULL,
	[Tier1Item] [varchar](6) NULL,
	[Tier2Item] [varchar](6) NULL,
	[GroupID] [varchar](10) NULL,
	[ProductHandlingStatusCode] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APICatalog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
