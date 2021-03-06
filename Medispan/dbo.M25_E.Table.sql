USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_E]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_E](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Product_Name] [varchar](25) NULL,
	[Product_Name_Extension] [varchar](35) NULL,
	[Reserve_1] [varchar](8) NULL,
	[Allergy_Pattern_Code] [numeric](37, 0) NULL,
	[Reserve_2] [varchar](2) NULL,
	[PPG_Indicator_Code] [varchar](1) NULL,
	[HFPG_Indicator_Code] [varchar](1) NULL,
	[Labeler_Type_Code] [varchar](1) NULL,
	[Pricing_Spread_Code] [varchar](1) NULL,
	[Reserve_3] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
