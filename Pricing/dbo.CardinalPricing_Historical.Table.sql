USE [Pricing]
GO
/****** Object:  Table [dbo].[CardinalPricing_Historical]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalPricing_Historical](
	[UPC] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[VIN] [varchar](50) NULL,
	[CONTRACT_CODE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](50) NULL,
	[SHORT_DESCRIPTION] [varchar](50) NULL,
	[STRENGTH] [varchar](50) NULL,
	[FORM] [varchar](50) NULL,
	[SIZE] [varchar](50) NULL,
	[RXOTC] [varchar](50) NULL,
	[MINORDER] [varchar](50) NULL,
	[QTY] [varchar](50) NULL,
	[UNITS] [varchar](50) NULL,
	[AWP] [varchar](50) NULL,
	[INV] [varchar](50) NULL,
	[MSR] [varchar](50) NULL,
	[MANUFACTURER] [varchar](50) NULL,
	[UPDATED] [varchar](50) NULL,
	[GPI] [varchar](50) NULL,
	[BGO] [varchar](50) NULL
) ON [PRIMARY]
GO
