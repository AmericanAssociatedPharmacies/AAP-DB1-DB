USE [API]
GO
/****** Object:  Table [dbo].[apisalesdetail_BeforeChange]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apisalesdetail_BeforeChange](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[CustomerName] [varchar](75) NULL,
	[APIItemNbr] [varchar](50) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [int] NULL,
	[UnitAmount] [numeric](18, 2) NULL,
	[ItemGrp] [varchar](5) NULL,
	[AcctGrp] [varchar](5) NULL,
	[Territory] [varchar](4) NULL,
	[InvDate] [datetime] NULL,
	[TotalAmount] [numeric](18, 2) NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC_orig] [varchar](50) NULL,
	[NDC] [varchar](11) NULL,
	[DateLoaded] [datetime] NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
