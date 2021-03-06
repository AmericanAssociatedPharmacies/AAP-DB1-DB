USE [reporting]
GO
/****** Object:  Table [dbo].[qrtrly_gen_rebate_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qrtrly_gen_rebate_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[StoreName] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Store] [nvarchar](50) NULL,
	[IsTotal] [nvarchar](50) NULL,
	[NABP] [nvarchar](50) NULL,
	[CCA] [nvarchar](50) NULL,
	[TotalRxSales] [nvarchar](50) NULL,
	[UnitedCCA] [nvarchar](50) NULL,
	[GenRebatePerc] [nvarchar](50) NULL,
	[GenRebateAmt] [nvarchar](50) NULL,
	[qtrEnd] [datetime] NULL,
 CONSTRAINT [PK_qrtrly_gen_rebate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
