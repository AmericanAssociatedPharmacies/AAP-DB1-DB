USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_WHVol_6mo]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WHVol_6mo](
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[Acct#] [varchar](50) NULL,
	[Pharmacy Name] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[ST] [varchar](100) NULL,
	[ZIP] [varchar](100) NULL,
	[API May 12 Total Whse] [float] NULL,
	[API Jun 12 Total Whse] [float] NULL,
	[API Jul 12 Total Whse] [float] NULL,
	[API Aug 12 Total Whse] [float] NULL,
	[API Sep 12 Total Whse] [float] NULL,
	[API Oct 12 Total Whse] [float] NULL
) ON [PRIMARY]
GO
