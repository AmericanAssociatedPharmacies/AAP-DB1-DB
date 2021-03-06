USE [API]
GO
/****** Object:  Table [dbo].[tmp_wh_aug2]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wh_aug2](
	[InvNo] [float] NULL,
	[Type] [float] NULL,
	[OrderNo] [float] NULL,
	[LineNo] [float] NULL,
	[WHAccountID] [varchar](255) NULL,
	[InvDate] [datetime] NULL,
	[PrdCode] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[IDSALP] [float] NULL,
	[IDAMOU] [float] NULL,
	[extsales] [float] NULL,
	[Territory] [varchar](255) NULL,
	[ItmGrp] [varchar](255) NULL
) ON [PRIMARY]
GO
