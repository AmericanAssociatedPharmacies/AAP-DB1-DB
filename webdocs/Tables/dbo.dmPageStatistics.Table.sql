USE [webdocs]
GO
/****** Object:  Table [dbo].[dmPageStatistics]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmPageStatistics](
	[Path] [varchar](255) NOT NULL,
	[QueryString] [varchar](1024) NOT NULL,
	[RequestType] [varchar](4) NOT NULL,
	[ElapsedMilliseconds] [int] NOT NULL,
	[UserAgent] [varchar](255) NOT NULL,
	[UserHostAddress] [varchar](39) NOT NULL,
	[Timestamp] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmPageStatistics] ADD  DEFAULT ('') FOR [QueryString]
GO
ALTER TABLE [dbo].[dmPageStatistics] ADD  DEFAULT ('') FOR [UserAgent]
GO
ALTER TABLE [dbo].[dmPageStatistics] ADD  DEFAULT ('') FOR [UserHostAddress]
GO
