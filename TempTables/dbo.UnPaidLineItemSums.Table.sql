USE [TempTables]
GO
/****** Object:  Table [dbo].[UnPaidLineItemSums]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnPaidLineItemSums](
	[PAYEE_ID] [int] NULL,
	[UNPAIDAMT] [float] NULL
) ON [PRIMARY]
GO
