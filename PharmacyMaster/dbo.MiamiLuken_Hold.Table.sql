USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[MiamiLuken_Hold]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiamiLuken_Hold](
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
