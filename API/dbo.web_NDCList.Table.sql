USE [API]
GO
/****** Object:  Table [dbo].[web_NDCList]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_NDCList](
	[ndc] [varchar](11) NOT NULL,
	[drugname] [varchar](25) NULL,
	[mfg] [varchar](30) NULL
) ON [PRIMARY]
GO
