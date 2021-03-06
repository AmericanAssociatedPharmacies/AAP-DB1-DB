USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_CS_Grandfather]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CS_Grandfather](
	[PMID #] [int] NOT NULL,
	[TM #] [varchar](4) NULL,
	[AAP #] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[API #] [varchar](20) NULL,
	[Store dba Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Account Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[PVA March 2010] [float] NULL,
	[PVA April 2010] [float] NULL,
	[PVA May 2010] [float] NULL,
	[PVA June 2010] [float] NULL,
	[PVA July 2010] [float] NULL,
	[PVA August 2010] [float] NULL,
	[API March 2010] [numeric](38, 2) NULL,
	[API April 2010] [numeric](38, 2) NULL,
	[API May 2010] [numeric](38, 2) NULL,
	[API June 2010] [numeric](38, 2) NULL,
	[API July 2010] [numeric](38, 2) NULL,
	[API August 2010] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
