USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_C]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_C](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Old_NDC_UPC_HRI] [varchar](11) NULL,
	[Reserve_1] [varchar](1) NULL,
	[Old_Formatted_Id_Number] [varchar](13) NULL,
	[Old_Eff_Date] [varchar](5) NULL,
	[New_NDC_UPC_HRI] [varchar](11) NULL,
	[Reserve_2] [varchar](1) NULL,
	[New_Formatted_Id_Number] [varchar](13) NULL,
	[New_Eff_Date] [varchar](5) NULL,
	[Reserve_3] [varchar](19) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
