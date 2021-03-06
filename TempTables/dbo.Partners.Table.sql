USE [TempTables]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PARTNER_ID] [int] NULL,
	[PARTNER_CATEGORY_ID] [int] NULL,
	[PARTNER_LEVEL_ID] [int] NULL,
	[NAME] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[URI] [varchar](512) NULL,
	[PHONE_NUM] [varchar](18) NULL,
	[BANNER_FROM_DT] [datetime] NULL,
	[BANNER_TO_DT] [datetime] NULL,
	[BANNER_DISPLAYED] [int] NULL,
	[BANNER_HIT] [int] NULL,
	[NAME_PUBLIC] [varchar](50) NULL,
	[LOGO] [varchar](50) NULL
) ON [PRIMARY]
GO
