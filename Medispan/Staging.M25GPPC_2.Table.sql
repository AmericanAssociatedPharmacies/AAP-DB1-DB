USE [Medispan]
GO
/****** Object:  Table [Staging].[M25GPPC_2]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[M25GPPC_2](
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[Package_Size] [numeric](8, 3) NULL,
	[Package_Size_Unit_of_Measure] [varchar](2) NULL,
	[Package_Quantity] [numeric](37, 0) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Package_Description_Code] [varchar](2) NULL,
	[Generic_Product_Identifier] [varchar](14) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](8) NULL,
	[Reserve] [varchar](15) NULL
) ON [PRIMARY]
GO
