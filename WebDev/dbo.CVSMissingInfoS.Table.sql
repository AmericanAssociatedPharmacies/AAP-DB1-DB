USE [WebDev]
GO
/****** Object:  Table [dbo].[CVSMissingInfoS]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSMissingInfoS](
	[pmid] [int] NULL,
	[Note] [varchar](120) NOT NULL,
	[Section] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
