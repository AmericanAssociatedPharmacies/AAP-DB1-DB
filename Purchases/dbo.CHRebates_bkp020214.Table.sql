USE [Purchases]
GO
/****** Object:  Table [dbo].[CHRebates_bkp020214]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebates_bkp020214](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[CHRebatePerc] [float] NULL
) ON [PRIMARY]
GO
