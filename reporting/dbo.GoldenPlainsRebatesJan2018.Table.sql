USE [reporting]
GO
/****** Object:  Table [dbo].[GoldenPlainsRebatesJan2018]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoldenPlainsRebatesJan2018](
	[Acctg Mo] [float] NULL,
	[Ordr#] [float] NULL,
	[Order Type] [nvarchar](255) NULL,
	[Cust#] [nvarchar](255) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item-Desc] [nvarchar](255) NULL,
	[Inv#] [float] NULL,
	[Inv Date] [float] NULL,
	[Rebate EA] [money] NULL,
	[Qty] [float] NULL,
	[RTRAMT1] [money] NULL,
	[Positive Rebate Amount] [money] NULL,
	[Rebate Sales] [money] NULL
) ON [PRIMARY]
GO
