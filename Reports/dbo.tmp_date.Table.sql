USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_date]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_date](
	[NCPDP] [varchar](7) NULL,
	[YR] [numeric](4, 0) NULL,
	[MO] [numeric](2, 0) NULL,
	[AMOUNT] [float] NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
