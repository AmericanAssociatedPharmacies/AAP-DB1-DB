USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AplWarehouse]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AplWarehouse](
	[CustomerStatus] [varchar](128) NULL,
	[CreditAlert] [varchar](128) NULL,
	[APIPaymentTerms] [varchar](128) NULL,
	[APIPaymentMethod] [varchar](128) NULL,
	[Warehouse] [varchar](128) NULL,
	[OrderCutoff] [varchar](128) NULL,
	[MOT] [varchar](128) NULL,
	[FreightOption] [varchar](128) NULL,
	[SatDelivery] [varchar](128) NULL,
	[Version] [varchar](128) NULL,
	[SandTStatus] [varchar](128) NULL,
	[CSOSStatus] [varchar](128) NULL,
	[Alert] [varchar](128) NULL,
	[WrhsApplStatus] [varchar](128) NULL,
	[DispensingSystem] [varchar](128) NULL
) ON [PRIMARY]
GO
