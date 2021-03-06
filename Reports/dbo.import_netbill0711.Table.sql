USE [Reports]
GO
/****** Object:  Table [dbo].[import_netbill0711]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_netbill0711](
	[CORP_ITEM_NUM] [varchar](255) NULL,
	[NDC_CDE] [varchar](11) NULL,
	[CORP_DESC] [nvarchar](255) NULL,
	[VENDOR_NAM] [nvarchar](255) NULL,
	[Net] [float] NULL,
	[Nifo] [float] NULL,
	[Brand Y/N] [nvarchar](255) NULL,
	[Last 3 mo mvmt] [nvarchar](255) NULL
) ON [PRIMARY]
GO
