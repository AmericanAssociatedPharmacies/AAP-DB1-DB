USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PriceProt_Total]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PriceProt_Total](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[Price Protection Rebate] [money] NULL,
	[Price Protection Adjustment] [money] NULL,
	[Account Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL
) ON [PRIMARY]
GO
