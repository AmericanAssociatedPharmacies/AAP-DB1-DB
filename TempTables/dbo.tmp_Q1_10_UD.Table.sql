USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD](
	[PMID] [int] NULL,
	[TM#] [varchar](4) NULL,
	[UD#] [varchar](5) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[January 10 Sales] [numeric](38, 2) NULL,
	[February 10 Sales] [numeric](38, 2) NULL,
	[March 10 Sales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
