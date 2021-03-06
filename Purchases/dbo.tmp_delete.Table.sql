USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_delete]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete](
	[Brand Name] [nvarchar](255) NULL,
	[National Drug Code] [nvarchar](255) NULL,
	[Therapeutic Class GC3 Description] [nvarchar](255) NULL,
	[WAC Unit Price 1] [float] NULL,
	[AWP Unit Price 1] [float] NULL,
	[ndc] [varchar](15) NULL,
	[ncpdp] [varchar](20) NULL,
	[order_qty] [numeric](38, 0) NULL,
	[ship_qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
