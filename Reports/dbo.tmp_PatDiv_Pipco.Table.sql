USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDiv_Pipco]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDiv_Pipco](
	[PMID] [int] NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Total Patr Div] [numeric](18, 2) NULL,
	[Pay on Apr 2012] [numeric](18, 2) NULL,
	[Pay on Jul 2012] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
