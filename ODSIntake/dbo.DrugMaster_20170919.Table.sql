USE [ODSIntake]
GO
/****** Object:  Table [dbo].[DrugMaster_20170919]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_20170919](
	[NDC] [varchar](255) NULL,
	[GPI] [varchar](255) NULL,
	[DrugName] [varchar](255) NULL,
	[MFG] [varchar](255) NULL,
	[DrugType] [varchar](255) NULL,
	[DrugTypeShort] [varchar](255) NULL,
	[Unit] [varchar](255) NULL,
	[Form] [varchar](255) NULL,
	[PS] [varchar](255) NULL,
	[PD] [varchar](255) NULL,
	[RxOTC] [varchar](255) NULL,
	[Repack] [varchar](255) NULL,
	[GPIDesc] [varchar](255) NULL,
	[Strength] [varchar](255) NULL,
	[Strength_Unit_Measure] [varchar](255) NULL,
	[OBSDTEC] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[WACPkg] [varchar](255) NULL,
	[WAC] [varchar](255) NULL,
	[WACEffDate] [varchar](255) NULL,
	[AWPPkg] [varchar](255) NULL,
	[AWP] [varchar](255) NULL,
	[BBDC] [varchar](255) NULL,
	[MSC] [varchar](255) NULL,
	[BNC] [varchar](255) NULL,
	[CSP] [varchar](255) NULL,
	[DESI] [varchar](255) NULL,
	[DEA_Class_Code] [varchar](255) NULL,
	[RouteAdmin] [varchar](255) NULL,
	[RX_OTC_Indicator_Code] [varchar](255) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](255) NULL,
	[AHFSCC_Therapeutic_Class_Code] [varchar](255) NULL
) ON [PRIMARY]
GO
