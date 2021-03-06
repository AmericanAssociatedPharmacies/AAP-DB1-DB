USE [API]
GO
/****** Object:  Table [dbo].[tmp_wh_aug]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wh_aug](
	[InvNo] [float] NULL,
	[Type] [float] NULL,
	[OrderNo] [float] NULL,
	[LineNo] [float] NULL,
	[WHAccountID] [varchar](255) NULL,
	[InvDate] [datetime] NULL,
	[PrdCode] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Derived Column_IDSALP] [float] NULL,
	[Derived Column_IDAMOU] [float] NULL,
	[extsales] [numeric](18, 2) NULL,
	[Territory] [varchar](255) NULL,
	[ItmGrp] [varchar](255) NULL
) ON [PRIMARY]
GO
