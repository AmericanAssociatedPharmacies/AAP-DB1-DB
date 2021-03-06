USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_CompareAPIBusCls]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareAPIBusCls](
	[PMID] [int] NOT NULL,
	[DEA] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[Status] [varchar](32) NULL,
	[PM_Affiliate] [varchar](125) NULL,
	[ASW_BusinessClass] [varchar](125) NULL
) ON [PRIMARY]
GO
