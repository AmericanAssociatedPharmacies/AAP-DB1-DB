USE [Purchases]
GO
/****** Object:  Table [dbo].[CHPrice]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPrice](
	[NDC] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](19, 4) NULL,
	[DateLoaded] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[WeekNo] [int] NULL
) ON [PRIMARY]
GO
