USE [WebDev]
GO
/****** Object:  Table [dbo].[Pages_old_RSE_20200415]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages_old_RSE_20200415](
	[pageID] [int] NOT NULL,
	[route] [varchar](128) NOT NULL,
	[title] [text] NULL,
	[keywords] [text] NULL,
	[description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
