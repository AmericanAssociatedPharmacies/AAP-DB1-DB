USE [WebDev]
GO
/****** Object:  Table [dbo].[APISalesDetail_Web]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Web](
	[WHAccountid] [varchar](32) NULL,
	[InvLine] [varchar](32) NULL,
	[InvNbr] [varchar](32) NULL,
	[ItemDescription] [varchar](125) NULL,
	[Qty] [numeric](18, 2) NULL,
	[InvDate] [datetime] NULL,
	[OrderNbr] [varchar](15) NULL,
	[NDC] [varchar](11) NULL
) ON [PRIMARY]
GO
