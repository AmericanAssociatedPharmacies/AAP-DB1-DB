USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RCVol_6mo_Rx]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RCVol_6mo_Rx](
	[PMID] [int] NULL,
	[Rx30 Jan 16 TotalScripts] [int] NULL,
	[Rx30 Jan 16 TotalPaid] [numeric](38, 3) NULL,
	[Rx30 Feb 16 TotalScripts] [int] NULL,
	[Rx30 Feb 16 TotalPaid] [numeric](38, 3) NULL,
	[Rx30 Mar 16 TotalScripts] [int] NULL,
	[Rx30 Mar 16 TotalPaid] [numeric](38, 3) NULL,
	[Rx30 Apr 16 TotalScripts] [int] NULL,
	[Rx30 Apr 16 TotalPaid] [numeric](38, 3) NULL,
	[Rx30 May 16 TotalScripts] [int] NULL,
	[Rx30 May 16 TotalPaid] [numeric](38, 3) NULL,
	[Rx30 Jun 16 TotalScripts] [int] NULL,
	[Rx30 Jun 16 TotalPaid] [numeric](38, 3) NULL
) ON [PRIMARY]
GO
