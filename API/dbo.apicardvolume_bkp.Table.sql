USE [API]
GO
/****** Object:  Table [dbo].[apicardvolume_bkp]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apicardvolume_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[CardinalNo] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[January] [numeric](18, 2) NULL,
	[February] [numeric](18, 2) NULL,
	[March] [numeric](18, 2) NULL,
	[April] [numeric](18, 2) NULL,
	[May] [numeric](18, 2) NULL,
	[June] [numeric](18, 2) NULL,
	[July] [numeric](18, 2) NULL,
	[August] [numeric](18, 2) NULL,
	[September] [numeric](18, 2) NULL,
	[October] [numeric](18, 2) NULL,
	[November] [numeric](18, 2) NULL,
	[December] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
