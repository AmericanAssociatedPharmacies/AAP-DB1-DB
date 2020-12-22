USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_confAttPipco]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_confAttPipco](
	[PMID] [int] NOT NULL,
	[Company Name] [varchar](255) NULL,
	[AAP Acct#] [varchar](255) NULL,
	[API Acct#] [varchar](255) NULL,
	[IsPipco] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
