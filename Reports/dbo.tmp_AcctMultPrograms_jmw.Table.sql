USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AcctMultPrograms_jmw]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AcctMultPrograms_jmw](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[Program Names] [varchar](255) NULL
) ON [PRIMARY]
GO
