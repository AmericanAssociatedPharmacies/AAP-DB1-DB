USE [reporting]
GO
/****** Object:  Table [dbo].[VolumeNorm]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeNorm](
	[acct_no] [varchar](8) NULL,
	[dt] [datetime] NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[volume] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
