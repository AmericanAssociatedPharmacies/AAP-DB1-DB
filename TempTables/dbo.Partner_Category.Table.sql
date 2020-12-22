USE [TempTables]
GO
/****** Object:  Table [dbo].[Partner_Category]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_Category](
	[PARTNER_CATEGORY_ID] [int] NULL,
	[CATEGORY] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL
) ON [PRIMARY]
GO
