USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ppShip3]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ppShip3](
	[ship_qty] [numeric](18, 0) NULL,
	[ndc] [varchar](15) NULL,
	[customer_no] [varchar](31) NULL,
	[inv_date] [datetime] NULL
) ON [PRIMARY]
GO
