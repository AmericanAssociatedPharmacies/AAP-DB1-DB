USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_G]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_G](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Generic_Product_Identifier] [varchar](14) NULL,
	[Reserve] [varchar](5) NULL,
	[GPI_Generic_Name] [varchar](60) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
