USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_delete_Cal2010YTD_CAS]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_Cal2010YTD_CAS](
	[fy_end] [varchar](4) NULL,
	[acct_no] [varchar](5) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](14, 2) NULL,
	[february] [numeric](14, 2) NULL,
	[march] [numeric](14, 2) NULL,
	[april] [numeric](14, 2) NULL,
	[may] [numeric](14, 2) NULL,
	[june] [numeric](14, 2) NULL,
	[1Q10Paid] [bit] NULL,
	[2Q10Paid] [bit] NULL
) ON [PRIMARY]
GO
