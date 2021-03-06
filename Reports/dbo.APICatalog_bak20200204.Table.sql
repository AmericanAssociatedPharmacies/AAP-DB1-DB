USE [Reports]
GO
/****** Object:  Table [dbo].[APICatalog_bak20200204]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICatalog_bak20200204](
	[NDC] [nvarchar](255) NULL,
	[Tier1Item] [varchar](6) NULL,
	[Tier2Item] [varchar](6) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[GroupID] [varchar](10) NULL,
	[APIItemNum] [varchar](13) NULL,
	[ProductHandlingStatusCode] [varchar](25) NULL
) ON [PRIMARY]
GO
