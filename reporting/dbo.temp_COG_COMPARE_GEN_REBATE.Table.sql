USE [reporting]
GO
/****** Object:  Table [dbo].[temp_COG_COMPARE_GEN_REBATE]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_COMPARE_GEN_REBATE](
	[StoreName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Store] [nvarchar](50) NULL,
	[IsTotal] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[CCA] [nvarchar](50) NULL,
	[TotalRxSales] [nvarchar](50) NULL,
	[UnitedCCA] [nvarchar](50) NULL,
	[GenRebatePerc] [nvarchar](50) NULL,
	[GenRebateAmt] [nvarchar](50) NULL
) ON [PRIMARY]
GO
