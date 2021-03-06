USE [reporting]
GO
/****** Object:  Table [dbo].[report_baselineFY2008_members_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_baselineFY2008_members_del](
	[acct_no] [varchar](4) NULL,
	[ncpdp] [varchar](7) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL
) ON [PRIMARY]
GO
