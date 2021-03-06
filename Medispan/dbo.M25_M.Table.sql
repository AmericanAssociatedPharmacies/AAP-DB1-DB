USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_M]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_M](
	[NDC_UPC_HRI] [varchar](11) NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Strength] [numeric](13, 5) NULL,
	[Strength_Unit_Measure] [varchar](11) NULL,
	[Limited_Dist_Code] [varchar](2) NULL,
	[Extended_AHFS_Thera_Class_Cod] [numeric](37, 0) NULL,
	[Inactive_Date] [smalldatetime] NULL,
	[Reserve] [varchar](37) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
