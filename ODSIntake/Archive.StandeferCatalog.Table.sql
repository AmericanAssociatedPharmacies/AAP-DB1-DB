USE [ODSIntake]
GO
/****** Object:  Table [Archive].[StandeferCatalog]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[StandeferCatalog](
	[UPC] [varchar](15) NULL,
	[NDC] [varchar](15) NULL,
	[VIN] [varchar](250) NULL,
	[CONTRACT_CODE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](255) NULL,
	[SHORT_DESCRIPTION] [varchar](50) NULL,
	[STRENGTH] [varchar](50) NULL,
	[FORM] [varchar](100) NULL,
	[SIZE] [varchar](50) NULL,
	[RXOTC] [varchar](50) NULL,
	[MINORDER] [varchar](50) NULL,
	[QTY] [varchar](50) NULL,
	[UNITS] [varchar](50) NULL,
	[AWP] [real] NULL,
	[INV] [real] NULL,
	[MSR] [varchar](50) NULL,
	[MANUFACTURER] [varchar](50) NULL,
	[UPDATED] [datetime] NULL,
	[GPI] [varchar](25) NULL,
	[BGO] [varchar](50) NULL,
	[DateKey] [datetime] NULL,
	[CatalogDate] [varchar](8) NULL
) ON [PRIMARY]
GO
