USE [Reports]
GO
/****** Object:  Table [dbo].[APICatalog_RSE_20200918]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICatalog_RSE_20200918](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[NDC] [nvarchar](255) NULL,
	[APIItemNum] [varchar](13) NULL,
	[Tier1Item] [varchar](6) NULL,
	[Tier2Item] [varchar](6) NULL,
	[GroupID] [varchar](10) NULL,
	[ProductHandlingStatusCode] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_APICatalog] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APICatalog_RSE_20200918] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
