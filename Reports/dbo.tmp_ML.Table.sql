USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ML]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ML](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[UDAccountNo] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[TotalSales] [float] NULL,
	[RxSales] [float] NULL,
	[GenericSales] [float] NULL,
	[RebatePerc] [varchar](50) NULL,
	[TotalRebate] [float] NULL,
	[AdminRebate] [float] NULL,
	[GenericRebate] [float] NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
