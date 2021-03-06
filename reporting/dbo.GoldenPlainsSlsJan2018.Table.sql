USE [reporting]
GO
/****** Object:  Table [dbo].[GoldenPlainsSlsJan2018]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoldenPlainsSlsJan2018](
	[IDSROM] [nvarchar](255) NULL,
	[Cust#] [nvarchar](255) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item] [nvarchar](255) NULL,
	[Group] [nvarchar](255) NULL,
	[Desc] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Sales Price] [money] NULL,
	[Gross Sales] [money] NULL,
	[Discount] [float] NULL,
	[Discount Amt] [money] NULL,
	[Adjust for Discounts] [nvarchar](255) NULL,
	[IDNSVA1] [money] NULL,
	[Calc Gross less Disc] [money] NULL,
	[Variance] [money] NULL,
	[Inv Date] [nvarchar](255) NULL,
	[Inv #] [nvarchar](255) NULL,
	[Ord Cls] [nvarchar](255) NULL,
	[Admin Grp] [nvarchar](255) NULL,
	[Smn] [nvarchar](255) NULL
) ON [PRIMARY]
GO
