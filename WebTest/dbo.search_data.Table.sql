USE [WebTest]
GO
/****** Object:  Table [dbo].[search_data]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[search_data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file] [varchar](255) NULL,
	[url] [varchar](255) NULL,
	[rank] [int] NULL,
	[permission] [int] NULL,
	[title] [varchar](255) NULL,
	[description] [varchar](max) NULL,
	[text] [varchar](max) NULL,
	[date] [nchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
