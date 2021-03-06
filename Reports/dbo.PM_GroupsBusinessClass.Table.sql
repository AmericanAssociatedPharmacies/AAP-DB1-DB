USE [Reports]
GO
/****** Object:  Table [dbo].[PM_GroupsBusinessClass]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_GroupsBusinessClass](
	[PMID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[Businessclass] [varchar](4) NULL,
	[GroupNo] [varchar](20) NULL
) ON [PRIMARY]
GO
