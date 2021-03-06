USE [API]
GO
/****** Object:  Table [dbo].[APIQ409Verify]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIQ409Verify](
	[WHAccountID] [varchar](32) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[Item] [varchar](125) NULL,
	[AcctGrp] [varchar](5) NULL,
	[ItemDescription] [varchar](125) NULL,
	[QTY] [numeric](18, 2) NULL,
	[SalesPrice] [numeric](18, 2) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[InvDate] [datetime] NULL,
	[InvNbr] [varchar](15) NULL,
	[OrdCls] [nvarchar](255) NULL,
	[AdminGrp] [varchar](50) NULL,
	[Territory] [varchar](5) NULL,
	[F14] [varchar](50) NULL,
	[F15] [varchar](50) NULL
) ON [PRIMARY]
GO
