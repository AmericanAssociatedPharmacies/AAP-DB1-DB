USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_SplitEmail]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SplitEmail](
	[PMID] [int] NOT NULL,
	[Email] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
