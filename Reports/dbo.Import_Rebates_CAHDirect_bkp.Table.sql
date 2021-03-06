USE [Reports]
GO
/****** Object:  Table [dbo].[Import_Rebates_CAHDirect_bkp]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_Rebates_CAHDirect_bkp](
	[PMID] [int] NULL,
	[GenericRebate] [money] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[GroupRebatePmts] [money] NULL,
	[ST] [nvarchar](255) NULL,
	[SortCode] [nvarchar](255) NULL,
	[PaymentMethod] [nvarchar](255) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
