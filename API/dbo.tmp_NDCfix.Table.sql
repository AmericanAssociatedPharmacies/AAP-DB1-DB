USE [API]
GO
/****** Object:  Table [dbo].[tmp_NDCfix]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NDCfix](
	[APIItemNbr] [nvarchar](255) NULL,
	[NDC] [nvarchar](255) NULL,
	[PGPCGR] [nvarchar](255) NULL
) ON [PRIMARY]
GO
