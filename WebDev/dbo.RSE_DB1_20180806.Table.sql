USE [WebDev]
GO
/****** Object:  Table [dbo].[RSE_DB1_20180806]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSE_DB1_20180806](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountID] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[InvDate] [datetime] NULL,
	[NDC] [varchar](11) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[Type] [varchar](15) NULL
) ON [PRIMARY]
GO
