USE [WebTest]
GO
/****** Object:  Table [dbo].[CVSMissingInfo]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVSMissingInfo](
	[pmid] [int] NULL,
	[Note] [varchar](120) NOT NULL,
	[Section] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
