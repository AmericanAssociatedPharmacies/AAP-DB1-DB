USE [WebDev]
GO
/****** Object:  Table [dbo].[PageMaster]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Page] [nvarchar](100) NOT NULL,
	[PageName] [nvarchar](100) NOT NULL,
	[PageTitle] [nvarchar](255) NOT NULL,
	[PageMediaSelector] [int] NOT NULL,
	[PageContent] [text] NOT NULL,
	[ImageId] [int] NULL,
	[VideoId] [int] NULL,
	[PageFlag] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_PageMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PageMaster] ADD  CONSTRAINT [DF_PageMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedOn]
GO
