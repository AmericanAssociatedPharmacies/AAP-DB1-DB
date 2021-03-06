USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PartnerFactors]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerFactors](
	[VendorID] [int] NOT NULL,
	[Factor] [numeric](5, 4) NULL,
	[EffectiveFrom] [datetime] NULL,
	[EffectiveUntil] [datetime] NULL
) ON [PRIMARY]
GO
