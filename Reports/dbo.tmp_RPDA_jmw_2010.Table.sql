USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RPDA_jmw_2010]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RPDA_jmw_2010](
	[PMID] [int] NULL,
	[AAP#] [varchar](25) NULL,
	[Affiliate] [varchar](100) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[St] [varchar](100) NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[PP Rebate 2010Q3] [float] NULL,
	[PP Rebate 2010Q4] [float] NULL,
	[Total PP Rebate 2010] [float] NULL,
	[Q1 API Whse Rebate] [float] NULL,
	[Q2 API Whse Rebate] [float] NULL,
	[Q3 API Whse Rebate] [float] NULL,
	[Q4 API Whse Rebate] [float] NULL,
	[Total API Whse Rebate 2010] [float] NULL,
	[Q1 API Cardinal Rebate] [float] NULL,
	[Q2 API Cardinal Rebate] [float] NULL,
	[Q3 API Cardinal Rebate] [float] NULL,
	[Q4 API Cardinal Rebate] [float] NULL,
	[Total API Cardinal Rebate 2010] [float] NULL,
	[Leader Rebates 2010Q1] [float] NULL,
	[Leader Rebates 2010Q2] [float] NULL,
	[Leader Rebates 2010Q3] [float] NULL,
	[Leader Rebates 2010Q4] [float] NULL,
	[Total Leader Rebates 2010] [float] NULL,
	[01/10 CA Monthly Gen Rebate] [float] NULL,
	[02/10 CA Monthly Gen Rebate] [float] NULL,
	[03/10 CA Monthly Gen Rebate] [float] NULL,
	[04/10 CA Monthly Gen Rebate] [float] NULL,
	[05/10 CA Monthly Gen Rebate] [float] NULL,
	[06/10 CA Monthly Gen Rebate] [float] NULL,
	[07/10 CA Monthly Gen Rebate] [float] NULL,
	[08/10 CA Monthly Gen Rebate] [float] NULL,
	[09/10 CA Monthly Gen Rebate] [float] NULL,
	[10/10 CA Monthly Gen Rebate] [float] NULL,
	[11/10 CA Monthly Gen Rebate] [float] NULL,
	[12/10 CA Monthly Gen Rebate] [float] NULL,
	[Total CA Monthly Gen Rebate 2010] [float] NULL,
	[Total UD CA Gen Rebate 2010] [float] NULL,
	[Planogram Rebate 2010] [float] NULL,
	[API Generic Incentive 2010] [float] NULL,
	[AAP Patronage Dividend 2010] [float] NULL,
	[Total YTD All Rebates 2010] [float] NULL
) ON [PRIMARY]
GO
