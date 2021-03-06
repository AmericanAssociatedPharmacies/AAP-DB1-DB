USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009GrpedCAS]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009GrpedCAS](
	[volacct] [varchar](8) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[january] [numeric](38, 2) NULL,
	[february] [numeric](38, 2) NULL,
	[march] [numeric](38, 2) NULL,
	[april] [numeric](38, 2) NULL,
	[may] [numeric](38, 2) NULL,
	[june] [numeric](38, 2) NULL,
	[july] [numeric](38, 2) NULL,
	[august] [numeric](38, 2) NULL,
	[september] [numeric](38, 2) NULL,
	[october] [numeric](38, 2) NULL,
	[november] [numeric](38, 2) NULL,
	[december] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
