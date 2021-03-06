USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_LeaderRebate0310_MM]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_LeaderRebate0310_MM](
	[pmid] [numeric](29, 0) NULL,
	[account name] [nvarchar](255) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NOT NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contact] [varchar](255) NULL,
	[month] [varchar](8) NOT NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
