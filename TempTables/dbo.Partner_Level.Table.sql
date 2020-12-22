USE [TempTables]
GO
/****** Object:  Table [dbo].[Partner_Level]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_Level](
	[PARTNER_LEVEL_ID] [int] NULL,
	[LABEL] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL
) ON [PRIMARY]
GO
