USE [Reports]
GO
/****** Object:  Table [dbo].[report_RCRebates_0411withPP_affiliates]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCRebates_0411withPP_affiliates](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](8) NULL,
	[AAP Quit] [varchar](8) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[PP Rebate 2011Q1] [float] NOT NULL,
	[PP Rebate 2011Q2] [float] NOT NULL,
	[PP Rebate 2011Q3] [float] NOT NULL,
	[PP Rebate 2011Q4] [float] NOT NULL,
	[Total PP Rebate 2011] [float] NOT NULL,
	[Q1 API Whse Rebate] [money] NOT NULL,
	[Q1 API Generic Rebate%] [float] NOT NULL,
	[Q2 API Whse Rebate] [money] NOT NULL,
	[Q2 API Generic Rebate%] [float] NOT NULL,
	[Q3 API Whse Rebate] [money] NOT NULL,
	[Q3 API Generic Rebate%] [float] NOT NULL,
	[Q4 API Whse Rebate] [money] NOT NULL,
	[Q4 API Generic Rebate%] [float] NOT NULL,
	[Total API Whse Rebate 2011] [money] NOT NULL,
	[HV Incentive 0411] [money] NOT NULL,
	[HV COG Reduction 0411] [float] NOT NULL,
	[Total HV Incentive 2011] [money] NOT NULL,
	[Leader AAP 2011Q1] [numeric](19, 4) NOT NULL,
	[Leader AAP 2011Q2] [numeric](19, 4) NOT NULL,
	[Leader AAP 2011Q3] [numeric](19, 4) NOT NULL,
	[Leader AAP 2011Q4] [numeric](19, 4) NOT NULL,
	[Total Leader AAP 2011] [numeric](38, 4) NOT NULL,
	[01/11 Source Sales] [money] NOT NULL,
	[01/11 AAP Gen Rebate] [money] NOT NULL,
	[01/11 Avg%] [float] NOT NULL,
	[01/11 HRTA%] [float] NOT NULL,
	[02/11 Source Sales] [money] NOT NULL,
	[02/11 AAP Gen Rebate] [money] NOT NULL,
	[02/11 Avg%] [float] NOT NULL,
	[02/11 HRTA%] [float] NOT NULL,
	[03/11 Source Sales] [money] NOT NULL,
	[03/11 AAP Gen Rebate] [money] NOT NULL,
	[03/11 Avg%] [float] NOT NULL,
	[03/11 HRTA%] [float] NOT NULL,
	[04/11 Source Sales] [money] NOT NULL,
	[04/11 AAP Gen Rebate] [money] NOT NULL,
	[04/11 Avg%] [float] NOT NULL,
	[04/11 HRTA%] [float] NOT NULL,
	[Total CH AAP Gen Rebate 2011] [money] NOT NULL,
	[Planogram Rebate 2011] [numeric](2, 2) NOT NULL,
	[API Generic Incentive 2011] [numeric](2, 2) NOT NULL,
	[AAP Patronage Dividend 2011] [numeric](2, 2) NOT NULL,
	[Total YTD All Rebates 2011] [float] NOT NULL
) ON [PRIMARY]
GO
