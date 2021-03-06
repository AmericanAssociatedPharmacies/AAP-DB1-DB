USE [Medispan]
GO
/****** Object:  Table [dbo].[M25GPRR_4]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25GPRR_4](
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[GPPC_Price_Code] [varchar](1) NULL,
	[GPPC_Unit_Price] [numeric](13, 5) NULL,
	[GPPC_Eff_Date] [smalldatetime] NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve] [varchar](5) NULL
) ON [PRIMARY]
GO
