USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_R]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_R](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[AWP_Indicator_Code] [varchar](1) NULL,
	[AWP_Package_Price] [numeric](10, 2) NULL,
	[AWP_Unit_Price] [numeric](13, 5) NULL,
	[AWP_Effective_Date] [smalldatetime] NULL,
	[Older_AWP_Package_Price] [numeric](10, 2) NULL,
	[Older_AWP_Unit_Price] [numeric](13, 5) NULL,
	[Older_AWP_Effective_Date] [smalldatetime] NULL,
	[Reserve] [varchar](16) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
