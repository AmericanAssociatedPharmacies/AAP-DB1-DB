USE [API]
GO
/****** Object:  Table [dbo].[APICardVolume]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICardVolume](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
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
	[December] [numeric](18, 2) NULL,
 CONSTRAINT [PK_APICardVolume] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
