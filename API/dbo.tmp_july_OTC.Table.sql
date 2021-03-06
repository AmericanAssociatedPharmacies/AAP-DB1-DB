USE [API]
GO
/****** Object:  Table [dbo].[tmp_july_OTC]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_july_OTC](
	[InvNbr] [float] NULL,
	[Type] [float] NULL,
	[IDORNO] [float] NULL,
	[LineNo] [float] NULL,
	[WHAccountID] [varchar](255) NULL,
	[InvDate] [float] NULL,
	[ItemDescription] [varchar](255) NULL,
	[QTY] [float] NULL,
	[Derived Column 1] [float] NULL,
	[Derived Column 2] [float] NULL,
	[ExtSales] [float] NULL,
	[Territory] [varchar](50) NULL,
	[Group] [varchar](255) NULL
) ON [PRIMARY]
GO
