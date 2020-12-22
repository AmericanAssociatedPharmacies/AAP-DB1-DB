USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CA_MarkM]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CA_MarkM](
	[CORP_ITEM_NUM] [float] NULL,
	[NDC_CDE] [float] NULL,
	[CORP_DESC] [nvarchar](255) NULL,
	[VENDOR_NAM] [nvarchar](255) NULL,
	[Net] [float] NULL,
	[Nifo] [float] NULL
) ON [PRIMARY]
GO
