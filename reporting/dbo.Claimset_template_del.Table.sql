USE [reporting]
GO
/****** Object:  Table [dbo].[Claimset_template_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claimset_template_del](
	[NDC] [char](11) NULL,
	[DrugName] [varchar](63) NULL,
	[Strength] [varchar](31) NULL,
	[BrandType] [varchar](31) NULL,
	[DAW] [varchar](63) NULL,
	[Field6] [varchar](15) NULL,
	[DotNbr] [int] NULL,
	[Metrics] [varchar](15) NULL,
	[TRxCount] [int] NULL,
	[TRxQuantity] [int] NULL,
	[TotalAWP] [float] NULL,
	[PatientPaid] [float] NULL,
	[TotalPaid] [float] NULL,
	[DispensingFee] [float] NULL,
	[TotalIngredientCost] [float] NULL,
	[UsualCustomary] [float] NULL
) ON [PRIMARY]
GO
