USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step3_fy]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step3_fy](
	[vendor_id] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[qsfy] [nvarchar](6) NULL,
	[qfy] [int] NULL,
	[yfy] [int] NULL,
	[volume] [numeric](38, 2) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
