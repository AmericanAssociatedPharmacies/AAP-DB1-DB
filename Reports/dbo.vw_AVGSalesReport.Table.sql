USE [Reports]
GO
/****** Object:  Table [dbo].[vw_AVGSalesReport]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vw_AVGSalesReport](
	[PMID] [int] NULL,
	[TerritoryName] [varchar](250) NULL,
	[PharmacyName] [varchar](250) NULL,
	[AAPNumber] [varchar](250) NULL,
	[AAPParent] [varchar](250) NULL,
	[GroupNo] [varchar](250) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[AAPEffectiveDate] [date] NULL,
	[AAPQuitDate] [date] NULL,
	[TotalBRx] [decimal](18, 2) NULL,
	[TotalGRx] [decimal](18, 2) NULL,
	[OtherRx] [decimal](18, 2) NULL,
	[NonRx] [decimal](18, 2) NULL,
	[Excluded] [decimal](18, 2) NULL,
	[AVGTotal] [decimal](18, 2) NULL,
	[APIBrand] [decimal](18, 2) NULL,
	[APIGen] [decimal](18, 2) NULL,
	[APIOTC] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
