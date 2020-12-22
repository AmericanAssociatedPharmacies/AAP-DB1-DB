USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_SLX_Join_jmw]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLX_Join_jmw](
	[account] [varchar](128) NULL,
	[whaccountid] [varchar](32) NULL,
	[WHFREIGHTOPTION] [varchar](20) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Method] [varchar](255) NULL,
	[TM] [varchar](255) NULL
) ON [PRIMARY]
GO
