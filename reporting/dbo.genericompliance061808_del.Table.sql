USE [reporting]
GO
/****** Object:  Table [dbo].[genericompliance061808_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genericompliance061808_del](
	[store] [nvarchar](50) NULL,
	[vendor_name] [nvarchar](50) NULL,
	[ud_acct] [nvarchar](50) NULL,
	[vendor_id] [nvarchar](50) NULL,
	[master_vendor] [nvarchar](50) NULL,
	[gJan] [money] NULL,
	[gFeb] [money] NULL,
	[gMar] [money] NULL,
	[gApr] [money] NULL,
	[gJun] [money] NULL,
	[gJul] [money] NULL,
	[gAug] [money] NULL,
	[gSep] [money] NULL,
	[gOct] [money] NULL,
	[gNov] [money] NULL,
	[gDec] [money] NULL,
	[rxJan] [money] NULL,
	[rxFeb] [money] NULL,
	[rxMar] [money] NULL,
	[rxApr] [money] NULL,
	[rxMay] [money] NULL,
	[rxJun] [money] NULL,
	[rxJul] [money] NULL,
	[rxAug] [money] NULL,
	[rxSep] [money] NULL,
	[rxOct] [money] NULL,
	[rxNov] [money] NULL,
	[rxDec] [money] NULL,
	[cJan] [real] NULL,
	[cFeb] [real] NULL,
	[cMar] [real] NULL,
	[cApr] [real] NULL,
	[cMay] [real] NULL,
	[cJun] [real] NULL,
	[cJul] [real] NULL,
	[cAug] [real] NULL,
	[cSep] [real] NULL,
	[cOct] [real] NULL,
	[cNov] [real] NULL,
	[cDec] [real] NULL
) ON [PRIMARY]
GO
