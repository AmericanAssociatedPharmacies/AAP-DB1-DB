USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_cs]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_cs](
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[AAPParent#] [varchar](20) NULL,
	[Territory] [varchar](4) NULL,
	[Acct#] [varchar](32) NOT NULL,
	[Status] [varchar](32) NULL,
	[Name] [varchar](65) NULL,
	[ST] [varchar](2) NULL,
	[Date Opened] [datetime] NULL,
	[July BR] [numeric](18, 2) NULL,
	[July GEN] [numeric](18, 2) NULL,
	[July OTC] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
