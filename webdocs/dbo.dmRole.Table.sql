USE [webdocs]
GO
/****** Object:  Table [dbo].[dmRole]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmRole](
	[RequestorId] [char](36) NOT NULL,
	[Role] [int] NOT NULL
) ON [PRIMARY]
GO
