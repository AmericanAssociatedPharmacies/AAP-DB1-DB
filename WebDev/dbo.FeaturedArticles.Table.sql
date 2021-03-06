USE [WebDev]
GO
/****** Object:  Table [dbo].[FeaturedArticles]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeaturedArticles](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
	[Content] [text] NULL,
	[Image] [varchar](128) NULL,
	[Thumbnail] [varchar](128) NULL,
	[StatusID] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
	[PublishDate] [date] NULL,
	[ExpirationDate] [date] NULL,
	[PartnerID] [varchar](128) NULL,
	[PageID] [int] NULL,
	[PositionID] [int] NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_FeaturedArticles] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FeaturedArticles] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FeaturedArticles]  WITH CHECK ADD  CONSTRAINT [FK_FeaturedArticles_ArticleStatus] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[FeaturedArticles] ([ArticleID])
GO
ALTER TABLE [dbo].[FeaturedArticles] CHECK CONSTRAINT [FK_FeaturedArticles_ArticleStatus]
GO
