USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_CompareAPIPMID_PMID]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareAPIPMID_PMID](
	[PMID] [int] NOT NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[PM_PMID] [int] NOT NULL,
	[API_PMID] [int] NULL
) ON [PRIMARY]
GO
