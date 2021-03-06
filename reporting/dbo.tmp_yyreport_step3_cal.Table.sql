USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_yyreport_step3_cal]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_step3_cal](
	[vendor_id] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[qscal] [nvarchar](6) NULL,
	[qcal] [int] NULL,
	[ycal] [int] NULL,
	[volume] [numeric](38, 2) NULL,
	[rebate] [numeric](38, 2) NULL,
	[stores] [int] NULL
) ON [PRIMARY]
GO
