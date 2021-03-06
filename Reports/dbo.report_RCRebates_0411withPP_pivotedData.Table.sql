USE [Reports]
GO
/****** Object:  Table [dbo].[report_RCRebates_0411withPP_pivotedData]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCRebates_0411withPP_pivotedData](
	[pmid] [float] NULL,
	[PP Volume 2011Q1] [float] NULL,
	[PP Rebate 2011Q1] [float] NULL,
	[PP Volume 2011Q2] [float] NULL,
	[PP Rebate 2011Q2] [float] NULL,
	[PP Volume 2011Q3] [float] NULL,
	[PP Rebate 2011Q3] [float] NULL,
	[PP Volume 2011Q4] [float] NULL,
	[PP Rebate 2011Q4] [float] NULL,
	[Total PP Rebate 2011] [float] NULL,
	[Q1 API Whse Rebate] [money] NULL,
	[Q1 API Generic Rebate%] [float] NULL,
	[Q2 API Whse Rebate] [money] NULL,
	[Q2 API Generic Rebate%] [float] NULL,
	[Q3 API Whse Rebate] [money] NULL,
	[Q3 API Generic Rebate%] [float] NULL,
	[Q4 API Whse Rebate] [money] NULL,
	[Q4 API Generic Rebate%] [float] NULL,
	[Total API Whse Rebate 2011] [money] NULL,
	[HV Incentive 0411] [money] NULL,
	[HV COG Reduction 0411] [float] NULL,
	[Total HV Incentive 2011] [money] NULL,
	[Leader AAP 2011Q1] [numeric](19, 4) NULL,
	[Leader AAP 2011Q2] [numeric](19, 4) NULL,
	[Leader AAP 2011Q3] [numeric](19, 4) NULL,
	[Leader AAP 2011Q4] [numeric](19, 4) NULL,
	[Total Leader AAP 2011] [numeric](38, 4) NULL,
	[01/11 Source Sales ] [money] NULL,
	[01/11 AAP Gen Rebate] [money] NULL,
	[01/11 Avg%] [float] NULL,
	[01/11 HRTA%] [float] NULL,
	[02/11 Source Sales ] [money] NULL,
	[02/11 AAP Gen Rebate] [money] NULL,
	[02/11 Avg%] [float] NULL,
	[02/11 HRTA%] [float] NULL,
	[03/11 Source Sales ] [money] NULL,
	[03/11 AAP Gen Rebate] [money] NULL,
	[03/11 Avg%] [float] NULL,
	[03/11 HRTA%] [float] NULL,
	[04/11 Source Sales ] [money] NULL,
	[04/11 AAP Gen Rebate] [money] NULL,
	[04/11 Avg%] [float] NULL,
	[04/11 HRTA%] [float] NULL,
	[Total CH AAP Gen Rebate 2011] [money] NULL,
	[Planogram Rebate 2011] [numeric](2, 2) NOT NULL,
	[API Generic Incentive 2011] [numeric](2, 2) NOT NULL,
	[AAP Patronage Dividend 2011] [numeric](2, 2) NOT NULL,
	[Total YTD All Rebates 2011] [float] NULL
) ON [PRIMARY]
GO
