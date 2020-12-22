USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_delete_TRUECal2010YTD_CASbyPMID]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_TRUECal2010YTD_CASbyPMID](
	[volAcct] [int] NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[1Q10Paid] [int] NULL,
	[2Q10Paid] [int] NULL
) ON [PRIMARY]
GO
