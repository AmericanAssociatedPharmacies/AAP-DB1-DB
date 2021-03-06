USE [TempTables]
GO
/****** Object:  Table [dbo].[import_SN_2011]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_SN_2011](
	[CORP_ITEM_NUM] [nvarchar](255) NULL,
	[NDC_CDE] [nvarchar](255) NULL,
	[CORP_DESC] [nvarchar](255) NULL,
	[VENDOR_NAM] [nvarchar](255) NULL,
	[Net] [float] NULL,
	[Nifo] [float] NULL,
	[Usage] [nvarchar](255) NULL,
	[New Price] [nvarchar](255) NULL,
	[old ext#] [money] NULL,
	[new ext#] [money] NULL,
	[inc#/dec#$] [money] NULL,
	[inc#/dec#%] [float] NULL
) ON [PRIMARY]
GO
