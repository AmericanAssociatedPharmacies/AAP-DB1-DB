USE [reporting]
GO
/****** Object:  Table [dbo].[PartnerCategory]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerCategory](
	[PARTNER_CATEGORY_ID] [int] NULL,
	[CATEGORY] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL
) ON [PRIMARY]
GO
