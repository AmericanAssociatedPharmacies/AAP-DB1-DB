USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_MoreEpic]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MoreEpic](
	[AccountName] [varchar](255) NULL,
	[Addr] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](255) NULL,
	[GroupAlliance] [varchar](255) NULL,
	[AcctMgr] [varchar](255) NULL,
	[Owner] [varchar](255) NULL,
	[TM] [varchar](50) NULL,
	[AcctMgrID] [char](12) NULL,
	[SeccodeID] [char](12) NULL
) ON [PRIMARY]
GO
