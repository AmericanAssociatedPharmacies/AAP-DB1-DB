USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[OldNewVendorsLink]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OldNewVendorsLink](
	[VendorID] [int] NULL,
	[OldVendorID] [int] NULL,
	[OldVolumeName] [varchar](50) NULL,
	[Reports] [varchar](1) NULL,
	[Active] [int] NULL,
	[EffectDate] [datetime] NULL,
	[Factor] [numeric](2, 2) NULL,
	[TotalPercentRebate] [numeric](2, 2) NULL,
	[Active2007] [int] NULL,
	[VendorPair] [int] NULL,
	[PPVendorID] [int] NULL,
	[OldRebateName] [varchar](50) NULL
) ON [PRIMARY]
GO
