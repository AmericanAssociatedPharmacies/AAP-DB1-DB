USE [ODSIntake]
GO
/****** Object:  Table [dbo].[ConfCredits_2019]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfCredits_2019](
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
	[INVOICE ADJ] [nvarchar](255) NULL,
	[Calc Gross less Disc] [money] NULL,
	[Variance] [money] NULL,
	[Inv Date] [float] NULL,
	[Inv #] [float] NULL,
	[Admin Grp] [nvarchar](255) NULL
) ON [PRIMARY]
GO
