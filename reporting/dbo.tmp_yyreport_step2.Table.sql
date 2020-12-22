USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step2]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step2](
	[vendor_id] [int] NULL,
	[date] [datetime] NULL,
	[volume] [numeric](38, 2) NULL,
	[vendorpair] [nvarchar](50) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
