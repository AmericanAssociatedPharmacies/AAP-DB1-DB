USE [TempTables]
GO
/****** Object:  Table [dbo].[report_YTD_Rebates_through0710_091710]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_YTD_Rebates_through0710_091710](
	[pmid] [float] NULL,
	[PP Volume 2010Q1] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Volume 2010Q2] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[Leader API 2010Q1] [money] NULL,
	[Leader API 2010Q2] [money] NULL,
	[API Program 2010Q1] [money] NULL,
	[API Program 2010Q2] [money] NULL,
	[CH API 2010Q1] [money] NULL,
	[CH API 2010Q2] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
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
	[7/10 HRTA%] [float] NULL
) ON [PRIMARY]
GO
