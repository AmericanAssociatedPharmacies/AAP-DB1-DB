USE [Purchases]
GO
/****** Object:  Table [dbo].[CHAAP_ACCTNO_MISMATCH]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_ACCTNO_MISMATCH](
	[PMID] [int] NULL,
	[AcctNoCHDetail] [varchar](31) NULL,
	[AcctNoCHAccounts] [varchar](31) NULL
) ON [PRIMARY]
GO
