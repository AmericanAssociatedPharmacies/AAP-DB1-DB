USE [webdocs]
GO
/****** Object:  Table [dbo].[dmActivityCode]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmActivityCode](
	[ActivityCode] [int] NOT NULL,
	[ActivityDesc] [varchar](256) NOT NULL
) ON [PRIMARY]
GO
