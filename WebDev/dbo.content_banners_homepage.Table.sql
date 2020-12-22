USE [WebDev]
GO
/****** Object:  Table [dbo].[content_banners_homepage]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content_banners_homepage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageURL] [varchar](255) NOT NULL,
	[linkURL] [varchar](255) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[externalLink] [tinyint] NULL,
	[dateAdded] [datetime] NULL,
	[dateExpires] [datetime] NULL,
	[sortorder] [int] NULL,
	[dateStartDisplay] [datetime] NULL,
 CONSTRAINT [PK_content_banners_homepage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[content_banners_homepage] ADD  CONSTRAINT [DF_content_banners_homepage_externalLink]  DEFAULT ((0)) FOR [externalLink]
GO
ALTER TABLE [dbo].[content_banners_homepage] ADD  CONSTRAINT [DF_content_banners_homepage_dateAdded]  DEFAULT (getdate()) FOR [dateAdded]
GO
