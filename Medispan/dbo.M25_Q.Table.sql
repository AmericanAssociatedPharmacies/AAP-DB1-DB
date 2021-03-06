USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_Q]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_Q](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Reserve_1] [varchar](1) NULL,
	[WAC_Package_Price] [numeric](10, 2) NULL,
	[WAC_Unit_Price] [numeric](13, 5) NULL,
	[Effective_Date] [smalldatetime] NULL,
	[Older_WAC_Pkg_Price] [numeric](10, 2) NULL,
	[Older_WAC_Unit_Price] [numeric](13, 5) NULL,
	[Older_WAC_Eff_Date] [smalldatetime] NULL,
	[Reserve_2] [varchar](16) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
