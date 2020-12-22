USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PPCalc_B4Update]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PPCalc_B4Update](
	[NDC] [varchar](15) NULL,
	[Customer_No] [varchar](31) NULL,
	[Lesser3Mo] [float] NULL,
	[AAPUsageForCalculation] [float] NULL,
	[PriceDiff] [money] NULL,
	[AAPUnitCost] [money] NULL,
	[aapeffectdate] [datetime] NULL
) ON [PRIMARY]
GO
