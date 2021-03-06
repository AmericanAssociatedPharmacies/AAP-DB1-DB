USE [ODSIntake]
GO
/****** Object:  Table [dbo].[G06_20190702]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[G06_20190702](
	[Invoice] [float] NULL,
	[CustNum] [nvarchar](255) NULL,
	[InvDate] [float] NULL,
	[Item] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Price] [money] NULL,
	[Ext Price] [money] NULL,
	[ItemGrp] [nvarchar](255) NULL
) ON [PRIMARY]
GO
