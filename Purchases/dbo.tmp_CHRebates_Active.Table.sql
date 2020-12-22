USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_CHRebates_Active]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHRebates_Active](
	[Date] [datetime] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
	[PMID] [numeric](18, 0) NULL,
	[NCPDP] [varchar](20) NULL,
	[CalcRebatePerc] [money] NULL
) ON [PRIMARY]
GO
