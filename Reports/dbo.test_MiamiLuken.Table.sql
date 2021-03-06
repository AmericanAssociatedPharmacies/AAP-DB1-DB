USE [Reports]
GO
/****** Object:  Table [dbo].[test_MiamiLuken]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_MiamiLuken](
	[MLID] [int] IDENTITY(1,1) NOT NULL,
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
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_test_MiamiLuken] PRIMARY KEY CLUSTERED 
(
	[MLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
