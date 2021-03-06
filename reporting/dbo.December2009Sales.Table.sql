USE [reporting]
GO
/****** Object:  Table [dbo].[December2009Sales]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[December2009Sales](
	[Cust#] [nvarchar](11) NULL,
	[Item#] [nvarchar](255) NULL,
	[Item] [nvarchar](35) NULL,
	[Group] [nvarchar](5) NULL,
	[Desc] [nvarchar](30) NULL,
	[Qty] [decimal](15, 3) NULL,
	[Sales Price] [decimal](17, 4) NULL,
	[Ext Sales] [float] NULL,
	[Inv Date] [decimal](8, 0) NULL,
	[Inv #] [decimal](7, 0) NULL,
	[Ord Cls] [nvarchar](2) NULL,
	[Admin Grp] [nvarchar](6) NULL,
	[Smn] [nvarchar](10) NULL
) ON [PRIMARY]
GO
