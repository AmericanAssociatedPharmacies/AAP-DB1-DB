USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CHRebates_MailMerge_JMW_ExcludedLeaderOnly]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHRebates_MailMerge_JMW_ExcludedLeaderOnly](
	[Vendor ID] [numeric](18, 0) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](8) NOT NULL,
	[SourceSales] [numeric](18, 2) NULL,
	[GenericRebate] [numeric](18, 2) NULL,
	[LeaderRebate] [numeric](18, 2) NULL,
	[MSIRebate] [numeric](18, 2) NULL,
	[StoreRebate] [numeric](18, 2) NULL,
	[AverageRebatePct] [float] NULL,
	[HRTA] [float] NOT NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL,
	[CheckFee] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
