USE [TempTables]
GO
/****** Object:  Table [dbo].[report_RCRebates_0810_pivotedData]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCRebates_0810_pivotedData](
	[pmid] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[PP Rebate 2010Q3] [numeric](1, 1) NOT NULL,
	[PP Rebate 2010Q4] [numeric](1, 1) NOT NULL,
	[Total PP Rebate 2010] [float] NULL,
	[Q1 API Whse Rebate] [money] NULL,
	[Q1 API Generic Rebate%] [money] NULL,
	[Q2 API Whse Rebate] [money] NULL,
	[Q2 API Generic Rebate%] [money] NULL,
	[Total API Whse Rebate 2010] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
	[Leader AAP 2010Q3] [numeric](1, 1) NOT NULL,
	[Leader AAP 2010Q4] [numeric](1, 1) NOT NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NULL,
	[2/10 Source Sales ] [money] NULL,
	[2/10 AAP Gen Rebate] [money] NULL,
	[2/10 Avg%] [float] NULL,
	[2/10 HRTA%] [float] NULL,
	[3/10 Source Sales ] [money] NULL,
	[3/10 AAP Gen Rebate] [money] NULL,
	[3/10 Avg%] [float] NULL,
	[3/10 HRTA%] [float] NULL,
	[4/10 Source Sales ] [money] NULL,
	[4/10 AAP Gen Rebate] [money] NULL,
	[4/10 Avg%] [float] NULL,
	[4/10 HRTA%] [float] NULL,
	[5/10 Source Sales ] [money] NULL,
	[5/10 AAP Gen Rebate] [money] NULL,
	[5/10 Avg%] [float] NULL,
	[5/10 HRTA%] [float] NULL,
	[6/10 Source Sales ] [money] NULL,
	[6/10 AAP Gen Rebate] [money] NULL,
	[6/10 Avg%] [float] NULL,
	[6/10 HRTA%] [float] NULL,
	[7/10 Source Sales ] [money] NULL,
	[7/10 AAP Gen Rebate] [money] NULL,
	[7/10 Avg%] [float] NULL,
	[7/10 HRTA%] [float] NULL,
	[8/10 Source Sales ] [money] NULL,
	[8/10 AAP Gen Rebate] [money] NULL,
	[8/10 Avg%] [float] NULL,
	[8/10 HRTA%] [float] NULL,
	[Total CH AAP Gen Rebate 2010] [money] NULL,
	[Total YTD All Rebates] [float] NULL
) ON [PRIMARY]
GO
