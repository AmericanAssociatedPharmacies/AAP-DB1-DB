USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CHGR0611_mailmerge_keystone_v1]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHGR0611_mailmerge_keystone_v1](
	[Vendor ID] [numeric](18, 0) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [float] NULL,
	[HRTA] [float] NOT NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
