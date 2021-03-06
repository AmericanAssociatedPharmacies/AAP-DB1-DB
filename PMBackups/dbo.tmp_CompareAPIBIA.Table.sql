USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_CompareAPIBIA]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareAPIBIA](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIAccountno] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL,
	[DEA] [varchar](50) NULL
) ON [PRIMARY]
GO
