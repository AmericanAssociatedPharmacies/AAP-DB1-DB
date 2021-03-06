USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPAllNoPurchasesPharm]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPAllNoPurchasesPharm](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitdate] [datetime] NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](32) NULL
) ON [PRIMARY]
GO
