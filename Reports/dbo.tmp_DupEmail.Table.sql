USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_DupEmail]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_DupEmail](
	[PMID] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
