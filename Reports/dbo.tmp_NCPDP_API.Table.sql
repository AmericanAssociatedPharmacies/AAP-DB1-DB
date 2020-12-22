USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_NCPDP_API]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NCPDP_API](
	[PMID] [int] NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[DateOpened] [datetime] NULL,
	[NCPDP] [varchar](20) NULL
) ON [PRIMARY]
GO
