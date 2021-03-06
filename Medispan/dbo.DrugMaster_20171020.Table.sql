USE [Medispan]
GO
/****** Object:  Table [dbo].[DrugMaster_20171020]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrugMaster_20171020](
	[NDC] [varchar](11) NOT NULL,
	[GPI] [nvarchar](14) NULL,
	[DrugName] [nvarchar](30) NULL,
	[MFG] [nvarchar](30) NULL,
	[DrugType] [varchar](50) NULL,
	[DrugTypeShort] [varchar](3) NULL,
	[Unit] [nvarchar](2) NULL,
	[Form] [nvarchar](4) NULL,
	[PS] [decimal](10, 3) NULL,
	[PD] [varchar](50) NULL,
	[RxOTC] [varchar](3) NULL,
	[Repack] [nvarchar](1) NULL,
	[GPIDesc] [nvarchar](60) NULL,
	[Strength] [nvarchar](15) NULL,
	[Strength_Unit_of_Measure] [nvarchar](10) NULL,
	[OBSDTEC] [int] NULL,
	[DEA] [nvarchar](1) NULL,
	[WACPkg] [decimal](18, 5) NULL,
	[WAC] [decimal](18, 5) NULL,
	[WACEffDate] [decimal](19, 0) NULL,
	[AWPPkg] [real] NULL,
	[AWP] [real] NULL,
	[BBDC] [decimal](19, 0) NULL,
	[MSC] [nvarchar](1) NULL,
	[BNC] [nvarchar](1) NULL,
	[CSP] [int] NULL,
	[DESI] [nvarchar](1) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[RouteAdmin] [nvarchar](2) NULL,
	[RX_OTC_Indicator_Code] [nvarchar](1) NULL,
	[Unit_DoseUnit_of_Use_Package] [nvarchar](1) NULL,
	[AHFSCC_Therapeutic_Class_Code] [int] NULL
) ON [PRIMARY]
GO
