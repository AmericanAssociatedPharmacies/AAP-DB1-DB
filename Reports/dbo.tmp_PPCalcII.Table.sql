USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCalcII]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCalcII](
	[NDC] [varchar](15) NULL,
	[Customer_No] [varchar](31) NULL,
	[Lesser3Mo] [float] NULL,
	[AAPActualUsageToDate] [numeric](38, 0) NULL,
	[PriceDiff] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
