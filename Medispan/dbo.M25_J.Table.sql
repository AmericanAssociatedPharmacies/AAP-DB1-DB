USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_J]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_J](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Manufacturers_Labeler_Name] [varchar](30) NULL,
	[Manufacturers_Abbreviated_Na] [varchar](10) NULL,
	[Product_Description_Abbreviat] [varchar](25) NULL,
	[Drug_Name_Code] [varchar](6) NULL,
	[Generic_Product_Packaging_Cod] [varchar](8) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
