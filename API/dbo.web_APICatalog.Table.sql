USE [API]
GO
/****** Object:  Table [dbo].[web_APICatalog]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web_APICatalog](
	[ndc] [nvarchar](20) NULL,
	[APIItemNbr] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL
) ON [PRIMARY]
GO
