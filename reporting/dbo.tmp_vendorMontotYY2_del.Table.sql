USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_vendorMontotYY2_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorMontotYY2_del](
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[vendorpair] [nvarchar](50) NULL,
	[factor] [numeric](16, 15) NULL,
	[Vol2008] [numeric](38, 2) NULL,
	[Vol2007] [float] NULL,
	[Rebate2008] [float] NULL,
	[Rebate2007] [float] NULL
) ON [PRIMARY]
GO
