USE [reporting]
GO
/****** Object:  Table [dbo].[CHPH_1_loadlog]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_1_loadlog](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
