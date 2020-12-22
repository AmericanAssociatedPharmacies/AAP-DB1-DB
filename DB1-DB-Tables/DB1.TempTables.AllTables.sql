USE [TempTables]
GO
/****** Object:  Table [dbo].[ALL_Volume_110310KEEP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_110310KEEP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_bkp_020917]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_bkp_020917](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_bkp_050216]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_bkp_050216](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_bkp_051616]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_bkp_051616](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_bkp_102516]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_bkp_102516](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALL_Volume_bkp06192018]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_bkp06192018](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_bkp120716]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_bkp120716](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_bkp20180312]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_bkp20180312](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_test_052416]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_test_052416](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_test_052416II]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_test_052416II](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[All_Volume_test_bkp_102516]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[All_Volume_test_bkp_102516](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[all_volume_testBKP_052416]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[all_volume_testBKP_052416](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllVolumeBKP011815]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllVolumeBKP011815](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_backup_010411]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_backup_010411](
	[AuditID] [bigint] IDENTITY(1,1) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[SysUser] [varchar](50) NOT NULL,
	[Application] [varchar](50) NOT NULL,
	[TableName] [sysname] NOT NULL,
	[Operation] [char](1) NOT NULL,
	[PrimaryKey] [nvarchar](max) NOT NULL,
	[PrimaryKey2] [nvarchar](max) NULL,
	[PrimaryKey3] [nvarchar](max) NULL,
	[PrimaryKey4] [nvarchar](max) NULL,
	[PrimaryKey5] [nvarchar](max) NULL,
	[RowDescription] [varchar](50) NULL,
	[SecondaryRow] [varchar](50) NULL,
	[ColumnName] [sysname] NULL,
	[OldValue] [varchar](50) NULL,
	[NewValue] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[backup_deleteAfter080911_PM_Geocode]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backup_deleteAfter080911_PM_Geocode](
	[pmid] [int] NOT NULL,
	[GAddress] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Updated] [datetime] NULL,
	[pm_address_type] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chaap_admin_test]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chaap_admin_test](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENExcl] [float] NULL,
	[GENTotal] [float] NULL,
	[Brand] [float] NULL,
	[Extended] [float] NULL,
	[VolAdminFee] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrebates4_totalNDCDEA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates4_totalNDCDEA](
	[month] [int] NULL,
	[year] [int] NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[DEA] [int] NOT NULL,
	[QTY] [numeric](38, 0) NULL,
	[EXT_COST] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrebates4_totalPMIDDEA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates4_totalPMIDDEA](
	[month] [int] NULL,
	[year] [int] NULL,
	[PMID] [int] NULL,
	[DEA] [int] NOT NULL,
	[QTY] [numeric](38, 0) NULL,
	[EXT_COST] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrebates5_totalNDCDEA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates5_totalNDCDEA](
	[year] [int] NULL,
	[month] [int] NULL,
	[NDC] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[DEA] [int] NOT NULL,
	[SR] [varchar](6) NOT NULL,
	[QTY_SUM] [numeric](38, 0) NULL,
	[EXT_COST_SUM] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chrebates5_totalPMIDDEA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates5_totalPMIDDEA](
	[year] [int] NULL,
	[month] [int] NULL,
	[PMID] [int] NULL,
	[DEA] [int] NOT NULL,
	[SR] [varchar](6) NOT NULL,
	[QTY_SUM] [numeric](38, 0) NULL,
	[EXT_COST_SUM] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chreturns_MS]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns_MS](
	[NDC] [varchar](11) NOT NULL,
	[DEA] [int] NOT NULL,
	[GPI] [varchar](14) NULL,
	[GPIDesc] [varchar](60) NULL,
	[TC_GPI] [varchar](10) NULL,
	[TC_GPI_Name] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chreturns_source]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns_source](
	[ID] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[DEA] [int] NOT NULL,
	[GPI] [varchar](14) NULL,
	[GPIDesc] [varchar](60) NULL,
	[TC_GPI] [varchar](10) NULL,
	[TC_GPI_Name] [varchar](60) NULL,
	[SR] [varchar](6) NOT NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[QTR] [varchar](6) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chreturns1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chreturns2]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns2](
	[NDC] [varchar](11) NOT NULL,
	[DEA] [int] NOT NULL,
	[GPI] [varchar](14) NULL,
	[GPIDesc] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chreturns3]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns3](
	[DEA] [int] NULL,
	[GPI] [varchar](14) NULL,
	[ID] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chreturns7_totals_R]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns7_totals_R](
	[year] [int] NULL,
	[month] [int] NULL,
	[sale_qty_all] [numeric](38, 1) NULL,
	[sale_cost_all] [float] NULL,
	[return_qty_all] [numeric](38, 1) NULL,
	[return_cost_all] [float] NULL,
	[sale_qty_C2] [numeric](38, 1) NULL,
	[sale_cost_C2] [float] NULL,
	[return_qty_C2] [numeric](38, 1) NULL,
	[return_cost_C2] [float] NULL,
	[sales_C2%sales_all] [float] NULL,
	[ret%sales_all] [float] NULL,
	[ret%sales_C2] [float] NULL,
	[ret_C2%ret_all] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[del_CHAcct_AAP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[del_CHAcct_AAP](
	[Ship To Division] [float] NULL,
	[Ship To Division Name] [nvarchar](255) NULL,
	[Ship To Number] [nvarchar](255) NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[DEA Registration Number] [nvarchar](255) NULL,
	[Default Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Contract Group Number] [float] NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Actual WAPD 90 days] [float] NULL,
	[MMP DSO 90 days] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[del_CHAcct_API]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[del_CHAcct_API](
	[Ship To Division] [float] NULL,
	[Ship To Division Name] [nvarchar](255) NULL,
	[Ship To Number] [nvarchar](255) NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[DEA Registration Number] [nvarchar](255) NULL,
	[Default Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Contract Group Number] [float] NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Actual WAPD 90 days] [float] NULL,
	[MMP DSO 90 days] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[del_CHAcct_PIPCO]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[del_CHAcct_PIPCO](
	[Ship To Division] [float] NULL,
	[Ship To Division Name] [nvarchar](255) NULL,
	[Ship To Number] [nvarchar](255) NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[DEA Registration Number] [nvarchar](255) NULL,
	[Default Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Contract Group Number] [float] NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Actual WAPD 90 days] [float] NULL,
	[MMP DSO 90 days] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[del_CHAcct_UD]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[del_CHAcct_UD](
	[Ship To Division] [float] NULL,
	[Ship To Division Name] [nvarchar](255) NULL,
	[Ship To Number] [nvarchar](255) NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[DEA Registration Number] [nvarchar](255) NULL,
	[Default Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Contract Group Number] [float] NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Actual WAPD 90 days] [float] NULL,
	[MMP DSO 90 days] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_77325]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_77325](
	[Tran ID] [float] NULL,
	[Line] [float] NULL,
	[ST] [float] NULL,
	[Payee ID] [float] NULL,
	[Payee Name] [nvarchar](255) NULL,
	[RxNumber] [float] NULL,
	[DateClaim] [float] NULL,
	[DateService] [nvarchar](255) NULL,
	[DateReceived] [nvarchar](255) NULL,
	[Type] [float] NULL,
	[paid] [float] NULL,
	[submitted] [float] NULL,
	[adjustments] [float] NULL,
	[patientpaid] [float] NULL,
	[dispfee] [float] NULL,
	[NDC] [float] NULL,
	[F17] [nvarchar](255) NULL,
	[balanced] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_aapPVA0614]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_aapPVA0614](
	[pmid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_bg1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_bg1](
	[ncpdp] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_ncpdp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_ncpdp](
	[NCPDP] [nvarchar](7) NULL,
	[NPI] [nvarchar](10) NULL,
	[DEA] [nvarchar](12) NULL,
	[DEAEXP] [nvarchar](8) NULL,
	[Name] [nvarchar](60) NULL,
	[Address] [nvarchar](55) NULL,
	[Address1] [nvarchar](55) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](9) NULL,
	[Phone] [nvarchar](10) NULL,
	[Ext] [nvarchar](5) NULL,
	[Fax] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[ChainCode] [nvarchar](3) NULL,
	[AffiliateName] [nvarchar](35) NULL,
	[AffiliateType] [varchar](max) NULL,
	[key] [nvarchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_ndcnotfound]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_ndcnotfound](
	[Column 0] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_postcard]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_postcard](
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip9] [nvarchar](255) NULL,
	[Zip5] [nvarchar](255) NULL,
	[phonef] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phone2f] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[SMSA] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[YN] [nvarchar](255) NULL,
	[ID] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_postcard2]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_postcard2](
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip9] [nvarchar](255) NULL,
	[Zip5] [nvarchar](255) NULL,
	[phonef] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phone2f] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[SMSA] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[YN] [nvarchar](255) NULL,
	[ID] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[key] [nvarchar](265) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_postcard3]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_postcard3](
	[ncpdp] [nvarchar](7) NULL,
	[npi] [nvarchar](10) NULL,
	[name_ncpdp] [nvarchar](60) NULL,
	[affiliatename] [nvarchar](35) NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip9] [nvarchar](255) NULL,
	[Zip5] [nvarchar](255) NULL,
	[phonef] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phone2f] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[SMSA] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[YN] [nvarchar](255) NULL,
	[ID] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[key] [nvarchar](265) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_postcard4]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_postcard4](
	[ncpdp] [nvarchar](7) NULL,
	[npi] [nvarchar](10) NULL,
	[name_ncpdp] [nvarchar](60) NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip9] [nvarchar](255) NULL,
	[Zip5] [nvarchar](255) NULL,
	[phonef] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phone2f] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[SMSA] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[YN] [nvarchar](255) NULL,
	[ID] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[key] [nvarchar](265) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_postcard5]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_postcard5](
	[pmid] [int] NULL,
	[AAP] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[MC] [varchar](1) NOT NULL,
	[ncpdp] [nvarchar](7) NULL,
	[npi] [nvarchar](10) NULL,
	[name_ncpdp] [nvarchar](60) NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip9] [nvarchar](255) NULL,
	[Zip5] [nvarchar](255) NULL,
	[phonef] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[phone2f] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[County] [nvarchar](255) NULL,
	[SMSA] [float] NULL,
	[Type] [nvarchar](255) NULL,
	[YN] [nvarchar](255) NULL,
	[ID] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL,
	[F20] [nvarchar](255) NULL,
	[F21] [nvarchar](255) NULL,
	[F22] [nvarchar](255) NULL,
	[F23] [nvarchar](255) NULL,
	[F24] [nvarchar](255) NULL,
	[F25] [nvarchar](255) NULL,
	[key] [nvarchar](265) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_u_plan_contract_080514]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_u_plan_contract_080514](
	[CONTRACT_ID] [int] NULL,
	[SERVICE_AREA] [varchar](100) NULL,
	[EFFECTIVE_DT] [datetime] NULL,
	[INDIVIDUAL_AGREEMENT] [smallint] NULL,
	[MEMBERS] [int] NULL,
	[INCLUDES_RURAL] [smallint] NULL,
	[POS_CHARGE] [numeric](6, 2) NULL,
	[MAND_FORMULARY] [char](6) NULL,
	[MAND_GEN_SUB] [char](6) NULL,
	[BRAND_REIMB] [varchar](255) NULL,
	[GEN_REIMB] [varchar](255) NULL,
	[PAY_METHOD] [varchar](40) NULL,
	[PAY_FREQ] [varchar](90) NULL,
	[BILL_TIME_LIMIT] [varchar](60) NULL,
	[ADD_INFO] [varchar](4000) NULL,
	[CLIENT_DESC] [char](3) NULL,
	[ACTIVE] [smallint] NULL,
	[SIGNED_CONTRACT] [smallint] NULL,
	[EXPIRATION_DT] [datetime] NULL,
	[CANCEL_DT] [datetime] NULL,
	[NOTIFY] [smallint] NULL,
	[NOTIFY_NOTES] [varchar](200) NULL,
	[NOTIFY_DIR] [smallint] NULL,
	[NOTIFY_CO] [varchar](90) NULL,
	[COPAY] [varchar](47) NULL,
	[ADMIN_FEE] [varchar](248) NULL,
	[COPAY_MIN] [varchar](49) NULL,
	[LAST_UPDATE] [datetime] NULL,
	[UPDATE_BY] [char](10) NULL,
	[AUDIT] [varchar](200) NULL,
	[LIABILITY] [varchar](110) NULL,
	[CONTRACT_TYPE] [varchar](25) NULL,
	[AUTO_RENEWAL] [smallint] NULL,
	[PLAN_NAME] [varchar](134) NULL,
	[ENVOY_BIN] [varchar](30) NULL,
	[ANSI_BIN] [varchar](255) NULL,
	[PRIOR_AUTHORIZATION] [smallint] NULL,
	[PCN] [varchar](255) NULL,
	[GROUP_NUM] [varchar](30) NULL,
	[ADD_NOTIFY] [smallint] NULL,
	[INCLUDES_ALASKA] [smallint] NULL,
	[NOTIFY_FORMAT] [char](3) NULL,
	[WEBSITE] [varchar](50) NULL,
	[PA_NOTE] [varchar](50) NULL,
	[PRICE_UPDATES] [varchar](12) NULL,
	[UPDATE_SOURCE] [varchar](20) NULL,
	[MSB_REIMB] [varchar](200) NULL,
	[ATTACH_KEY] [int] NULL,
	[PARENT_COMPANY] [varchar](134) NULL,
	[SSB_AWP_PCT] [float] NULL,
	[SSB_AWP_FEE] [float] NULL,
	[GEN_MAC_AMT] [float] NULL,
	[GEN_AWP_PCT] [float] NULL,
	[GEN_AWP_FEE] [float] NULL,
	[SSG_AWP_PCT] [float] NULL,
	[SSG_AWP_FEE] [float] NULL,
	[REMITTANCE_COMMENT] [varchar](255) NULL,
	[NETWORK_TYPE] [varchar](25) NULL,
	[MC_REP] [varchar](3) NULL,
	[WAC_BASED] [smallint] NULL,
	[AWP_RESPONDED] [smallint] NULL,
	[SSG_REIMB] [varchar](255) NULL,
	[FACTOR_METHOD] [smallint] NULL,
	[AWP_RESPONDED_PRESEPT2009] [smallint] NULL,
	[AWP_RESPONDED_POSTSEPT2009] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipp_conference041614]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipp_conference041614](
	[pmid] [int] NULL,
	[npi] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[affiliate] [varchar](125) NULL,
	[accountname] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[parent] [varchar](119) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[export0831$]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[export0831$](
	[CCID] [float] NULL,
	[CCDate] [datetime] NULL,
	[email] [nvarchar](255) NULL,
	[CCStatus] [nvarchar](255) NULL,
	[Company Name] [nvarchar](255) NULL,
	[NCPDP#] [float] NULL,
	[ID] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[Yes - Certified Diabetes Educator] [nvarchar](255) NULL,
	[Yes - Non-Certified] [float] NULL,
	[No] [float] NULL,
	[Comment] [nvarchar](255) NULL,
	[Yes] [float] NULL,
	[No1] [float] NULL,
	[Comment1] [nvarchar](255) NULL,
	[Yes1] [float] NULL,
	[No2] [float] NULL,
	[Comment2] [nvarchar](255) NULL,
	[Yes2] [float] NULL,
	[No3] [float] NULL,
	[Comment3] [nvarchar](255) NULL,
	[Level 1- 3: Defined as LOW, MEDIUM and HIGH level of skill] [float] NULL,
	[Level 4 - STERILE:  must submit USP 797 guidelines for sterile c] [nvarchar](255) NULL,
	[No4] [float] NULL,
	[Comment4] [nvarchar](255) NULL,
	[Light - canes crutches, wheelchairs] [float] NULL,
	[Heavy - O2, CPAPs, CPMs, hospital beds, motorized chairs, other ] [float] NULL,
	[I am a DME Accredited pharmacy] [float] NULL,
	[No5] [float] NULL,
	[Comment5] [nvarchar](255) NULL,
	[Yes - Self Administered] [float] NULL,
	[Yes - Intermediary / Third Party Administered] [nvarchar](255) NULL,
	[No6] [float] NULL,
	[Comment6] [nvarchar](255) NULL,
	[Yes - Flu vaccines] [float] NULL,
	[Yes - Travel vaccines] [float] NULL,
	[No7] [float] NULL,
	[Other] [nvarchar](255) NULL,
	[Comment7] [nvarchar](255) NULL,
	[Yes3] [float] NULL,
	[No8] [float] NULL,
	[Comment8] [nvarchar](255) NULL,
	[Yes4] [float] NULL,
	[No9] [float] NULL,
	[Comment9] [nvarchar](255) NULL,
	[Retirement Communities] [float] NULL,
	[Assisted Living Facilities] [float] NULL,
	[Hospice Centers] [float] NULL,
	[Skilled Nursing Facilities] [float] NULL,
	[Other1] [nvarchar](255) NULL,
	[Comment10] [nvarchar](255) NULL,
	[Yes - At no charge] [float] NULL,
	[Yes - Charge a fee] [float] NULL,
	[No10] [float] NULL,
	[Comment11] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foo](
	[db] [varchar](29) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[object_id] [int] NOT NULL,
	[principal_id] [int] NULL,
	[schema_id] [int] NOT NULL,
	[parent_object_id] [int] NOT NULL,
	[type] [char](2) NOT NULL,
	[type_desc] [nvarchar](60) NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NOT NULL,
	[is_ms_shipped] [bit] NOT NULL,
	[is_published] [bit] NOT NULL,
	[is_schema_published] [bit] NOT NULL,
	[lob_data_space_id] [int] NULL,
	[filestream_data_space_id] [int] NULL,
	[max_column_id_used] [int] NOT NULL,
	[lock_on_bulk_load] [bit] NOT NULL,
	[uses_ansi_nulls] [bit] NULL,
	[is_replicated] [bit] NULL,
	[has_replication_filter] [bit] NULL,
	[is_merge_published] [bit] NULL,
	[is_sync_tran_subscribed] [bit] NULL,
	[has_unchecked_assembly_data] [bit] NOT NULL,
	[text_in_row_limit] [int] NULL,
	[large_value_types_out_of_row] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesDir_Wayne]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDir_Wayne](
	[Name] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Mail] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[County] [varchar](255) NULL,
	[POP] [float] NULL,
	[Chain] [varchar](255) NULL,
	[Derived Column_CHQ] [varchar](255) NULL,
	[StoreNum] [varchar](255) NULL,
	[Branch] [varchar](255) NULL,
	[Other] [varchar](255) NULL,
	[FullState] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesEx1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesEx1](
	[NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[POP] [int] NULL,
	[CHAIN] [nvarchar](255) NULL,
	[CHQ] [nvarchar](255) NULL,
	[STORENUM] [nvarchar](255) NULL,
	[BRANCH] [nvarchar](255) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](255) NULL,
	[SName] [nvarchar](4000) NULL,
	[SAddress] [nvarchar](4000) NULL,
	[Zip5] [nvarchar](5) NULL,
	[SPhone] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesEx2_vpma]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesEx2_vpma](
	[pmid] [int] NOT NULL,
	[SName] [nvarchar](4000) NULL,
	[SCorporatename] [nvarchar](4000) NULL,
	[SAddress] [nvarchar](4000) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip5] [varchar](5) NULL,
	[SPhone] [nvarchar](4000) NULL,
	[accountdescription] [varchar](200) NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[apistatus] [varchar](32) NULL,
	[territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesMatch1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesMatch1](
	[pmid] [int] NULL,
	[accountdescription] [varchar](200) NULL,
	[aapaccountno] [varchar](20) NULL,
	[aapstatus] [varchar](32) NULL,
	[apiaccountno] [varchar](20) NULL,
	[apistatus] [varchar](32) NULL,
	[territory] [varchar](4) NULL,
	[NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[POP] [int] NULL,
	[CHAIN] [nvarchar](255) NULL,
	[CHQ] [nvarchar](255) NULL,
	[STORENUM] [nvarchar](255) NULL,
	[BRANCH] [nvarchar](255) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HayesSource]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesSource](
	[NAME] [nvarchar](255) NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[MAIL] [nvarchar](255) NULL,
	[CITY] [nvarchar](255) NULL,
	[STATE] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[FAX] [nvarchar](255) NULL,
	[COUNTY] [nvarchar](255) NULL,
	[POP] [int] NULL,
	[CHAIN] [nvarchar](255) NULL,
	[CHQ] [nvarchar](255) NULL,
	[STORENUM] [nvarchar](255) NULL,
	[BRANCH] [nvarchar](255) NULL,
	[OTHER] [nvarchar](255) NULL,
	[FULLSTATE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_AAPAV1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AAPAV1](
	[pmid] [float] NULL,
	[AAPID] [float] NULL,
	[accountname] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[AAPExtended0210] [float] NULL,
	[AAPExtended0310] [float] NULL,
	[AAPExtended0410] [float] NULL,
	[AAPExtendedTotal] [float] NULL,
	[AAPGQ0210] [float] NULL,
	[AAPGQ0310] [float] NULL,
	[AAPGQ0410] [float] NULL,
	[AAPGQTotal] [float] NULL,
	[AAPGE0210] [float] NULL,
	[AAPGE0310] [float] NULL,
	[AAPGE0410] [float] NULL,
	[AAPGETotal] [float] NULL,
	[AAPBrand0210] [float] NULL,
	[AAPBrand0310] [float] NULL,
	[AAPBrand0410] [float] NULL,
	[AAPBrandTotal] [float] NULL,
	[AAPAdminFee0210] [float] NULL,
	[AAPAdminFee0310] [float] NULL,
	[AAPAdminFee0410] [float] NULL,
	[AAPAdminFeeTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH0210FP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH0210FP](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH0310FP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH0310FP](
	[PMID] [numeric](29, 0) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH0410FP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH0410FP](
	[Pay Account] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH0410FP_load1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH0410FP_load1](
	[Pay Account] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH0410FP_QA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH0410FP_QA](
	[Pay Account] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[HRTA] [float] NULL,
	[TMName] [varchar](71) NULL,
	[Corpname] [varchar](100) NULL,
	[f_address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[f_contact] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[fedid] [varchar](12) NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[territory] [varchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH0410FP_QA_preSalesReport]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH0410FP_QA_preSalesReport](
	[Pay Account] [bit] NOT NULL,
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[HRTA] [float] NULL,
	[TMName] [varchar](71) NULL,
	[f_address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[f_contact] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[fedid] [varchar](12) NULL,
	[aapaccountno] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CH1QFP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CH1QFP](
	[PMID] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Print Rebate Letter] [bit] NOT NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[Gross 1Q10 Rebate] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Leader Net Rebate] [money] NULL,
	[Net 1Q10 Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net 1Q10 Rebate to Store] [money] NULL,
	[Cardinal Program Rebate] [money] NULL,
	[API Program Rebate] [money] NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[CA Division] [nvarchar](255) NULL,
	[Grand Total Purchases] [money] NULL,
	[Total Cardinal Sales] [money] NULL,
	[Cardinal Non-Net Sales] [money] NULL,
	[Vol Admin Fee] [money] NULL,
	[CA Brand Sales] [money] NULL,
	[CA Generic Contract Sales] [money] NULL,
	[CA Generic Rebate] [money] NULL,
	[CA Rebate to Pay out] [money] NULL,
	[API ADMIN FEE] [money] NULL,
	[API -TO PAY Cardinal Side-NO P2] [money] NULL,
	[CA-P2P3 SALES] [money] NULL,
	[CA-P2P3 REBATES] [money] NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Whse Sales] [money] NULL,
	[API WHSE REBATE] [money] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[ECOG] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CHAccounts0310]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHAccounts0310](
	[contract] [varchar](5) NOT NULL,
	[Ship To Division] [float] NULL,
	[Ship To Division Name] [nvarchar](255) NULL,
	[Ship To Number] [nvarchar](255) NULL,
	[Ship To Name] [nvarchar](255) NULL,
	[Ship To Address 1] [nvarchar](255) NULL,
	[Ship To City] [nvarchar](255) NULL,
	[Ship To State] [nvarchar](255) NULL,
	[DEA Registration Number] [nvarchar](255) NULL,
	[Default Buy Plan %] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[AR2000 Terms Code Description] [nvarchar](255) NULL,
	[Contract Group Number] [float] NULL,
	[Contract Group Effective Date] [datetime] NULL,
	[Actual WAPD 90 days] [float] NULL,
	[MMP DSO 90 days] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CHFinal0610]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHFinal0610](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[Sort Code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CHFinal0610_calcVariance]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHFinal0610_calcVariance](
	[pmid] [nvarchar](255) NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[calc] [money] NULL,
	[csfn] [float] NULL,
	[sort code] [nvarchar](255) NULL,
	[pay to store] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CHRebate0710]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHRebate0710](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[Sort Code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_CHRebate0810]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHRebate0810](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOf Extended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Effective Rebate%] [float] NULL,
	[Sort Code] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_GR0510_Final]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_GR0510_Final](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Division] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Territory Manager] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_NCPA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_NCPA](
	[PMID] [float] NULL,
	[NCPAid] [nvarchar](255) NULL,
	[Pharmacy] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_pprebates_bkpB4ChangeAffiliateAmounts082212]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_pprebates_bkpB4ChangeAffiliateAmounts082212](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [float] NULL,
	[Affiliate] [varchar](255) NULL,
	[LastPayment] [float] NULL,
	[PaidToStore] [float] NULL,
	[PaidToAffiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_SN_2011]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_SN_2011](
	[CORP_ITEM_NUM] [nvarchar](255) NULL,
	[NDC_CDE] [nvarchar](255) NULL,
	[CORP_DESC] [nvarchar](255) NULL,
	[VENDOR_NAM] [nvarchar](255) NULL,
	[Net] [float] NULL,
	[Nifo] [float] NULL,
	[Usage] [nvarchar](255) NULL,
	[New Price] [nvarchar](255) NULL,
	[old ext#] [money] NULL,
	[new ext#] [money] NULL,
	[inc#/dec#$] [money] NULL,
	[inc#/dec#%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_SN_2012]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_SN_2012](
	[Item Number] [nvarchar](255) NULL,
	[Desc] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Price] [float] NULL,
	[Usage] [nvarchar](255) NULL,
	[Ext# cost] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loginTest]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loginTest](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTMOutcomesReport]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTMOutcomesReport](
	[Composite Score] [float] NULL,
	[Pie Score] [float] NULL,
	[nabp] [float] NULL,
	[pharmacyname] [nvarchar](255) NULL,
	[NCPDPRelationshipID] [float] NULL,
	[NCPDPRelationshipName] [nvarchar](255) NULL,
	[NCPDPParentID] [float] NULL,
	[NCPDPParentOrg] [nvarchar](255) NULL,
	[TipOpportunities] [float] NULL,
	[CompletedTips] [float] NULL,
	[SuccessfulTips] [float] NULL,
	[TipNetEffectiveRate] [float] NULL,
	[StarTipOpportunties] [float] NULL,
	[CompletedStarTips] [float] NULL,
	[SuccessfulStarTips] [float] NULL,
	[StarNetEffectiveRate] [float] NULL,
	[CostTipOpportunities] [float] NULL,
	[CompletedCostTips] [float] NULL,
	[SuccessfulCostTips] [float] NULL,
	[CostNetEffectiveRate] [float] NULL,
	[QualityTipOpportunities] [float] NULL,
	[CompletedQualityTips] [float] NULL,
	[SuccessfulQualityTips] [float] NULL,
	[QualityNetEffectiveRate] [float] NULL,
	[CMROpportunities] [float] NULL,
	[cmroffers] [float] NULL,
	[CMRCompleted] [float] NULL,
	[CMRNetEffectiveRate] [float] NULL,
	[EligiblePatients] [float] NULL,
	[ClaimsSubmitted] [float] NULL,
	[Star Score ] [float] NULL,
	[Cost Quality Score] [float] NULL,
	[CMR Score] [float] NULL,
	[MC Status PM] [smallint] NULL,
	[AAP Status PM] [nvarchar](255) NULL,
	[NCPDP Chain Code] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPAIneligible]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPAIneligible](
	[PMID] [float] NULL,
	[AAPAccountno] [float] NULL,
	[AAPParentNo] [float] NULL,
	[Text Field] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[Accountname] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[contactfullname] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCPALoad]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPALoad](
	[PMID] [int] NULL,
	[NCPAid] [nvarchar](255) NULL,
	[Pharmacy] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NeedMailingAddress]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeedMailingAddress](
	[AccountName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Cardinal Account #] [float] NULL,
	[ContactFullName] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[dea] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[npi] [nvarchar](255) NULL,
	[F16] [nvarchar](255) NULL,
	[F17] [nvarchar](255) NULL,
	[F18] [nvarchar](255) NULL,
	[F19] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nonBKPurchasingPharms]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nonBKPurchasingPharms](
	[CUSTOMER_NO] [nvarchar](255) NULL,
	[PMID] [float] NULL,
	[CUSTOMER_NAME] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_Category]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_Category](
	[PARTNER_CATEGORY_ID] [int] NULL,
	[CATEGORY] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_Level]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_Level](
	[PARTNER_LEVEL_ID] [int] NULL,
	[LABEL] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[ORDER] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PARTNER_ID] [int] NULL,
	[PARTNER_CATEGORY_ID] [int] NULL,
	[PARTNER_LEVEL_ID] [int] NULL,
	[NAME] [varchar](255) NULL,
	[DESCRIPTION] [varchar](2048) NULL,
	[URI] [varchar](512) NULL,
	[PHONE_NUM] [varchar](18) NULL,
	[BANNER_FROM_DT] [datetime] NULL,
	[BANNER_TO_DT] [datetime] NULL,
	[BANNER_DISPLAYED] [int] NULL,
	[BANNER_HIT] [int] NULL,
	[NAME_PUBLIC] [varchar](50) NULL,
	[LOGO] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy1_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy1_bkp](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](80) NULL,
	[Addr2] [varchar](80) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIStatus] [varchar](32) NULL,
	[AreaCode] [varchar](3) NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[ChainCode] [varchar](10) NULL,
	[City] [varchar](25) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContractDate] [datetime] NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[EffectiveDate] [datetime] NULL,
	[Email] [varchar](80) NULL,
	[Fax] [varchar](50) NULL,
	[FaxAreaCode] [varchar](3) NULL,
	[FedID] [varchar](12) NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[Phone] [varchar](50) NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Source] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo] [varchar](15) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[Zip] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickListSLXB4Update]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickListSLXB4Update](
	[ID] [int] NOT NULL,
	[TEXT] [varchar](64) NULL,
	[SHORTTEXT] [varchar](64) NULL,
	[ITEMID] [char](12) NULL,
	[PICKLISTID] [char](12) NULL,
	[USERID] [char](12) NULL,
	[DEFAULTINDEX] [int] NULL,
	[MODIFYDATE] [datetime] NULL,
	[MODIFYUSER] [char](12) NULL,
	[CREATEDATE] [datetime] NULL,
	[CREATEUSER] [char](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AddressMaster_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressMaster_bkp](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_041013]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_041013](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_041113I]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_041113I](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[Affiliate] [varchar](50) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL,
	[3MRebate] [numeric](18, 2) NULL,
	[POGRebate] [numeric](18, 2) NULL,
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_041113II]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_041113II](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[Affiliate] [varchar](50) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL,
	[3MRebate] [numeric](18, 2) NULL,
	[POGRebate] [numeric](18, 2) NULL,
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_041113III]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_041113III](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[Affiliate] [varchar](50) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL,
	[3MRebate] [numeric](18, 2) NULL,
	[POGRebate] [numeric](18, 2) NULL,
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates041013II]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates041013II](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_AnnualRebatesB42012]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebatesB42012](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Deleted_old]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Deleted_old](
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[AAPEffectiveDate] [nvarchar](255) NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[AAPPreviousGroup] [nvarchar](255) NULL,
	[AAPQuitDate] [nvarchar](255) NULL,
	[UDQuitDate] [datetime] NULL,
	[AAPStatus] [nvarchar](255) NULL,
	[AccountDescription] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[PMParentID] [nvarchar](255) NULL,
	[APIMemberNo] [nvarchar](255) NULL,
	[APIStatus] [nvarchar](255) NULL,
	[AvgWholesaleVolume] [float] NULL,
	[BusinessClass] [nvarchar](255) NULL,
	[CAHStatus] [nvarchar](255) NULL,
	[CardinalDC] [nvarchar](255) NULL,
	[CompetitiveAcct] [float] NULL,
	[ComputerSoftware] [nvarchar](255) NULL,
	[ContractDate] [nvarchar](255) NULL,
	[CorporateName] [nvarchar](255) NULL,
	[CustPayTermsAPI] [nvarchar](255) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [nvarchar](255) NULL,
	[EmergencyPhone] [nvarchar](255) NULL,
	[FedID] [nvarchar](255) NULL,
	[HolidayHours] [nvarchar](255) NULL,
	[Hours] [nvarchar](255) NULL,
	[IsStartUpStore] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[NumReactivated] [float] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Payee_id] [float] NULL,
	[PrimaryCAAccountNo] [nvarchar](255) NULL,
	[QPS] [nvarchar](255) NULL,
	[Resigned] [nvarchar](255) NULL,
	[Territory] [nvarchar](255) NULL,
	[UDAccountNo] [nvarchar](255) NULL,
	[UDNonPharmacy] [nvarchar](255) NULL,
	[UDParentNo] [nvarchar](255) NULL,
	[UDQuitDate1] [datetime] NULL,
	[UDStatus] [nvarchar](255) NULL,
	[Website] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[WholesalerAccountNo] [nvarchar](255) NULL,
	[WhyResigned] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[ContactFullName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[ChainCode] [nvarchar](255) NULL,
	[MCEffectiveDate] [nvarchar](255) NULL,
	[MCQuitDate] [nvarchar](255) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[IsPOS] [nvarchar](255) NULL,
	[IsPVA] [nvarchar](255) NULL,
	[FeePaid] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_managedcare_09282015]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_managedcare_09282015](
	[PK_ManagedCare] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[ChainCode] [int] NULL,
	[ArgusAgree] [smallint] NULL,
	[MCNews_EmailAddress] [varchar](150) NULL,
	[emailMCNews] [smallint] NULL,
	[McQuitReasonInternal] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[ESI] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_memberprograms_012913]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_memberprograms_012913](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_pharmacyNoDupNCPDP]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_pharmacyNoDupNCPDP](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](255) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](255) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](255) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[WHSNUM] [varchar](2) NULL,
	[PlansExcluded] [varchar](255) NULL,
	[IsClaimData] [smallint] NULL,
	[IsUPCData] [smallint] NULL,
	[MedicarePartBNo] [varchar](20) NULL,
	[DoNotFax] [smallint] NULL,
	[CommunicationPreference] [varchar](1) NULL,
	[APIPaymentMode] [varchar](255) NULL,
	[AAPPaymentMode] [varchar](255) NULL,
	[NCPA] [varchar](50) NULL,
	[OptOutNCPA] [smallint] NULL,
	[ReasonNotEligibleNCPA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIMonthly_20171024]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIMonthly_20171024](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Total Whse Sales] [money] NULL,
	[API Whse Gross Rebate] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NULL,
	[Print Rebate Letter] [bit] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Previous Month Held Rebate] [money] NULL,
	[PostAveRebatePerc] [nvarchar](255) NULL,
	[True10Sales] [money] NULL,
	[True10Rebate] [money] NULL,
	[AreteRebateFee] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIMonthly_bkp_10252017]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIMonthly_bkp_10252017](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Total Whse Sales] [money] NULL,
	[API Whse Gross Rebate] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NULL,
	[Print Rebate Letter] [bit] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Previous Month Held Rebate] [money] NULL,
	[PostAveRebatePerc] [nvarchar](255) NULL,
	[True10Sales] [money] NULL,
	[True10Rebate] [money] NULL,
	[AreteRebateFee] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_08282017]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_08282017](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp_022316]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp_022316](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_chaap_BKP_081716]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_chaap_BKP_081716](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_chaap_BKP_0817162]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_chaap_BKP_0817162](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp_082216]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp_082216](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp_08252016]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp_08252016](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp_101316]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp_101316](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_BKP_112315]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_BKP_112315](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_BKP_121415]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_BKP_121415](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp01202017]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp01202017](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp022416]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp022416](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp033017]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp033017](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp06192018]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp06192018](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL,
	[COGRebate] [money] NULL,
	[COGRebate%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_bkp122316]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_bkp122316](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_BU_020116]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_BU_020116](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_chaap_PROD_BKP_0817162]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_chaap_PROD_BKP_0817162](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_RetainedFeesForPatDivOnly]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_RetainedFeesForPatDivOnly](
	[PMID] [numeric](29, 0) NULL,
	[date] [datetime] NULL,
	[date_period_start] [datetime] NULL,
	[date_period_end] [datetime] NULL,
	[rebate_type] [varchar](2) NULL,
	[ExtendedSales] [money] NULL,
	[SourceSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [numeric](19, 4) NULL,
	[Pay to store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[EffectivePct] [float] NULL,
	[HRTA] [float] NULL,
	[AAPVolumeAdminFeeAffiliate] [money] NULL,
	[AAPGenericAdminFeePipco] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_Test_bkp_08162016]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_Test_bkp_08162016](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAP_Test_bkp122316]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAP_Test_bkp122316](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL,
	[AreteEligible] [bit] NULL,
	[AretePerformanceRebate] [money] NULL,
	[TotalRXlessExcludedItems] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_CHAAPBKP011815]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_CHAAPBKP011815](
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL,
	[PrimaryCANo] [varchar](255) NULL,
	[Division] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[ExtendedSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[RxPlusAdminFee] [money] NULL,
	[Affiliate] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[AAPVolumeAdminFeePaidToAffiliate] [money] NULL,
	[BrandRxSales] [money] NULL,
	[SourceGenericSales] [money] NULL,
	[ExcludedGenericSales] [money] NULL,
	[TotalGenericSales] [money] NULL,
	[AAPGenericAdminFee] [money] NULL,
	[AAPGenericAdminFeePaidToPipco] [money] NULL,
	[IPAGenericAdminFee] [money] NULL,
	[ContractPerformanceRebate] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[MSIRebate] [money] NULL,
	[PayToStore] [money] NULL,
	[PayToAffiliateOffice] [money] NULL,
	[TotalToPayOut] [money] NULL,
	[TM] [varchar](255) NULL,
	[PayAccount] [bit] NULL,
	[EffRebatePerc] [float] NULL,
	[HRTA] [float] NULL,
	[SortCode] [varchar](255) NULL,
	[RebateType] [varchar](20) NULL,
	[Check Fee] [money] NULL,
	[A/P Payment Mode] [varchar](255) NULL,
	[PriceProtectionRebate] [money] NULL,
	[AdjustedExtSales] [money] NULL,
	[AdjustedGenericSource] [money] NULL,
	[PriceProtection] [money] NULL,
	[PrescribedWellnessFee] [money] NULL,
	[GenericRebateAdjustment] [money] NULL,
	[PriceProtectionAdjustment] [money] NULL,
	[VolAdminFeeAdj] [money] NULL,
	[AffilAdminFeeAdj] [money] NULL,
	[GenericAdminFeeAdj] [money] NULL,
	[NCPAMembershipFee] [money] NULL,
	[FloridaPhcyAssocDeduct] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pm_rebates_ppartner_052913]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_ppartner_052913](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_bkp022312]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_bkp022312](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_bkpB4ChangeAffiliateAmounts082212]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_bkpB4ChangeAffiliateAmounts082212](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Punctuation]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Punctuation](
	[Symbol] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rebates_CH0210Final]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebates_CH0210Final](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCRebates_0810]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCRebates_0810](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](8) NULL,
	[AAP Quit] [varchar](8) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[PP Rebate 2010Q1] [float] NOT NULL,
	[PP Rebate 2010Q2] [float] NOT NULL,
	[PP Rebate 2010Q3] [numeric](1, 1) NOT NULL,
	[PP Rebate 2010Q4] [numeric](1, 1) NOT NULL,
	[Total PP Rebate 2010] [float] NOT NULL,
	[Q1 API Whse Rebate] [money] NOT NULL,
	[Q1 API Generic Rebate%] [money] NOT NULL,
	[Q2 API Whse Rebate] [money] NOT NULL,
	[Q2 API Generic Rebate%] [money] NOT NULL,
	[Total API Whse Rebate 2010] [money] NOT NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NOT NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NOT NULL,
	[Leader AAP 2010Q3] [numeric](1, 1) NOT NULL,
	[Leader AAP 2010Q4] [numeric](1, 1) NOT NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NOT NULL,
	[2/10 Source Sales ] [money] NOT NULL,
	[2/10 AAP Gen Rebate] [money] NOT NULL,
	[2/10 Avg%] [float] NOT NULL,
	[2/10 HRTA%] [float] NOT NULL,
	[3/10 Source Sales ] [money] NOT NULL,
	[3/10 AAP Gen Rebate] [money] NOT NULL,
	[3/10 Avg%] [float] NOT NULL,
	[3/10 HRTA%] [float] NOT NULL,
	[4/10 Source Sales ] [money] NOT NULL,
	[4/10 AAP Gen Rebate] [money] NOT NULL,
	[4/10 Avg%] [float] NOT NULL,
	[4/10 HRTA%] [float] NOT NULL,
	[5/10 Source Sales ] [money] NOT NULL,
	[5/10 AAP Gen Rebate] [money] NOT NULL,
	[5/10 Avg%] [float] NOT NULL,
	[5/10 HRTA%] [float] NOT NULL,
	[6/10 Source Sales ] [money] NOT NULL,
	[6/10 AAP Gen Rebate] [money] NOT NULL,
	[6/10 Avg%] [float] NOT NULL,
	[6/10 HRTA%] [float] NOT NULL,
	[7/10 Source Sales ] [money] NOT NULL,
	[7/10 AAP Gen Rebate] [money] NOT NULL,
	[7/10 Avg%] [float] NOT NULL,
	[7/10 HRTA%] [float] NOT NULL,
	[8/10 Source Sales ] [money] NOT NULL,
	[8/10 AAP Gen Rebate] [money] NOT NULL,
	[8/10 Avg%] [float] NOT NULL,
	[8/10 HRTA%] [float] NOT NULL,
	[Total CH AAP Gen Rebate 2010] [money] NOT NULL,
	[Total YTD All Rebates] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCRebates_0810_pivotedData]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCRebates_0810_pivotedData](
	[pmid] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[PP Rebate 2010Q3] [numeric](1, 1) NOT NULL,
	[PP Rebate 2010Q4] [numeric](1, 1) NOT NULL,
	[Total PP Rebate 2010] [float] NULL,
	[Q1 API Whse Rebate] [money] NULL,
	[Q1 API Generic Rebate%] [money] NULL,
	[Q2 API Whse Rebate] [money] NULL,
	[Q2 API Generic Rebate%] [money] NULL,
	[Total API Whse Rebate 2010] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
	[Leader AAP 2010Q3] [numeric](1, 1) NOT NULL,
	[Leader AAP 2010Q4] [numeric](1, 1) NOT NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NULL,
	[2/10 Source Sales ] [money] NULL,
	[2/10 AAP Gen Rebate] [money] NULL,
	[2/10 Avg%] [float] NULL,
	[2/10 HRTA%] [float] NULL,
	[3/10 Source Sales ] [money] NULL,
	[3/10 AAP Gen Rebate] [money] NULL,
	[3/10 Avg%] [float] NULL,
	[3/10 HRTA%] [float] NULL,
	[4/10 Source Sales ] [money] NULL,
	[4/10 AAP Gen Rebate] [money] NULL,
	[4/10 Avg%] [float] NULL,
	[4/10 HRTA%] [float] NULL,
	[5/10 Source Sales ] [money] NULL,
	[5/10 AAP Gen Rebate] [money] NULL,
	[5/10 Avg%] [float] NULL,
	[5/10 HRTA%] [float] NULL,
	[6/10 Source Sales ] [money] NULL,
	[6/10 AAP Gen Rebate] [money] NULL,
	[6/10 Avg%] [float] NULL,
	[6/10 HRTA%] [float] NULL,
	[7/10 Source Sales ] [money] NULL,
	[7/10 AAP Gen Rebate] [money] NULL,
	[7/10 Avg%] [float] NULL,
	[7/10 HRTA%] [float] NULL,
	[8/10 Source Sales ] [money] NULL,
	[8/10 AAP Gen Rebate] [money] NULL,
	[8/10 Avg%] [float] NULL,
	[8/10 HRTA%] [float] NULL,
	[Total CH AAP Gen Rebate 2010] [money] NULL,
	[Total YTD All Rebates] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCRebates_0810_QAwithAffiliates]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCRebates_0810_QAwithAffiliates](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](8) NULL,
	[AAP Quit] [varchar](8) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[PP Rebate 2010Q1] [float] NOT NULL,
	[PP Rebate 2010Q2] [float] NOT NULL,
	[PP Rebate 2010Q3] [numeric](1, 1) NOT NULL,
	[PP Rebate 2010Q4] [numeric](1, 1) NOT NULL,
	[Total PP Rebate 2010] [float] NOT NULL,
	[Q1 API Whse Rebate] [money] NOT NULL,
	[Q1 API Generic Rebate%] [money] NOT NULL,
	[Q2 API Whse Rebate] [money] NOT NULL,
	[Q2 API Generic Rebate%] [money] NOT NULL,
	[Total API Whse Rebate 2010] [money] NOT NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NOT NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NOT NULL,
	[Leader AAP 2010Q3] [numeric](1, 1) NOT NULL,
	[Leader AAP 2010Q4] [numeric](1, 1) NOT NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NOT NULL,
	[2/10 Source Sales ] [money] NOT NULL,
	[2/10 AAP Gen Rebate] [money] NOT NULL,
	[2/10 Avg%] [float] NOT NULL,
	[2/10 HRTA%] [float] NOT NULL,
	[3/10 Source Sales ] [money] NOT NULL,
	[3/10 AAP Gen Rebate] [money] NOT NULL,
	[3/10 Avg%] [float] NOT NULL,
	[3/10 HRTA%] [float] NOT NULL,
	[4/10 Source Sales ] [money] NOT NULL,
	[4/10 AAP Gen Rebate] [money] NOT NULL,
	[4/10 Avg%] [float] NOT NULL,
	[4/10 HRTA%] [float] NOT NULL,
	[5/10 Source Sales ] [money] NOT NULL,
	[5/10 AAP Gen Rebate] [money] NOT NULL,
	[5/10 Avg%] [float] NOT NULL,
	[5/10 HRTA%] [float] NOT NULL,
	[6/10 Source Sales ] [money] NOT NULL,
	[6/10 AAP Gen Rebate] [money] NOT NULL,
	[6/10 Avg%] [float] NOT NULL,
	[6/10 HRTA%] [float] NOT NULL,
	[7/10 Source Sales ] [money] NOT NULL,
	[7/10 AAP Gen Rebate] [money] NOT NULL,
	[7/10 Avg%] [float] NOT NULL,
	[7/10 HRTA%] [float] NOT NULL,
	[8/10 Source Sales ] [money] NOT NULL,
	[8/10 AAP Gen Rebate] [money] NOT NULL,
	[8/10 Avg%] [float] NOT NULL,
	[8/10 HRTA%] [float] NOT NULL,
	[Total CH AAP Gen Rebate 2010] [money] NOT NULL,
	[Total YTD All Rebates] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCVolume_0810]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCVolume_0810](
	[TM] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](8) NULL,
	[AAP Quit] [varchar](8) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[Whse Acct Date Opened] [datetime] NULL,
	[Status] [varchar](32) NULL,
	[Wholesaler] [varchar](2) NULL,
	[pmid] [int] NULL,
	[API Sep 09 Brand] [float] NULL,
	[API Sep 09 Generic] [float] NULL,
	[API Sep 09 OTC] [float] NULL,
	[API Sep 09 Total Whse] [float] NULL,
	[API Oct 09 Brand] [float] NULL,
	[API Oct 09 Generic] [float] NULL,
	[API Oct 09 OTC] [float] NULL,
	[API Oct 09 Total Whse] [float] NULL,
	[API Nov 09 Brand] [float] NULL,
	[API Nov 09 Generic] [float] NULL,
	[API Nov 09 OTC] [float] NULL,
	[API Nov 09 Total Whse] [float] NULL,
	[API Dec 09 Brand] [float] NULL,
	[API Dec 09 Generic] [float] NULL,
	[API Dec 09 OTC] [float] NULL,
	[API Dec 09 Total Whse] [float] NULL,
	[API Jan 10 Brand] [float] NULL,
	[API Jan 10 Generic] [float] NULL,
	[API Jan 10 OTC] [float] NULL,
	[API Jan 10 Total Whse] [float] NULL,
	[API Feb 10 Brand] [float] NULL,
	[API Feb 10 Generic] [float] NULL,
	[API Feb 10 OTC] [float] NULL,
	[API Feb 10 Total Whse] [float] NULL,
	[API Mar 10 Brand] [float] NULL,
	[API Mar 10 Generic] [float] NULL,
	[API Mar 10 OTC] [float] NULL,
	[API Mar 10 Total Whse] [float] NULL,
	[API Apr 10 Brand] [float] NULL,
	[API Apr 10 Generic] [float] NULL,
	[API Apr 10 OTC] [float] NULL,
	[API Apr 10 Total Whse] [float] NULL,
	[API May 10 Brand] [float] NULL,
	[API May 10 Generic] [float] NULL,
	[API May 10 OTC] [float] NULL,
	[API May 10 Total Whse] [float] NULL,
	[API Jun 10 Brand] [float] NULL,
	[API Jun 10 Generic] [float] NULL,
	[API Jun 10 OTC] [float] NULL,
	[API Jun 10 Total Whse] [float] NULL,
	[API Jul 10 Brand] [float] NULL,
	[API Jul 10 Generic] [float] NULL,
	[API Jul 10 OTC] [float] NULL,
	[API Jul 10 Total Whse] [float] NULL,
	[API Aug 10 Brand] [float] NULL,
	[API Aug 10 Generic] [float] NULL,
	[API Aug 10 OTC] [float] NULL,
	[API Aug 10 Total Whse] [float] NULL,
	[API Sep 10 Brand] [float] NULL,
	[API Sep 10 Generic] [float] NULL,
	[API Sep 10 OTC] [float] NULL,
	[API Sep 10 Total Whse] [float] NULL,
	[API Total Brand Sales] [float] NULL,
	[API Total Generic Sales] [float] NULL,
	[API Total OTC Sales] [float] NULL,
	[API Total Sales] [float] NULL,
	[CAH Feb AAP Brand] [float] NULL,
	[CAH Feb AAP Src Generics] [float] NULL,
	[CAH Feb AAP Other Sales] [float] NULL,
	[CAH Feb AAP Total Sales] [float] NULL,
	[CAH Mar AAP Brand] [float] NULL,
	[CAH Mar AAP Src Generics] [float] NULL,
	[CAH Mar AAP Other Sales] [float] NULL,
	[CAH Mar AAP Total Sales] [float] NULL,
	[CAH Apr AAP Brand] [float] NULL,
	[CAH Apr AAP Src Generics] [float] NULL,
	[CAH Apr AAP Other Sales] [float] NULL,
	[CAH Apr AAP Total Sales] [float] NULL,
	[CAH May AAP Brand] [float] NULL,
	[CAH May AAP Src Generics] [float] NULL,
	[CAH May AAP Other Sales] [float] NULL,
	[CAH May AAP Total Sales] [float] NULL,
	[CAH Jun AAP Brand] [float] NULL,
	[CAH Jun AAP Src Generics] [float] NULL,
	[CAH Jun AAP Other Sales] [float] NULL,
	[CAH Jun AAP Total Sales] [float] NULL,
	[CAH Jul AAP Brand] [float] NULL,
	[CAH Jul AAP Src Generics] [float] NULL,
	[CAH Jul AAP Other Sales] [float] NULL,
	[CAH Jul AAP Total Sales] [float] NULL,
	[CAH Aug AAP Brand] [float] NULL,
	[CAH Aug AAP Src Generics] [float] NULL,
	[CAH Aug AAP Other Sales] [float] NULL,
	[CAH Aug AAP Total Sales] [float] NULL,
	[CAH Total Brand Sales] [float] NULL,
	[CAH Total Src Generic Sales] [float] NULL,
	[CAH Total Other Sales] [float] NULL,
	[CAH Total Sales] [float] NULL,
	[ML Jan 10 Volume] [float] NULL,
	[ML Feb 10 Volume] [float] NULL,
	[ML Mar 10 Volume] [float] NULL,
	[ML Apr 10 Volume] [float] NULL,
	[ML May 10 Volume] [float] NULL,
	[ML Jun 10 Volume] [float] NULL,
	[ML Jul 10 Volume] [float] NULL,
	[ML Aug 10 Volume] [float] NULL,
	[ML YTD Total Volume] [float] NULL,
	[Total Sep 09 Combined Mthly Sales] [float] NULL,
	[Total Oct 09 Combined Mthly Sales] [float] NULL,
	[Total Nov 09 Combined Mthly Sales] [float] NULL,
	[Total Dec 09 Combined Mthly Sales] [float] NULL,
	[Total Jan 10 Combined Mthly Sales] [float] NULL,
	[Total Feb 10 Combined Mthly Sales] [float] NULL,
	[Total Mar 10 Combined Mthly Sales] [float] NULL,
	[Total Apr 10 Combined Mthly Sales] [float] NULL,
	[Total May 10 Combined Mthly Sales] [float] NULL,
	[Total Jun 10 Combined Mthly Sales] [float] NULL,
	[Total Jul 10 Combined Mthly Sales] [float] NULL,
	[Total Aug 10 Combined Mthly Sales] [float] NULL,
	[Total Sep 10 Combined Mthly Sales] [float] NULL,
	[Total Combined YTD Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCVolume_0810_byTerr]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCVolume_0810_byTerr](
	[TM] [varchar](4) NULL,
	[API Sep 09 Brand] [float] NULL,
	[API Sep 09 Generic] [float] NULL,
	[API Sep 09 OTC] [float] NULL,
	[API Sep 09 Total Whse] [float] NULL,
	[API Oct 09 Brand] [float] NULL,
	[API Oct 09 Generic] [float] NULL,
	[API Oct 09 OTC] [float] NULL,
	[API Oct 09 Total Whse] [float] NULL,
	[API Nov 09 Brand] [float] NULL,
	[API Nov 09 Generic] [float] NULL,
	[API Nov 09 OTC] [float] NULL,
	[API Nov 09 Total Whse] [float] NULL,
	[API Dec 09 Brand] [float] NULL,
	[API Dec 09 Generic] [float] NULL,
	[API Dec 09 OTC] [float] NULL,
	[API Dec 09 Total Whse] [float] NULL,
	[API Jan 10 Brand] [float] NULL,
	[API Jan 10 Generic] [float] NULL,
	[API Jan 10 OTC] [float] NULL,
	[API Jan 10 Total Whse] [float] NULL,
	[API Feb 10 Brand] [float] NULL,
	[API Feb 10 Generic] [float] NULL,
	[API Feb 10 OTC] [float] NULL,
	[API Feb 10 Total Whse] [float] NULL,
	[API Mar 10 Brand] [float] NULL,
	[API Mar 10 Generic] [float] NULL,
	[API Mar 10 OTC] [float] NULL,
	[API Mar 10 Total Whse] [float] NULL,
	[API Apr 10 Brand] [float] NULL,
	[API Apr 10 Generic] [float] NULL,
	[API Apr 10 OTC] [float] NULL,
	[API Apr 10 Total Whse] [float] NULL,
	[API May 10 Brand] [float] NULL,
	[API May 10 Generic] [float] NULL,
	[API May 10 OTC] [float] NULL,
	[API May 10 Total Whse] [float] NULL,
	[API Jun 10 Brand] [float] NULL,
	[API Jun 10 Generic] [float] NULL,
	[API Jun 10 OTC] [float] NULL,
	[API Jun 10 Total Whse] [float] NULL,
	[API Jul 10 Brand] [float] NULL,
	[API Jul 10 Generic] [float] NULL,
	[API Jul 10 OTC] [float] NULL,
	[API Jul 10 Total Whse] [float] NULL,
	[API Aug 10 Brand] [float] NULL,
	[API Aug 10 Generic] [float] NULL,
	[API Aug 10 OTC] [float] NULL,
	[API Aug 10 Total Whse] [float] NULL,
	[API Sep 10 Brand] [float] NULL,
	[API Sep 10 Generic] [float] NULL,
	[API Sep 10 OTC] [float] NULL,
	[API Sep 10 Total Whse] [float] NULL,
	[API Total Brand Sales] [float] NULL,
	[API Total Generic Sales] [float] NULL,
	[API Total OTC Sales] [float] NULL,
	[API Total Sales] [float] NULL,
	[CAH Feb AAP Brand] [float] NULL,
	[CAH Feb AAP Src Generics] [float] NULL,
	[CAH Feb AAP Other Sales] [float] NULL,
	[CAH Feb AAP Total Sales] [float] NULL,
	[CAH Mar AAP Brand] [float] NULL,
	[CAH Mar AAP Src Generics] [float] NULL,
	[CAH Mar AAP Other Sales] [float] NULL,
	[CAH Mar AAP Total Sales] [float] NULL,
	[CAH Apr AAP Brand] [float] NULL,
	[CAH Apr AAP Src Generics] [float] NULL,
	[CAH Apr AAP Other Sales] [float] NULL,
	[CAH Apr AAP Total Sales] [float] NULL,
	[CAH May AAP Brand] [float] NULL,
	[CAH May AAP Src Generics] [float] NULL,
	[CAH May AAP Other Sales] [float] NULL,
	[CAH May AAP Total Sales] [float] NULL,
	[CAH Jun AAP Brand] [float] NULL,
	[CAH Jun AAP Src Generics] [float] NULL,
	[CAH Jun AAP Other Sales] [float] NULL,
	[CAH Jun AAP Total Sales] [float] NULL,
	[CAH Jul AAP Brand] [float] NULL,
	[CAH Jul AAP Src Generics] [float] NULL,
	[CAH Jul AAP Other Sales] [float] NULL,
	[CAH Jul AAP Total Sales] [float] NULL,
	[CAH Aug AAP Brand] [float] NULL,
	[CAH Aug AAP Src Generics] [float] NULL,
	[CAH Aug AAP Other Sales] [float] NULL,
	[CAH Aug AAP Total Sales] [float] NULL,
	[CAH Total Brand Sales] [float] NULL,
	[CAH Total Src Generic Sales] [float] NULL,
	[CAH Total Other Sales] [float] NULL,
	[CAH Total Sales] [float] NULL,
	[ML Jan 10 Volume] [float] NULL,
	[ML Feb 10 Volume] [float] NULL,
	[ML Mar 10 Volume] [float] NULL,
	[ML Apr 10 Volume] [float] NULL,
	[ML May 10 Volume] [float] NULL,
	[ML Jun 10 Volume] [float] NULL,
	[ML Jul 10 Volume] [float] NULL,
	[ML Aug 10 Volume] [float] NULL,
	[ML YTD Total Volume] [float] NULL,
	[Total Sep 09 Combined Mthly Sales] [float] NULL,
	[Total Oct 09 Combined Mthly Sales] [float] NULL,
	[Total Nov 09 Combined Mthly Sales] [float] NULL,
	[Total Dec 09 Combined Mthly Sales] [float] NULL,
	[Total Jan 10 Combined Mthly Sales] [float] NULL,
	[Total Feb 10 Combined Mthly Sales] [float] NULL,
	[Total Mar 10 Combined Mthly Sales] [float] NULL,
	[Total Apr 10 Combined Mthly Sales] [float] NULL,
	[Total May 10 Combined Mthly Sales] [float] NULL,
	[Total Jun 10 Combined Mthly Sales] [float] NULL,
	[Total Jul 10 Combined Mthly Sales] [float] NULL,
	[Total Aug 10 Combined Mthly Sales] [float] NULL,
	[Total Sep 10 Combined Mthly Sales] [float] NULL,
	[Total Combined YTD Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCVolume_0810_data]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCVolume_0810_data](
	[pmid] [int] NULL,
	[colorder] [varchar](15) NULL,
	[col] [varchar](33) NULL,
	[value] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_RCVolume_0810_pivotedData]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_RCVolume_0810_pivotedData](
	[pmid] [int] NULL,
	[API Sep 09 Brand] [float] NULL,
	[API Sep 09 Generic] [float] NULL,
	[API Sep 09 OTC] [float] NULL,
	[API Sep 09 Total Whse] [float] NULL,
	[API Oct 09 Brand] [float] NULL,
	[API Oct 09 Generic] [float] NULL,
	[API Oct 09 OTC] [float] NULL,
	[API Oct 09 Total Whse] [float] NULL,
	[API Nov 09 Brand] [float] NULL,
	[API Nov 09 Generic] [float] NULL,
	[API Nov 09 OTC] [float] NULL,
	[API Nov 09 Total Whse] [float] NULL,
	[API Dec 09 Brand] [float] NULL,
	[API Dec 09 Generic] [float] NULL,
	[API Dec 09 OTC] [float] NULL,
	[API Dec 09 Total Whse] [float] NULL,
	[API Jan 10 Brand] [float] NULL,
	[API Jan 10 Generic] [float] NULL,
	[API Jan 10 OTC] [float] NULL,
	[API Jan 10 Total Whse] [float] NULL,
	[API Feb 10 Brand] [float] NULL,
	[API Feb 10 Generic] [float] NULL,
	[API Feb 10 OTC] [float] NULL,
	[API Feb 10 Total Whse] [float] NULL,
	[API Mar 10 Brand] [float] NULL,
	[API Mar 10 Generic] [float] NULL,
	[API Mar 10 OTC] [float] NULL,
	[API Mar 10 Total Whse] [float] NULL,
	[API Apr 10 Brand] [float] NULL,
	[API Apr 10 Generic] [float] NULL,
	[API Apr 10 OTC] [float] NULL,
	[API Apr 10 Total Whse] [float] NULL,
	[API May 10 Brand] [float] NULL,
	[API May 10 Generic] [float] NULL,
	[API May 10 OTC] [float] NULL,
	[API May 10 Total Whse] [float] NULL,
	[API Jun 10 Brand] [float] NULL,
	[API Jun 10 Generic] [float] NULL,
	[API Jun 10 OTC] [float] NULL,
	[API Jun 10 Total Whse] [float] NULL,
	[API Jul 10 Brand] [float] NULL,
	[API Jul 10 Generic] [float] NULL,
	[API Jul 10 OTC] [float] NULL,
	[API Jul 10 Total Whse] [float] NULL,
	[API Aug 10 Brand] [float] NULL,
	[API Aug 10 Generic] [float] NULL,
	[API Aug 10 OTC] [float] NULL,
	[API Aug 10 Total Whse] [float] NULL,
	[API Sep 10 Brand] [float] NULL,
	[API Sep 10 Generic] [float] NULL,
	[API Sep 10 OTC] [float] NULL,
	[API Sep 10 Total Whse] [float] NULL,
	[API Total Brand Sales] [float] NULL,
	[API Total Generic Sales] [float] NULL,
	[API Total OTC Sales] [float] NULL,
	[API Total Sales] [float] NULL,
	[CAH Feb AAP Brand] [float] NULL,
	[CAH Feb AAP Src Generics] [float] NULL,
	[CAH Feb AAP Other Sales] [float] NULL,
	[CAH Feb AAP Total Sales] [float] NULL,
	[CAH Mar AAP Brand] [float] NULL,
	[CAH Mar AAP Src Generics] [float] NULL,
	[CAH Mar AAP Other Sales] [float] NULL,
	[CAH Mar AAP Total Sales] [float] NULL,
	[CAH Apr AAP Brand] [float] NULL,
	[CAH Apr AAP Src Generics] [float] NULL,
	[CAH Apr AAP Other Sales] [float] NULL,
	[CAH Apr AAP Total Sales] [float] NULL,
	[CAH May AAP Brand] [float] NULL,
	[CAH May AAP Src Generics] [float] NULL,
	[CAH May AAP Other Sales] [float] NULL,
	[CAH May AAP Total Sales] [float] NULL,
	[CAH Jun AAP Brand] [float] NULL,
	[CAH Jun AAP Src Generics] [float] NULL,
	[CAH Jun AAP Other Sales] [float] NULL,
	[CAH Jun AAP Total Sales] [float] NULL,
	[CAH Jul AAP Brand] [float] NULL,
	[CAH Jul AAP Src Generics] [float] NULL,
	[CAH Jul AAP Other Sales] [float] NULL,
	[CAH Jul AAP Total Sales] [float] NULL,
	[CAH Aug AAP Brand] [float] NULL,
	[CAH Aug AAP Src Generics] [float] NULL,
	[CAH Aug AAP Other Sales] [float] NULL,
	[CAH Aug AAP Total Sales] [float] NULL,
	[CAH Total Brand Sales] [float] NULL,
	[CAH Total Src Generic Sales] [float] NULL,
	[CAH Total Other Sales] [float] NULL,
	[CAH Total Sales] [float] NULL,
	[ML Jan 10 Volume] [float] NULL,
	[ML Feb 10 Volume] [float] NULL,
	[ML Mar 10 Volume] [float] NULL,
	[ML Apr 10 Volume] [float] NULL,
	[ML May 10 Volume] [float] NULL,
	[ML Jun 10 Volume] [float] NULL,
	[ML Jul 10 Volume] [float] NULL,
	[ML Aug 10 Volume] [float] NULL,
	[ML YTD Total Volume] [float] NULL,
	[Total Sep 09 Combined Mthly Sales] [float] NULL,
	[Total Oct 09 Combined Mthly Sales] [float] NULL,
	[Total Nov 09 Combined Mthly Sales] [float] NULL,
	[Total Dec 09 Combined Mthly Sales] [float] NULL,
	[Total Jan 10 Combined Mthly Sales] [float] NULL,
	[Total Feb 10 Combined Mthly Sales] [float] NULL,
	[Total Mar 10 Combined Mthly Sales] [float] NULL,
	[Total Apr 10 Combined Mthly Sales] [float] NULL,
	[Total May 10 Combined Mthly Sales] [float] NULL,
	[Total Jun 10 Combined Mthly Sales] [float] NULL,
	[Total Jul 10 Combined Mthly Sales] [float] NULL,
	[Total Aug 10 Combined Mthly Sales] [float] NULL,
	[Total Sep 10 Combined Mthly Sales] [float] NULL,
	[Total Combined YTD Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_votingMembers123110]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_votingMembers123110](
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[stores] [int] NULL,
	[ownername] [varchar](200) NULL,
	[accountname] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[affiliate] [varchar](125) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_YTD_Rebates_through0710_091710]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_YTD_Rebates_through0710_091710](
	[pmid] [float] NULL,
	[PP Volume 2010Q1] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Volume 2010Q2] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[Leader API 2010Q1] [money] NULL,
	[Leader API 2010Q2] [money] NULL,
	[API Program 2010Q1] [money] NULL,
	[API Program 2010Q2] [money] NULL,
	[CH API 2010Q1] [money] NULL,
	[CH API 2010Q2] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
	[2/10 Source Sales ] [money] NULL,
	[2/10 AAP Gen Rebate] [money] NULL,
	[2/10 Avg%] [float] NULL,
	[2/10 HRTA%] [float] NULL,
	[3/10 Source Sales ] [money] NULL,
	[3/10 AAP Gen Rebate] [money] NULL,
	[3/10 Avg%] [float] NULL,
	[3/10 HRTA%] [float] NULL,
	[4/10 Source Sales ] [money] NULL,
	[4/10 AAP Gen Rebate] [money] NULL,
	[4/10 Avg%] [float] NULL,
	[4/10 HRTA%] [float] NULL,
	[5/10 Source Sales ] [money] NULL,
	[5/10 AAP Gen Rebate] [money] NULL,
	[5/10 Avg%] [float] NULL,
	[5/10 HRTA%] [float] NULL,
	[6/10 Source Sales ] [money] NULL,
	[6/10 AAP Gen Rebate] [money] NULL,
	[6/10 Avg%] [float] NULL,
	[6/10 HRTA%] [float] NULL,
	[7/10 Source Sales ] [money] NULL,
	[7/10 AAP Gen Rebate] [money] NULL,
	[7/10 Avg%] [float] NULL,
	[7/10 HRTA%] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_YTD_Rebates_through0710_AffiliatesExcluded]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_YTD_Rebates_through0710_AffiliatesExcluded](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[PP Volume 2010Q1] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Volume 2010Q2] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[Total PP Rebate 2010] [float] NULL,
	[API Whse Rebate Q1] [money] NULL,
	[API Whse Rebate Q2] [money] NULL,
	[Total API Whse Rebate 2010] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NULL,
	[2/10 Source Sales ] [money] NULL,
	[2/10 AAP Gen Rebate] [money] NULL,
	[2/10 Avg%] [float] NULL,
	[2/10 HRTA%] [float] NULL,
	[3/10 Source Sales ] [money] NULL,
	[3/10 AAP Gen Rebate] [money] NULL,
	[3/10 Avg%] [float] NULL,
	[3/10 HRTA%] [float] NULL,
	[4/10 Source Sales ] [money] NULL,
	[4/10 AAP Gen Rebate] [money] NULL,
	[4/10 Avg%] [float] NULL,
	[4/10 HRTA%] [float] NULL,
	[5/10 Source Sales ] [money] NULL,
	[5/10 AAP Gen Rebate] [money] NULL,
	[5/10 Avg%] [float] NULL,
	[5/10 HRTA%] [float] NULL,
	[6/10 Source Sales ] [money] NULL,
	[6/10 AAP Gen Rebate] [money] NULL,
	[6/10 Avg%] [float] NULL,
	[6/10 HRTA%] [float] NULL,
	[7/10 Source Sales ] [money] NULL,
	[7/10 AAP Gen Rebate] [money] NULL,
	[7/10 Avg%] [float] NULL,
	[7/10 HRTA%] [float] NULL,
	[Total CH AAP Gen Rebate 2010] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_YTD_Rebates_through0710_allPayees]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_YTD_Rebates_through0710_allPayees](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[PP Volume 2010Q1] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Volume 2010Q2] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[Total PP Rebate 2010] [float] NULL,
	[API Whse Rebate Q1] [money] NULL,
	[API Whse Rebate Q2] [money] NULL,
	[Total API Whse Rebate 2010] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NULL,
	[2/10 Source Sales ] [money] NULL,
	[2/10 AAP Gen Rebate] [money] NULL,
	[2/10 Avg%] [float] NULL,
	[2/10 HRTA%] [float] NULL,
	[3/10 Source Sales ] [money] NULL,
	[3/10 AAP Gen Rebate] [money] NULL,
	[3/10 Avg%] [float] NULL,
	[3/10 HRTA%] [float] NULL,
	[4/10 Source Sales ] [money] NULL,
	[4/10 AAP Gen Rebate] [money] NULL,
	[4/10 Avg%] [float] NULL,
	[4/10 HRTA%] [float] NULL,
	[5/10 Source Sales ] [money] NULL,
	[5/10 AAP Gen Rebate] [money] NULL,
	[5/10 Avg%] [float] NULL,
	[5/10 HRTA%] [float] NULL,
	[6/10 Source Sales ] [money] NULL,
	[6/10 AAP Gen Rebate] [money] NULL,
	[6/10 Avg%] [float] NULL,
	[6/10 HRTA%] [float] NULL,
	[7/10 Source Sales ] [money] NULL,
	[7/10 AAP Gen Rebate] [money] NULL,
	[7/10 Avg%] [float] NULL,
	[7/10 HRTA%] [float] NULL,
	[Total CH AAP Gen Rebate 2010] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_YTD_Rebates_through0710_data]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_YTD_Rebates_through0710_data](
	[pmid] [float] NULL,
	[PP Volume 2010Q1] [float] NULL,
	[PP Rebate 2010Q1] [float] NULL,
	[PP Volume 2010Q2] [float] NULL,
	[PP Rebate 2010Q2] [float] NULL,
	[Total PP Rebate 2010] [float] NULL,
	[API Whse Rebate Q1] [money] NULL,
	[API Whse Rebate Q2] [money] NULL,
	[Total API Whse Rebate 2010] [money] NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NULL,
	[2/10 Source Sales ] [money] NULL,
	[2/10 AAP Gen Rebate] [money] NULL,
	[2/10 Avg%] [float] NULL,
	[2/10 HRTA%] [float] NULL,
	[3/10 Source Sales ] [money] NULL,
	[3/10 AAP Gen Rebate] [money] NULL,
	[3/10 Avg%] [float] NULL,
	[3/10 HRTA%] [float] NULL,
	[4/10 Source Sales ] [money] NULL,
	[4/10 AAP Gen Rebate] [money] NULL,
	[4/10 Avg%] [float] NULL,
	[4/10 HRTA%] [float] NULL,
	[5/10 Source Sales ] [money] NULL,
	[5/10 AAP Gen Rebate] [money] NULL,
	[5/10 Avg%] [float] NULL,
	[5/10 HRTA%] [float] NULL,
	[6/10 Source Sales ] [money] NULL,
	[6/10 AAP Gen Rebate] [money] NULL,
	[6/10 Avg%] [float] NULL,
	[6/10 HRTA%] [float] NULL,
	[7/10 Source Sales ] [money] NULL,
	[7/10 AAP Gen Rebate] [money] NULL,
	[7/10 Avg%] [float] NULL,
	[7/10 HRTA%] [float] NULL,
	[Total CH AAP Gen Rebate 2010] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_YTD_Rebates_through0810]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_YTD_Rebates_through0810](
	[TM] [varchar](4) NULL,
	[pmid] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[AAP Eff] [varchar](8) NULL,
	[AAP Quit] [varchar](8) NULL,
	[Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[St] [varchar](2) NULL,
	[Contact] [varchar](255) NULL,
	[MC Network] [int] NULL,
	[PP Rebate 2010Q1] [float] NOT NULL,
	[PP Rebate 2010Q2] [float] NOT NULL,
	[PP Rebate 2010Q3] [numeric](1, 1) NOT NULL,
	[PP Rebate 2010Q4] [numeric](1, 1) NOT NULL,
	[Total PP Rebate 2010] [float] NOT NULL,
	[Q1 API Whse Rebate] [money] NOT NULL,
	[Q1 API Generic Rebate%] [money] NOT NULL,
	[Q2 API Whse Rebate] [money] NOT NULL,
	[Q2 API Generic Rebate%] [money] NOT NULL,
	[Total API Whse Rebate 2010] [money] NOT NULL,
	[Leader AAP 2010Q1] [numeric](19, 4) NOT NULL,
	[Leader AAP 2010Q2] [numeric](19, 4) NOT NULL,
	[Leader AAP 2010Q3] [numeric](1, 1) NOT NULL,
	[Leader AAP 2010Q4] [numeric](1, 1) NOT NULL,
	[Total Leader AAP 2010] [numeric](38, 4) NOT NULL,
	[2/10 Source Sales ] [money] NOT NULL,
	[2/10 AAP Gen Rebate] [money] NOT NULL,
	[2/10 Avg%] [float] NOT NULL,
	[2/10 HRTA%] [float] NOT NULL,
	[3/10 Source Sales ] [money] NOT NULL,
	[3/10 AAP Gen Rebate] [money] NOT NULL,
	[3/10 Avg%] [float] NOT NULL,
	[3/10 HRTA%] [float] NOT NULL,
	[4/10 Source Sales ] [money] NOT NULL,
	[4/10 AAP Gen Rebate] [money] NOT NULL,
	[4/10 Avg%] [float] NOT NULL,
	[4/10 HRTA%] [float] NOT NULL,
	[5/10 Source Sales ] [money] NOT NULL,
	[5/10 AAP Gen Rebate] [money] NOT NULL,
	[5/10 Avg%] [float] NOT NULL,
	[5/10 HRTA%] [float] NOT NULL,
	[6/10 Source Sales ] [money] NOT NULL,
	[6/10 AAP Gen Rebate] [money] NOT NULL,
	[6/10 Avg%] [float] NOT NULL,
	[6/10 HRTA%] [float] NOT NULL,
	[7/10 Source Sales ] [money] NOT NULL,
	[7/10 AAP Gen Rebate] [money] NOT NULL,
	[7/10 Avg%] [float] NOT NULL,
	[7/10 HRTA%] [float] NOT NULL,
	[8/10 Source Sales ] [money] NOT NULL,
	[8/10 AAP Gen Rebate] [money] NOT NULL,
	[8/10 Avg%] [float] NOT NULL,
	[8/10 HRTA%] [float] NOT NULL,
	[Total CH AAP Gen Rebate 2010] [money] NOT NULL,
	[Total YTD All Rebates] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rlgl_tmp_dates]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rlgl_tmp_dates](
	[ncpdp] [nvarchar](50) NULL,
	[min_rx_date] [datetime] NULL,
	[max_rx_date] [datetime] NULL,
	[claim_count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_CHPHAAPNDC]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_CHPHAAPNDC](
	[NDC] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_CHPHAAPNDC_3mo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_CHPHAAPNDC_3mo](
	[NDC] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_data12mo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_data12mo](
	[NCPDP] [nvarchar](50) NULL,
	[PMID] [int] NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[NDC] [nvarchar](50) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[CHMaxUnit] [numeric](38, 4) NULL,
	[APIMaxPriceUnit] [numeric](38, 4) NULL,
	[APIMaxNetUnit] [numeric](38, 6) NULL,
	[CHRebatePerc] [float] NULL,
	[CHNetUnit] [float] NULL,
	[MinUnitList] [numeric](38, 4) NULL,
	[MinUnitNet] [float] NULL,
	[NDCFound] [varchar](1) NOT NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[LossList] [numeric](38, 3) NULL,
	[NoLossNet] [float] NULL,
	[LossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_data3mo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_data3mo](
	[NCPDP] [nvarchar](50) NULL,
	[PMID] [int] NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[NDC] [nvarchar](50) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[CHMaxUnit] [numeric](38, 4) NULL,
	[APIMaxPriceUnit] [numeric](38, 4) NULL,
	[APIMaxNetUnit] [numeric](38, 6) NULL,
	[CHRebatePerc] [float] NULL,
	[CHNetUnit] [float] NULL,
	[MinUnitList] [numeric](38, 4) NULL,
	[MinUnitNet] [float] NULL,
	[NDCFound] [varchar](1) NOT NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[LossList] [numeric](38, 3) NULL,
	[NoLossNet] [float] NULL,
	[LossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_price1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_price1](
	[NDC] [nvarchar](50) NULL,
	[yr] [int] NULL,
	[mo] [int] NULL,
	[CHMaxUnit] [numeric](38, 4) NULL,
	[APIMaxPriceUnit] [numeric](38, 4) NULL,
	[APIMaxNetUnit] [numeric](38, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_summaryNCPDP12mo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_summaryNCPDP12mo](
	[NCPDP] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_summaryNCPDP3mo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_summaryNCPDP3mo](
	[#ClaimsAll] [int] NULL,
	[$ClaimsAllTotalPaid] [numeric](38, 3) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_summaryNCPDP3mo_AAPBoard]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_summaryNCPDP3mo_AAPBoard](
	[pmid] [int] NULL,
	[description] [varchar](119) NULL,
	[#ClaimsAll] [int] NULL,
	[$ClaimsAllTotalPaid] [numeric](38, 3) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_summaryNCPDP3mo_allclaims]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_summaryNCPDP3mo_allclaims](
	[#ClaimsAll] [int] NULL,
	[$ClaimsAllTotalPaid] [numeric](38, 3) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_summaryNDC3mo]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_summaryNDC3mo](
	[NDC] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp_test]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_test](
	[#ClaimsAll] [int] NULL,
	[NCPDP] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RLGLtemp3]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp3](
	[NCPDP] [nvarchar](50) NULL,
	[PMID] [int] NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[NDC] [nvarchar](50) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[CHRebatePerc] [float] NULL,
	[NDCFound] [varchar](1) NOT NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[LossList] [numeric](38, 3) NULL,
	[NoLossNet] [float] NULL,
	[LossNet] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T](
	[IntCol] [int] NULL,
	[XmlCol] [xml] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tablelist]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablelist](
	[DB] [sysname] NOT NULL,
	[Table] [sysname] NOT NULL,
	[object_id] [int] NOT NULL,
	[schema_id] [int] NOT NULL,
	[database_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempIT]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempIT](
	[Account Code] [nvarchar](50) NULL,
	[Account Name] [nvarchar](255) NULL,
	[SL Account No ] [nvarchar](50) NULL,
	[API Acct No] [nvarchar](50) NULL,
	[AAP Acct No] [nvarchar](50) NULL,
	[PMID] [nvarchar](50) NULL,
	[Street 1] [nvarchar](255) NULL,
	[Street 2] [nvarchar](50) NULL,
	[City] [nvarchar](150) NULL,
	[State Province] [nvarchar](150) NULL,
	[Zip PostCode] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
	[Primary Address] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test1]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test1](
	[db] [varchar](255) NOT NULL,
	[name] [sysname] NOT NULL,
	[object_id] [int] NOT NULL,
	[principal_id] [int] NULL,
	[schema_id] [int] NOT NULL,
	[parent_object_id] [int] NOT NULL,
	[type] [varchar](255) NOT NULL,
	[type_desc] [nvarchar](255) NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NOT NULL,
	[is_ms_shipped] [bit] NOT NULL,
	[is_published] [bit] NOT NULL,
	[is_schema_published] [bit] NOT NULL,
	[lob_data_space_id] [int] NULL,
	[filestream_data_space_id] [int] NULL,
	[max_column_id_used] [int] NOT NULL,
	[lock_on_bulk_load] [bit] NOT NULL,
	[uses_ansi_nulls] [bit] NULL,
	[is_replicated] [bit] NULL,
	[has_replication_filter] [bit] NULL,
	[is_merge_published] [bit] NULL,
	[is_sync_tran_subscribed] [bit] NULL,
	[has_unchecked_assembly_data] [bit] NOT NULL,
	[text_in_row_limit] [int] NULL,
	[large_value_types_out_of_row] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp__GR0610_Sales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp__GR0610_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[group] [nvarchar](255) NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[TotalRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[Mailed to address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[Contact] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_aap_grp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_aap_grp](
	[pmid] [int] NOT NULL,
	[GroupName] [varchar](50) NULL,
	[aapid] [bigint] NULL,
	[PMGroupNo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0210]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0210](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[CA#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[Division] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 035% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0210_pmid]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0210_pmid](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[CA#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[Division] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 035% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0310]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0310](
	[CA#] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[Division] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0310_pmid]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0310_pmid](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[pmid_match] [int] NULL,
	[CA#] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[Division] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0410]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0410](
	[AcctNo] [float] NULL,
	[Customer] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[DCCity] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[Metrics] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdmin0410_pmid]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdmin0410_pmid](
	[pmid] [int] NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[pmid_match] [int] NULL,
	[AcctNo] [float] NULL,
	[Customer] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[DCCity] [nvarchar](255) NULL,
	[Store] [nvarchar](255) NULL,
	[Metrics] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPAdminJanFeb10]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPAdminJanFeb10](
	[Acctno] [nvarchar](255) NULL,
	[Customer] [nvarchar](255) NULL,
	[DC] [float] NULL,
	[DCCity] [nvarchar](255) NULL,
	[Metrics] [nvarchar](255) NULL,
	[CCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[CCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[Total Generics] [money] NULL,
	[Brand Rx Sales] [money] NULL,
	[Extended Sales] [money] NULL,
	[AAP 0#35% Volume Admin Fee $] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPVOl]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPVOl](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Jan 10 Sales AAP PVA] [float] NULL,
	[Jan 10 Sales API PVA] [float] NULL,
	[Jan 10 Sales UD PVA] [float] NULL,
	[Jan 10 Sales CH Total] [float] NULL,
	[Jan 10 Sales ML] [float] NULL,
	[Jan 10 Sales Total] [float] NULL,
	[Feb 10 Sales AAP PVA] [float] NULL,
	[Feb 10 Sales API PVA] [float] NULL,
	[Feb 10 Sales UD PVA] [float] NULL,
	[Feb 10 Sales CH Total] [float] NULL,
	[Feb 10 Sales ML] [float] NULL,
	[Feb 10 Sales Total] [float] NULL,
	[Mar 10 Sales AAP PVA] [float] NULL,
	[Mar 10 Sales API PVA] [float] NULL,
	[Mar 10 Sales UD PVA] [float] NULL,
	[Mar 10 Sales  CH Total] [float] NULL,
	[Mar 10 Sales ML] [float] NULL,
	[Mar 10 Sales Total] [float] NULL,
	[Apr 10 Sales AAP PVA] [float] NULL,
	[Apr 10 Sales API PVA] [float] NULL,
	[Apr 10 Sales UD PVA] [float] NULL,
	[Apr 10 Sales  CH Total] [float] NULL,
	[Apr 10 Sales ML] [float] NULL,
	[Apr 10 Sales Total] [float] NULL,
	[May 10 Sales AAP PVA] [float] NULL,
	[May 10 Sales API PVA] [float] NULL,
	[May 10 Sales UD PVA] [float] NULL,
	[May 10 Sales  CH Total] [float] NULL,
	[May 10 Sales ML] [float] NULL,
	[May 10 Sales Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_aapvol_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_aapvol_bkp](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Jan 10 Sales AAP PVA] [float] NULL,
	[Jan 10 Sales API PVA] [float] NULL,
	[Jan 10 Sales UD PVA] [float] NULL,
	[Jan 10 Sales CH Total] [float] NULL,
	[Jan 10 Sales ML] [float] NULL,
	[Jan 10 Sales Total] [float] NULL,
	[Feb 10 Sales AAP PVA] [float] NULL,
	[Feb 10 Sales API PVA] [float] NULL,
	[Feb 10 Sales UD PVA] [float] NULL,
	[Feb 10 Sales CH Total] [float] NULL,
	[Feb 10 Sales ML] [float] NULL,
	[Feb 10 Sales Total] [float] NULL,
	[Mar 10 Sales AAP PVA] [float] NULL,
	[Mar 10 Sales API PVA] [float] NULL,
	[Mar 10 Sales UD PVA] [float] NULL,
	[Mar 10 Sales  CH Total] [float] NULL,
	[Mar 10 Sales ML] [float] NULL,
	[Mar 10 Sales Total] [float] NULL,
	[Apr 10 Sales AAP PVA] [float] NULL,
	[Apr 10 Sales API PVA] [float] NULL,
	[Apr 10 Sales UD PVA] [float] NULL,
	[Apr 10 Sales  CH Total] [float] NULL,
	[Apr 10 Sales ML] [float] NULL,
	[Apr 10 Sales Total] [float] NULL,
	[May 10 Sales AAP PVA] [float] NULL,
	[May 10 Sales API PVA] [float] NULL,
	[May 10 Sales UD PVA] [float] NULL,
	[May 10 Sales  CH Total] [float] NULL,
	[May 10 Sales ML] [float] NULL,
	[May 10 Sales Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPVOl2]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPVOl2](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Resigned Date] [datetime] NULL,
	[Jan 10 AAP] [float] NULL,
	[Jan 10 API] [float] NULL,
	[Jan 10 UD] [float] NULL,
	[Jan 10 CH Total] [float] NULL,
	[Jan 10 ML] [float] NULL,
	[Jan 10 Total] [float] NULL,
	[Feb 10 AAP] [float] NULL,
	[Feb 10 API] [float] NULL,
	[Feb 10 UD] [float] NULL,
	[Feb 10 CH Total] [float] NULL,
	[Feb 10 ML] [float] NULL,
	[Feb 10 Total] [float] NULL,
	[Mar 10 AAP] [float] NULL,
	[Mar 10 API] [float] NULL,
	[Mar 10 UD] [float] NULL,
	[Mar 10 CH Total] [float] NULL,
	[Mar 10 ML] [float] NULL,
	[Mar 10 Total] [float] NULL,
	[Apr 10 AAP] [float] NULL,
	[Apr 10 API] [float] NULL,
	[Apr 10 UD] [float] NULL,
	[Apr 10 CH Total] [float] NULL,
	[Apr 10 ML] [float] NULL,
	[Apr 10 Total] [float] NULL,
	[May 10 AAP] [float] NULL,
	[May 10 API] [float] NULL,
	[May 10 UD] [float] NULL,
	[May 10 CH Total] [float] NULL,
	[May 10 ML] [float] NULL,
	[May 10 Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPVOl3]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPVOl3](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Resigned Date] [datetime] NULL,
	[Jan 10 AAP] [float] NULL,
	[Jan 10 API] [float] NULL,
	[Jan 10 UD] [float] NULL,
	[Jan 10 CH Total] [float] NULL,
	[Jan 10 ML] [float] NULL,
	[Jan 10 Total] [float] NULL,
	[Feb 10 AAP] [float] NULL,
	[Feb 10 API] [float] NULL,
	[Feb 10 UD] [float] NULL,
	[Feb 10 CH Total] [float] NULL,
	[Feb 10 ML] [float] NULL,
	[Feb 10 Total] [float] NULL,
	[Mar 10 AAP] [float] NULL,
	[Mar 10 API] [float] NULL,
	[Mar 10 UD] [float] NULL,
	[Mar 10 CH Total] [float] NULL,
	[Mar 10 ML] [float] NULL,
	[Mar 10 Total] [float] NULL,
	[Apr 10 AAP] [float] NULL,
	[Apr 10 API] [float] NULL,
	[Apr 10 UD] [float] NULL,
	[Apr 10 CH Total] [float] NULL,
	[Apr 10 ML] [float] NULL,
	[Apr 10 Total] [float] NULL,
	[May 10 AAP] [float] NULL,
	[May 10 API] [float] NULL,
	[May 10 UD] [float] NULL,
	[May 10 CH Total] [float] NULL,
	[May 10 ML] [float] NULL,
	[May 10 Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_AAPVOl4]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AAPVOl4](
	[pmid] [int] NOT NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[Affiliate Group] [varchar](125) NULL,
	[Pharmacy Name] [varchar](65) NULL,
	[Effective Date] [datetime] NULL,
	[Resigned Date] [datetime] NULL,
	[Jan 10 AAP] [float] NULL,
	[Jan 10 API] [float] NULL,
	[Jan 10 UD] [float] NULL,
	[Jan 10 CH Total] [float] NULL,
	[Jan 10 ML] [float] NULL,
	[Jan 10 Total] [float] NULL,
	[Feb 10 AAP] [float] NULL,
	[Feb 10 API] [float] NULL,
	[Feb 10 UD] [float] NULL,
	[Feb 10 CH Total] [float] NULL,
	[Feb 10 ML] [float] NULL,
	[Feb 10 Total] [float] NULL,
	[Mar 10 AAP] [float] NULL,
	[Mar 10 API] [float] NULL,
	[Mar 10 UD] [float] NULL,
	[Mar 10 CH Total] [float] NULL,
	[Mar 10 ML] [float] NULL,
	[Mar 10 Total] [float] NULL,
	[Apr 10 AAP] [float] NULL,
	[Apr 10 API] [float] NULL,
	[Apr 10 UD] [float] NULL,
	[Apr 10 CH Total] [float] NULL,
	[Apr 10 ML] [float] NULL,
	[Apr 10 Total] [float] NULL,
	[May 10 AAP] [float] NULL,
	[May 10 API] [float] NULL,
	[May 10 UD] [float] NULL,
	[May 10 CH Total] [float] NULL,
	[May 10 ML] [float] NULL,
	[May 10 Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Account]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Account](
	[SL Account No] [char](12) NOT NULL,
	[Account Name] [varchar](128) NULL,
	[PMID] [varchar](256) NULL,
	[Account Code] [varchar](256) NULL,
	[Phone] [varchar](256) NULL,
	[Phone2] [varchar](256) NULL,
	[Fax] [varchar](256) NULL,
	[Website] [varchar](128) NULL,
	[Sales Person] [varchar](64) NULL,
	[Type] [varchar](64) NULL,
	[Sub Type] [varchar](64) NULL,
	[Status] [varchar](64) NULL,
	[Business Description] [varchar](2000) NULL,
	[Description] [varchar](64) NULL,
	[Primary Address] [varchar](64) NULL,
	[Street 1] [varchar](64) NULL,
	[City] [varchar](32) NULL,
	[State] [varchar](32) NULL,
	[Zip] [varchar](24) NULL,
	[Country] [varchar](64) NULL,
	[Corporate Name] [varchar](80) NULL,
	[Sales Territory] [varchar](32) NULL,
	[Last Sales Call] [datetime] NULL,
	[Avg Comb Vol] [varchar](20) NULL,
	[DEA] [varchar](15) NULL,
	[MC Network] [varchar](32) NULL,
	[Featured Program Compliance Guardian] [varchar](1) NULL,
	[AAP Account No] [varchar](32) NULL,
	[API Account Number] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Account_Command]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Account_Command](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Command] [varchar](1500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Account_Test]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Account_Test](
	[SL Account No] [char](12) NOT NULL,
	[Account Name] [varchar](128) NULL,
	[PMID] [varchar](256) NULL,
	[Phone] [varchar](32) NULL,
	[Phone2] [varchar](32) NULL,
	[Fax] [varchar](32) NULL,
	[Website] [varchar](128) NULL,
	[Sales Person] [varchar](256) NULL,
	[Type] [varchar](64) NULL,
	[Sub Type] [varchar](64) NULL,
	[Status] [varchar](64) NULL,
	[Business Description] [varchar](2000) NULL,
	[Description] [varchar](64) NULL,
	[Primary Address] [varchar](64) NULL,
	[Street 1] [varchar](64) NULL,
	[City] [varchar](32) NULL,
	[State] [varchar](32) NULL,
	[Zip] [varchar](24) NULL,
	[Country] [varchar](64) NULL,
	[Corporate Name] [varchar](80) NULL,
	[Sales Territory] [varchar](32) NULL,
	[Last Sales Call] [datetime] NULL,
	[Avg Comb Vol] [varchar](20) NULL,
	[DEA] [varchar](15) NULL,
	[MC Network] [varchar](256) NULL,
	[Featured Program Compliance Guardian] [varchar](1) NULL,
	[AAP Account No] [varchar](32) NULL,
	[API Account Number] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_acct_forPhil]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_acct_forPhil](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CategoryID] [int] NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](80) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[EstMonthlyVol] [numeric](18, 2) NULL,
	[FedID] [varchar](12) NULL,
	[GroupNo] [varchar](20) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[IsHighVolume] [tinyint] NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](80) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NULL,
	[MembershipType] [int] NULL,
	[OrganizationType] [int] NULL,
	[AuthorizedVoter] [nvarchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_all_volume_testBKP_071812]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_volume_testBKP_071812](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_all_volume052516]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_volume052516](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSales] [float] NULL,
	[AAPBrand] [float] NULL,
	[AAPGENTotal] [float] NULL,
	[AAPGENTotalSrc] [float] NULL,
	[AAPGENExcl] [float] NULL,
	[AAPOTC] [float] NULL,
	[AAPOther] [float] NULL,
	[AAPTotalRX] [money] NULL,
	[AAPExcludedFromTotalRX] [money] NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[WHAPIBrand] [float] NULL,
	[WHAPIBrandUnits] [int] NULL,
	[WHAPIGeneric] [float] NULL,
	[WHAPIGenericUnits] [int] NULL,
	[WHAPIOTC] [float] NULL,
	[WHAPIOTCUnits] [int] NULL,
	[WHAPITotal] [float] NULL,
	[MLTotal] [float] NULL,
	[AndaTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_API_Financials062310]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_Financials062310](
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Addr1] [varchar](255) NULL,
	[Addr2] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_APISLX_NF]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_APISLX_NF](
	[APIAccountNo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_blabla]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_blabla](
	[Account Code (Contact.BusinessAccount.AccountCode)] [nvarchar](255) NULL,
	[Account Name (Contact.BusinessAccount.AccountName)] [varchar](128) NULL,
	[Title (Contact.Contact0100)] [varchar](64) NULL,
	[Salutation (Contact.SalutationId)] [varchar](256) NULL,
	[First Name (Contact.FirstName)] [varchar](256) NULL,
	[Last Name (Contact.LastName)] [varchar](256) NULL,
	[Primary Contact (Contact.Primary)] [varchar](5) NOT NULL,
	[Description (Contact.Address.Description)] [varchar](64) NULL,
	[Primary Address (Contact.Address.DefaultAddress)] [varchar](5) NOT NULL,
	[Street 1 (Contact.Address.Street1)] [varchar](64) NULL,
	[Street 2 (Contact.Address.Street2)] [varchar](64) NULL,
	[City (Contact.Address.City)] [varchar](32) NULL,
	[State/Province (Contact.Address.StateProvinceId)] [varchar](32) NULL,
	[Country (Contact.Address.CountryId)] [varchar](256) NULL,
	[Zip/PostCode (Contact.Address.Zip)] [varchar](24) NULL,
	[Phone Number (Contact.BusinessPhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.Business2PhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.FaxPhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.HomePhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Phone Number (Contact.MobilePhoneTypeNav.PhoneNumber)] [varchar](256) NULL,
	[Email Address (Contact.Contact0103)] [varchar](128) NULL,
	[Rank] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Brand0101111]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Brand0101111](
	[NDC] [varchar](15) NULL,
	[Description] [varchar](127) NULL,
	[Strength] [varchar](127) NULL,
	[Size] [varchar](50) NULL,
	[Qty Purchased] [numeric](38, 0) NULL,
	[Cost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_C0513CH]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_C0513CH](
	[PMID] [float] NULL,
	[TM#] [float] NULL,
	[AAP#] [float] NULL,
	[API#] [float] NULL,
	[StartDate] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[JanSales] [float] NULL,
	[JanUDSales] [float] NULL,
	[JanTotalPVASales] [float] NULL,
	[FebAPIContract] [float] NULL,
	[FebAAPContract] [float] NULL,
	[FebUDContract] [float] NULL,
	[FebTotalPVASales] [float] NULL,
	[MarAPIContract] [float] NULL,
	[MarAAPContract] [float] NULL,
	[MARUDContract] [float] NULL,
	[MarTotalPVASales] [float] NULL,
	[TotalSales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_C0513ML]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_C0513ML](
	[PMID] [float] NULL,
	[TM#] [float] NULL,
	[AAP#] [float] NULL,
	[API#] [float] NULL,
	[StartDate] [datetime] NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[JanSalesML] [float] NULL,
	[FebSalesML] [float] NULL,
	[MarSalesML] [float] NULL,
	[F12] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CF]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CF](
	[ACCOUNTID] [char](12) NOT NULL,
	[TYPE] [varchar](64) NULL,
	[ACCOUNT] [varchar](128) NULL,
	[DIVISION] [varchar](64) NULL,
	[SICCODE] [varchar](64) NULL,
	[PARENTID] [char](12) NULL,
	[DESCRIPTION] [varchar](128) NULL,
	[ADDRESSID] [char](12) NULL,
	[SHIPPINGID] [char](12) NULL,
	[REGION] [varchar](64) NULL,
	[MAINPHONE] [varchar](32) NULL,
	[ALTERNATEPHONE] [varchar](32) NULL,
	[FAX] [varchar](32) NULL,
	[TOLLFREE] [varchar](32) NULL,
	[TOLLFREE2] [varchar](32) NULL,
	[OTHERPHONE1] [varchar](32) NULL,
	[OTHERPHONE2] [varchar](32) NULL,
	[OTHERPHONE3] [varchar](32) NULL,
	[EMAIL] [varchar](128) NULL,
	[EMAILTYPE] [varchar](64) NULL,
	[WEBADDRESS] [varchar](128) NULL,
	[SECCODEID] [char](12) NOT NULL,
	[REVENUE] [decimal](17, 4) NULL,
	[EMPLOYEES] [int] NULL,
	[INDUSTRY] [varchar](64) NULL,
	[CREDITRATING] [varchar](10) NULL,
	[NOTES] [text] NULL,
	[STATUS] [varchar](64) NULL,
	[ACCOUNTMANAGERID] [char](12) NULL,
	[REGIONALMANAGERID] [char](12) NULL,
	[DIVISIONALMANAGERID] [char](12) NULL,
	[NATIONALACCOUNT] [char](1) NULL,
	[TARGETACCOUNT] [char](1) NULL,
	[TERRITORY] [varchar](64) NULL,
	[CREATEUSER] [char](12) NULL,
	[MODIFYUSER] [char](12) NULL,
	[CREATEDATE] [datetime] NULL,
	[MODIFYDATE] [datetime] NULL,
	[ACCOUNT_UC] [varchar](128) NULL,
	[AKA] [varchar](64) NULL,
	[CURRENCYCODE] [varchar](64) NULL,
	[INTERNALACCOUNTNO] [varchar](32) NULL,
	[EXTERNALACCOUNTNO] [varchar](32) NULL,
	[PARENTACCOUNTNO] [varchar](32) NULL,
	[ALTERNATEKEYPREFIX] [varchar](8) NULL,
	[ALTERNATEKEYSUFFIX] [varchar](24) NULL,
	[DEFAULTTICKETSECCODEID] [char](12) NULL,
	[NOTIFYDEFECTS] [char](1) NULL,
	[NOTIFYONCLOSE] [char](1) NULL,
	[NOTIFYONSTATUS] [char](1) NULL,
	[SHORTNOTES] [varchar](255) NULL,
	[USERFIELD1] [varchar](80) NULL,
	[USERFIELD2] [varchar](80) NULL,
	[USERFIELD3] [varchar](80) NULL,
	[USERFIELD4] [varchar](80) NULL,
	[USERFIELD5] [varchar](80) NULL,
	[USERFIELD6] [varchar](80) NULL,
	[USERFIELD7] [varchar](80) NULL,
	[USERFIELD8] [varchar](80) NULL,
	[USERFIELD9] [varchar](80) NULL,
	[USERFIELD10] [varchar](80) NULL,
	[CAMPAIGNID] [char](12) NULL,
	[DONOTSOLICIT] [char](1) NULL,
	[SCORE] [varchar](32) NULL,
	[TICKER] [varchar](16) NULL,
	[SUBTYPE] [varchar](64) NULL,
	[LEADSOURCEID] [char](12) NULL,
	[IMPORTSOURCE] [varchar](24) NULL,
	[ENGINEERID] [char](12) NULL,
	[SALESENGINEERID] [char](12) NULL,
	[RELATIONSHIP] [int] NULL,
	[LASTHISTORYBY] [char](12) NULL,
	[LASTHISTORYDATE] [datetime] NULL,
	[BUSINESSDESCRIPTION] [varchar](2000) NULL,
	[WEBADDRESS2] [varchar](128) NULL,
	[WEBADDRESS3] [varchar](128) NULL,
	[WEBADDRESS4] [varchar](128) NULL,
	[GLOBALSYNCID] [varchar](36) NULL,
	[APPID] [varchar](12) NULL,
	[TICK] [int] NULL,
	[LASTERPSYNCUPDATE] [datetime] NULL,
	[PRIMARYOPERATINGCOMPID] [varchar](12) NULL,
	[PROMOTEDTOACCOUNTING] [varchar](1) NULL,
	[CREATESOURCE] [varchar](64) NULL,
	[ACCOUNTID_OLD] [char](12) NULL,
	[ENTITYID] [char](12) NULL,
	[contactid] [char](12) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CHR0210]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHR0210](
	[PMID] [int] NULL,
	[AAPID] [int] NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[API#] [nvarchar](255) NULL,
	[Account Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[SumOfExtended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[Affiliate Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Generic Admin Fee -PIPCO only] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[Total to Pay Out] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_commercialAlerts_out]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_commercialAlerts_out](
	[id] [varchar](100) NULL,
	[type] [varchar](10) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL,
	[directory] [varchar](100) NULL,
	[category] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CompareNonMC_orig]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CompareNonMC_orig](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[pmid] [int] NOT NULL,
	[aapaccountno] [varchar](20) NULL,
	[accountname] [varchar](65) NULL,
	[aapeffectivedate] [datetime] NULL,
	[aapquitdate] [datetime] NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contactfullname] [varchar](255) NULL,
	[ncpdp] [varchar](20) NULL,
	[fedid] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Conf_Clint]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Conf_Clint](
	[Account] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[AAPID] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[PVA Avg] [float] NULL,
	[Avg WHS Vol] [float] NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[Conference2010] [nvarchar](255) NULL,
	[Conference2011] [nvarchar](255) NULL,
	[Conference2012] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_confAttendees]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_confAttendees](
	[CompanyName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[PMID] [numeric](18, 0) NULL,
	[IsPipco] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_confAttPipco]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_confAttPipco](
	[PMID] [int] NOT NULL,
	[Company Name] [varchar](255) NULL,
	[AAP Acct#] [varchar](255) NULL,
	[API Acct#] [varchar](255) NULL,
	[IsPipco] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_config_ca]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_config_ca](
	[id] [varchar](100) NULL,
	[directory] [varchar](100) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_config_commercialAlerts]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_config_commercialAlerts](
	[id] [varchar](100) NULL,
	[type] [varchar](10) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL,
	[directory] [varchar](100) NULL,
	[category] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_config_medicareAlerts]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_config_medicareAlerts](
	[id] [varchar](100) NULL,
	[type] [varchar](10) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL,
	[directory] [varchar](100) NULL,
	[category] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_cs]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_cs](
	[PMID] [int] NULL,
	[AAP#] [varchar](20) NULL,
	[AAPParent#] [varchar](20) NULL,
	[Territory] [varchar](4) NULL,
	[Acct#] [varchar](32) NOT NULL,
	[Status] [varchar](32) NULL,
	[Name] [varchar](65) NULL,
	[ST] [varchar](2) NULL,
	[Date Opened] [datetime] NULL,
	[July BR] [numeric](18, 2) NULL,
	[July GEN] [numeric](18, 2) NULL,
	[July OTC] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CS_Grandfather]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CS_Grandfather](
	[PMID #] [int] NOT NULL,
	[TM #] [varchar](4) NULL,
	[AAP #] [varchar](20) NULL,
	[AAP Parent #] [varchar](20) NULL,
	[API #] [varchar](20) NULL,
	[Store dba Name] [varchar](65) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Account Description] [varchar](200) NULL,
	[Affiliate] [varchar](125) NULL,
	[PVA March 2010] [float] NULL,
	[PVA April 2010] [float] NULL,
	[PVA May 2010] [float] NULL,
	[PVA June 2010] [float] NULL,
	[PVA July 2010] [float] NULL,
	[PVA August 2010] [float] NULL,
	[API March 2010] [numeric](38, 2) NULL,
	[API April 2010] [numeric](38, 2) NULL,
	[API May 2010] [numeric](38, 2) NULL,
	[API June 2010] [numeric](38, 2) NULL,
	[API July 2010] [numeric](38, 2) NULL,
	[API August 2010] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_DEASLX_NF]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_DEASLX_NF](
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_allpmid]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_allpmid](
	[pmid] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_GFUpdateList]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_GFUpdateList](
	[PMID] [float] NULL,
	[AAP#] [float] NULL,
	[Parent] [float] NULL,
	[Account DBA Name] [nvarchar](255) NULL,
	[AAP Quit] [datetime] NULL,
	[Change Account Description To:] [nvarchar](255) NULL,
	[Why Quit] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_pivot]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_pivot](
	[pmid] [int] NULL,
	[1/10 AAPBrand] [float] NULL,
	[1/10 CHAAPSource] [float] NULL,
	[1/10 CHAAPTotal] [float] NULL,
	[1/10 CHAllBrand] [float] NULL,
	[1/10 CHAllSource] [float] NULL,
	[1/10 CHAllTotal] [float] NULL,
	[2/10 AAPBrand] [float] NULL,
	[2/10 CHAAPSource] [float] NULL,
	[2/10 CHAAPTotal] [float] NULL,
	[2/10 CHAllBrand] [float] NULL,
	[2/10 CHAllSource] [float] NULL,
	[2/10 CHAllTotal] [float] NULL,
	[3/10 AAPBrand] [float] NULL,
	[3/10 CHAAPSource] [float] NULL,
	[3/10 CHAAPTotal] [float] NULL,
	[3/10 CHAllBrand] [float] NULL,
	[3/10 CHAllSource] [float] NULL,
	[3/10 CHAllTotal] [float] NULL,
	[4/10 AAPBrand] [float] NULL,
	[4/10 CHAAPSource] [float] NULL,
	[4/10 CHAAPTotal] [float] NULL,
	[4/10 CHAllBrand] [float] NULL,
	[4/10 CHAllSource] [float] NULL,
	[4/10 CHAllTotal] [float] NULL,
	[5/10 AAPBrand] [float] NULL,
	[5/10 CHAAPSource] [float] NULL,
	[5/10 CHAAPTotal] [float] NULL,
	[5/10 CHAllBrand] [float] NULL,
	[5/10 CHAllSource] [float] NULL,
	[5/10 CHAllTotal] [float] NULL,
	[6/10 AAPBrand] [float] NULL,
	[6/10 CHAAPSource] [float] NULL,
	[6/10 CHAAPTotal] [float] NULL,
	[6/10 CHAllBrand] [float] NULL,
	[6/10 CHAllSource] [float] NULL,
	[6/10 CHAllTotal] [float] NULL,
	[7/10 AAPBrand] [float] NULL,
	[7/10 CHAAPSource] [float] NULL,
	[7/10 CHAAPTotal] [float] NULL,
	[7/10 CHAllBrand] [float] NULL,
	[7/10 CHAllSource] [float] NULL,
	[7/10 CHAllTotal] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_pivottest]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_pivottest](
	[pmid] [int] NULL,
	[col] [varchar](60) NULL,
	[value] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_PMPharmacy_011111]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_PMPharmacy_011111](
	[PMID] [int] IDENTITY(100000,1) NOT NULL,
	[PMParentID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPParentNo] [varchar](20) NULL,
	[AAPPreviousGroup] [varchar](50) NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPStatus] [varchar](32) NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](65) NULL,
	[AllowDupDEA] [varchar](1) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIDEA] [varchar](50) NULL,
	[APIMemberNo] [varchar](30) NULL,
	[APIPMID] [int] NULL,
	[APIStatus] [varchar](32) NULL,
	[AvgWholesaleVolume] [bigint] NULL,
	[BusinessClass] [varchar](4) NULL,
	[CAHStatus] [varchar](32) NULL,
	[CardinalDC] [varchar](32) NULL,
	[CompetitiveAcct] [smallint] NULL,
	[ComputerSoftware] [varchar](100) NULL,
	[ContractDate] [datetime] NULL,
	[CorporateName] [varchar](100) NULL,
	[CustPayTermsAPI] [varchar](20) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [varchar](100) NULL,
	[DEA] [varchar](50) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [varchar](80) NULL,
	[EmergencyPhone] [varchar](15) NULL,
	[FedID] [varchar](12) NULL,
	[HolidayHours] [varchar](100) NULL,
	[Hours] [varchar](100) NULL,
	[StoreHours_HolidayAM] [varchar](5) NULL,
	[StoreHours_HolidayPM] [varchar](5) NULL,
	[StoreHours_MondayFridayAM] [varchar](5) NULL,
	[StoreHours_MondayFridayPM] [varchar](5) NULL,
	[StoreHours_SaturdayAM] [varchar](5) NULL,
	[StoreHours_SaturdayPM] [varchar](5) NULL,
	[StoreHours_SundayAM] [varchar](5) NULL,
	[StoreHours_SundayPM] [varchar](5) NULL,
	[IsStartUpStore] [smallint] NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[NumReactivated] [int] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [varchar](200) NULL,
	[Payee_id] [int] NULL,
	[PrimaryCAAccountNo] [varchar](32) NULL,
	[PrimaryWholesaler] [int] NULL,
	[QPS] [varchar](4) NULL,
	[Rank] [bigint] NULL,
	[Resigned] [varchar](1) NULL,
	[Source] [varchar](25) NULL,
	[Status] [varchar](32) NULL,
	[Territory] [varchar](4) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[UDNonPharmacy] [varchar](2) NULL,
	[UDParentNo] [varchar](25) NULL,
	[UDQuitDate] [datetime] NULL,
	[UDStatus] [varchar](32) NULL,
	[Website] [varchar](100) NULL,
	[Wholesaler] [varchar](25) NULL,
	[WholesalerAccountNo] [varchar](32) NULL,
	[WhyResigned] [varchar](255) NULL,
	[IsBuyingGroup] [smallint] NULL,
	[IsPos] [smallint] NULL,
	[IsPva] [smallint] NULL,
	[FeePaid] [smallint] NULL,
	[IsManagedCare] [smallint] NULL,
	[IsWarehouse] [smallint] NULL,
	[IsNPP] [smallint] NULL,
	[ACHEmail] [varchar](80) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009](
	[pmid] [int] NULL,
	[vendor] [varchar](64) NULL,
	[col] [varchar](12) NULL,
	[volume] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009_byQtr]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009_byQtr](
	[UDxref] [varchar](20) NULL,
	[vendor] [varchar](64) NULL,
	[col] [varchar](11) NULL,
	[volume] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009_report]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009_report](
	[vendor] [varchar](64) NULL,
	[01/09 Count] [numeric](38, 2) NULL,
	[01/09 Rebate] [numeric](38, 2) NULL,
	[01/09 Volume] [numeric](38, 2) NULL,
	[02/09 Count] [numeric](38, 2) NULL,
	[02/09 Rebate] [numeric](38, 2) NULL,
	[02/09 Volume] [numeric](38, 2) NULL,
	[03/09 Count] [numeric](38, 2) NULL,
	[03/09 Rebate] [numeric](38, 2) NULL,
	[03/09 Volume] [numeric](38, 2) NULL,
	[04/09 Count] [numeric](38, 2) NULL,
	[04/09 Rebate] [numeric](38, 2) NULL,
	[04/09 Volume] [numeric](38, 2) NULL,
	[05/09 Count] [numeric](38, 2) NULL,
	[05/09 Rebate] [numeric](38, 2) NULL,
	[05/09 Volume] [numeric](38, 2) NULL,
	[06/09 Count] [numeric](38, 2) NULL,
	[06/09 Rebate] [numeric](38, 2) NULL,
	[06/09 Volume] [numeric](38, 2) NULL,
	[07/09 Count] [numeric](38, 2) NULL,
	[07/09 Rebate] [numeric](38, 2) NULL,
	[07/09 Volume] [numeric](38, 2) NULL,
	[08/09 Count] [numeric](38, 2) NULL,
	[08/09 Rebate] [numeric](38, 2) NULL,
	[08/09 Volume] [numeric](38, 2) NULL,
	[09/09 Count] [numeric](38, 2) NULL,
	[09/09 Rebate] [numeric](38, 2) NULL,
	[09/09 Volume] [numeric](38, 2) NULL,
	[10/09 Count] [numeric](38, 2) NULL,
	[10/09 Rebate] [numeric](38, 2) NULL,
	[10/09 Volume] [numeric](38, 2) NULL,
	[11/09 Count] [numeric](38, 2) NULL,
	[11/09 Rebate] [numeric](38, 2) NULL,
	[11/09 Volume] [numeric](38, 2) NULL,
	[12/09 Count] [numeric](38, 2) NULL,
	[12/09 Rebate] [numeric](38, 2) NULL,
	[12/09 Volume] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009_rollup]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009_rollup](
	[vendor] [varchar](64) NULL,
	[col] [varchar](12) NULL,
	[amount] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete2]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete2](
	[PMID] [numeric](29, 0) NULL,
	[date] [varchar](9) NOT NULL,
	[date_period_start] [varchar](9) NOT NULL,
	[date_period_end] [varchar](9) NOT NULL,
	[rebate_type] [varchar](2) NOT NULL,
	[ExtendedSales] [money] NULL,
	[SourceSales] [money] NULL,
	[AAPVolumeAdminFee] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [int] NULL,
	[Pay to store] [money] NULL,
	[Pay to Affiliate Office] [money] NULL,
	[EffectivePct] [float] NULL,
	[HRTA] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_deleteAfter082911_PM_REBATES_PPARTNER]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_deleteAfter082911_PM_REBATES_PPARTNER](
	[Period] [varchar](50) NULL,
	[PMID] [float] NULL,
	[VolumeAmt] [float] NULL,
	[RebateAmt] [float] NULL,
	[PaymentAmt] [float] NULL,
	[Eligible] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[LastPayment] [nvarchar](255) NULL,
	[Paid To Store] [float] NULL,
	[Paid To Affiliate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_deleteme]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_deleteme](
	[date] [datetime] NULL,
	[rebate_type] [varchar](31) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAP#] [nvarchar](255) NULL,
	[API acct] [nvarchar](255) NULL,
	[Customer Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Bs Class] [nvarchar](255) NULL,
	[Month] [nvarchar](255) NULL,
	[Current Est Mo Sales] [money] NULL,
	[Mo API Volume] [money] NULL,
	[CAH off Contract-LTC Volume] [money] NULL,
	[AAP Net Sales] [money] NULL,
	[Mo Comb Volume] [money] NULL,
	[AAP Sales- COG Applied] [money] NULL,
	[AAP Brand RX Sales] [money] NULL,
	[Current CA COG] [float] NULL,
	[Base] [float] NULL,
	[Brand RX@WAC] [money] NULL,
	[Brand RX Saved] [money] NULL,
	[High Volume Incentive] [money] NULL,
	[Total Saved] [money] NULL,
	[ECOG] [float] NULL,
	[COG Reduction] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_FileFromPhil]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_FileFromPhil](
	[Whse_Inv_ID] [varchar](50) NULL,
	[VendorID] [varchar](50) NULL,
	[UD_ACCT_NUM] [varchar](50) NULL,
	[INVOICE_NUM] [varchar](50) NULL,
	[INVOICE_DT] [varchar](50) NULL,
	[INVOICE_TYPE] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[SHIP QTY] [varchar](50) NULL,
	[UNIT_COST_AMT] [varchar](50) NULL,
	[WAC] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_FullNameSplit]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_FullNameSplit](
	[FullName] [varchar](200) NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GlobalReport_volume_0710rev092010]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GlobalReport_volume_0710rev092010](
	[pmid] [int] NULL,
	[date] [datetime] NULL,
	[month] [varchar](7) NULL,
	[Gen Src] [float] NULL,
	[Gen Exc] [float] NULL,
	[Gen Total] [float] NULL,
	[CH Br] [float] NULL,
	[CH Oth] [float] NULL,
	[UD Adm] [float] NULL,
	[CH Total] [float] NULL,
	[API_BR] [numeric](38, 2) NULL,
	[API_GEN] [numeric](38, 2) NULL,
	[API_OTC] [numeric](38, 2) NULL,
	[API_Total] [numeric](38, 2) NULL,
	[ML_Total] [numeric](14, 2) NULL,
	[Anda_Total] [numeric](38, 2) NULL,
	[All_Total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0610_mailmerge]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0610_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0610_mailmerge_keystone]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0610_mailmerge_keystone](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0610_ptJournal]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0610_ptJournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0610_ptVendors]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0610_ptVendors](
	[Vendor ID] [nvarchar](255) NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit to Address – Line 1] [varchar](100) NULL,
	[Remit to Address – Line 2] [varchar](100) NULL,
	[Remit to City] [varchar](50) NULL,
	[Remit to State] [varchar](2) NULL,
	[Remit to Zip] [varchar](50) NULL,
	[Payment Address Type] [varchar](10) NOT NULL,
	[1099 Type] [int] NOT NULL,
	[Telephone 1] [varchar](50) NULL,
	[Fax Number] [varchar](50) NULL,
	[Vendor E-mail] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0610_Sales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0610_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[group] [nvarchar](255) NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[TotalRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[Mailed to address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[Contact] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0710_mailmerge]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0710_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0710_mailmerge_keystone]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0710_mailmerge_keystone](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0710_ptJournal]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0710_ptJournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0710_ptVendors]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0710_ptVendors](
	[Vendor ID] [nvarchar](255) NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit to Address – Line 1] [varchar](100) NULL,
	[Remit to Address – Line 2] [varchar](100) NULL,
	[Remit to City] [varchar](50) NULL,
	[Remit to State] [varchar](2) NULL,
	[Remit to Zip] [varchar](50) NULL,
	[Payment Address Type] [varchar](10) NOT NULL,
	[1099 Type] [int] NOT NULL,
	[Telephone 1] [varchar](50) NULL,
	[Fax Number] [varchar](50) NULL,
	[Vendor E-mail] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0710_Sales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0710_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[group] [nvarchar](255) NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [money] NULL,
	[TotalRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[Mailed to address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[Contact] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0810_mailmerge]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0810_mailmerge](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](11) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0810_mailmerge_keystone]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0810_mailmerge_keystone](
	[Vendor ID] [nvarchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[Account Name] [varchar](65) NULL,
	[Corporate Name] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[month] [varchar](9) NOT NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0810_ptJournal]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0810_ptJournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0810_ptVendors]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0810_ptVendors](
	[Vendor ID] [nvarchar](255) NULL,
	[Store Name] [varchar](65) NULL,
	[Contact] [varchar](255) NULL,
	[Store Address – Line 1] [varchar](100) NULL,
	[Store Address – Line 2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Corporate Name] [varchar](100) NULL,
	[Remit to Address – Line 1] [varchar](100) NULL,
	[Remit to Address – Line 2] [varchar](100) NULL,
	[Remit to City] [varchar](50) NULL,
	[Remit to State] [varchar](2) NULL,
	[Remit to Zip] [varchar](50) NULL,
	[Payment Address Type] [varchar](10) NOT NULL,
	[1099 Type] [int] NOT NULL,
	[Telephone 1] [varchar](50) NULL,
	[Fax Number] [varchar](50) NULL,
	[Vendor E-mail] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[Tax ID Number] [varchar](12) NULL,
	[Territory] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_GR0810_Sales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0810_Sales](
	[PMID] [nvarchar](255) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent #] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[Account Name] [varchar](65) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[territory] [varchar](4) NULL,
	[affiliate] [varchar](125) NULL,
	[group] [nvarchar](255) NULL,
	[SourceSales] [money] NULL,
	[GenericRebate] [money] NULL,
	[LeaderRebate] [numeric](1, 1) NOT NULL,
	[PaidToStore] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[Mailed to address] [varchar](100) NULL,
	[f_address2] [varchar](100) NULL,
	[f_city] [varchar](50) NULL,
	[f_state] [varchar](2) NULL,
	[f_zip] [varchar](50) NULL,
	[Contact] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_groupMapping_R]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_groupMapping_R](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[APIGroupName] [varchar](125) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPGroupName] [varchar](50) NULL,
	[AAPID] [bigint] NULL,
	[affiliation] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_import_QPSRx30_090110]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_import_QPSRx30_090110](
	[PMID] [float] NULL,
	[Pharm ID] [float] NULL,
	[Store Name] [nvarchar](255) NULL,
	[Total Sales] [float] NULL,
	[ClaimsCount] [float] NULL,
	[Total Paid] [float] NULL,
	[TotalSales-TotalPaid] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_InSLX_HayesDir]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_InSLX_HayesDir](
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[storenum] [varchar](255) NULL,
	[Account] [varchar](128) NULL,
	[City_SLX] [varchar](32) NULL,
	[State_SLX] [varchar](32) NULL,
	[MainPhone] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_ja]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ja](
	[ACCT_NO] [varchar](5) NULL,
	[dea] [varchar](50) NULL,
	[pmid] [int] NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_LeaderRebate0310_MM]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_LeaderRebate0310_MM](
	[pmid] [numeric](29, 0) NULL,
	[account name] [nvarchar](255) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NOT NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contact] [varchar](255) NULL,
	[month] [varchar](8) NOT NULL,
	[aapid] [varchar](20) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MapAPIGroupToPMGroup]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MapAPIGroupToPMGroup](
	[buscls] [varchar](50) NULL,
	[PMGroupNo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MapUDGroupToPMGroup]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MapUDGroupToPMGroup](
	[UDGroup] [varchar](50) NULL,
	[PMGroupNo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_match_CAAccount]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_match_CAAccount](
	[Contract] [varchar](15) NULL,
	[DivisionName] [varchar](255) NULL,
	[Division] [float] NULL,
	[CAAccountNo] [float] NULL,
	[AccountName] [varchar](255) NULL,
	[Address1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[BuyPlanPerc] [float] NULL,
	[AR2000TermsCode] [varchar](255) NULL,
	[AR2000TermsCodeDesc] [varchar](255) NULL,
	[ContractGroupNo] [float] NULL,
	[ActualWAPD90Days] [float] NULL,
	[MMPDSO90Days] [float] NULL,
	[ContractGroupEffDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MCQuitdateButNoEffectiveDate]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCQuitdateButNoEffectiveDate](
	[NCPDP] [varchar](7) NULL,
	[PAYEE_ID] [int] NULL,
	[Total_Paid_In90Days] [float] NULL,
	[LAST_PAID] [datetime] NULL,
	[CHECK_NAME] [varchar](50) NULL,
	[ACTIVE_PAYEE] [int] NULL,
	[PMID] [int] NULL,
	[MCare] [int] NULL,
	[NPP] [varchar](3) NOT NULL,
	[AAP] [varchar](30) NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[TM] [varchar](2) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_medicareAlerts_out]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_medicareAlerts_out](
	[id] [varchar](100) NULL,
	[type] [varchar](10) NULL,
	[file] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[date] [varchar](20) NULL,
	[directory] [varchar](100) NULL,
	[category] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NoCHFebSales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NoCHFebSales](
	[aap#] [varchar](255) NULL,
	[febtotalpvasales] [numeric](18, 2) NULL,
	[Total] [float] NULL,
	[cardinalno] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NoCHJanSales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NoCHJanSales](
	[aap#] [varchar](255) NULL,
	[jantotalpvasales] [numeric](18, 2) NULL,
	[Total] [float] NULL,
	[cardinalno] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NoCHMarSales]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NoCHMarSales](
	[aap#] [varchar](255) NULL,
	[martotalpvasales] [numeric](18, 2) NULL,
	[Total] [float] NULL,
	[cardinalno] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_added]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_added](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_changed]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_changed](
	[TableName] [varchar](18) NULL,
	[NDUPS] [int] NULL,
	[PMID] [int] NOT NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[NCPDP] [varchar](20) NULL,
	[FedID] [varchar](12) NULL,
	[CorporateName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NonMC_changes]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NonMC_changes](
	[AccountName] [varchar](100) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[NCPDP] [varchar](100) NULL,
	[ColumnNameChanged] [varchar](100) NULL,
	[ChangedFrom] [varchar](100) NULL,
	[ChangedTo] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_NotesMapping]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_NotesMapping](
	[SLX] [varchar](255) NULL,
	[Aplicor] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PeachTree_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PeachTree_bkp](
	[pmid] [int] NOT NULL,
	[Corpname] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[1099Type] [varchar](1) NOT NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NOT NULL,
	[FedID] [varchar](12) NULL,
	[1099Setting] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_phil_qa]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_phil_qa](
	[Whse_Inv_ID] [varchar](50) NULL,
	[VendorID] [varchar](50) NULL,
	[UD_ACCT_NUM] [varchar](50) NULL,
	[INVOICE_NUM] [varchar](50) NULL,
	[INVOICE_DT] [varchar](50) NULL,
	[INVOICE_TYPE] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[SHIP QTY] [varchar](50) NULL,
	[UNIT_COST_AMT] [varchar](50) NULL,
	[WAC] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PickListSLXNEW]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PickListSLXNEW](
	[ID] [int] NOT NULL,
	[TEXT] [varchar](64) NULL,
	[SHORTTEXT] [varchar](64) NULL,
	[ITEMID] [char](12) NULL,
	[PICKLISTID] [char](12) NULL,
	[USERID] [char](12) NULL,
	[DEFAULTINDEX] [int] NULL,
	[MODIFYDATE] [datetime] NULL,
	[MODIFYUSER] [char](12) NULL,
	[CREATEDATE] [datetime] NULL,
	[CREATEUSER] [char](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PlannedDeletions]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PlannedDeletions](
	[PMID] [float] NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[AAPEffectiveDate] [nvarchar](255) NULL,
	[AAPParentNo] [nvarchar](255) NULL,
	[AAPPreviousGroup] [nvarchar](255) NULL,
	[AAPQuitDate] [nvarchar](255) NULL,
	[UDQuitDate] [datetime] NULL,
	[AAPStatus] [nvarchar](255) NULL,
	[AccountDescription] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[PMParentID] [nvarchar](255) NULL,
	[APIMemberNo] [nvarchar](255) NULL,
	[APIStatus] [nvarchar](255) NULL,
	[AvgWholesaleVolume] [float] NULL,
	[BusinessClass] [nvarchar](255) NULL,
	[CAHStatus] [nvarchar](255) NULL,
	[CardinalDC] [nvarchar](255) NULL,
	[CompetitiveAcct] [float] NULL,
	[ComputerSoftware] [nvarchar](255) NULL,
	[ContractDate] [nvarchar](255) NULL,
	[CorporateName] [nvarchar](255) NULL,
	[CustPayTermsAPI] [nvarchar](255) NULL,
	[DateOpened] [datetime] NULL,
	[DBA] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[DEAEXP] [datetime] NULL,
	[Email] [nvarchar](255) NULL,
	[EmergencyPhone] [nvarchar](255) NULL,
	[FedID] [nvarchar](255) NULL,
	[HolidayHours] [nvarchar](255) NULL,
	[Hours] [nvarchar](255) NULL,
	[IsStartUpStore] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[NumReactivated] [float] NULL,
	[OrigStartDate] [datetime] NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Payee_id] [float] NULL,
	[PrimaryCAAccountNo] [nvarchar](255) NULL,
	[QPS] [nvarchar](255) NULL,
	[Resigned] [nvarchar](255) NULL,
	[Territory] [nvarchar](255) NULL,
	[UDAccountNo] [nvarchar](255) NULL,
	[UDNonPharmacy] [nvarchar](255) NULL,
	[UDParentNo] [nvarchar](255) NULL,
	[UDQuitDate1] [datetime] NULL,
	[UDStatus] [nvarchar](255) NULL,
	[Website] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[WholesalerAccountNo] [nvarchar](255) NULL,
	[WhyResigned] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[ContactFullName] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[ChainCode] [nvarchar](255) NULL,
	[MCEffectiveDate] [nvarchar](255) NULL,
	[MCQuitDate] [nvarchar](255) NULL,
	[StateLicExpDate] [datetime] NULL,
	[StateLicNo] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[IsPOS] [nvarchar](255) NULL,
	[IsPVA] [nvarchar](255) NULL,
	[FeePaid] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_pm_memberprograms]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_memberprograms](
	[PMID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[Comment] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
	[AAP] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_pm_peachtree2]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_pm_peachtree2](
	[contact] [varchar](255) NULL,
	[pmid] [int] NULL,
	[Corpname] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[1099Type] [varchar](1) NULL,
	[phone] [varchar](50) NULL,
	[fax] [varchar](50) NULL,
	[email] [varchar](80) NULL,
	[GLExpenseAccount] [varchar](7) NULL,
	[FedID] [varchar](12) NULL,
	[1099Setting] [varchar](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_PMLoadCS]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PMLoadCS](
	[PMID] [numeric](18, 0) NULL,
	[OrganizationTypeDesc] [varchar](255) NULL,
	[Org_ID] [numeric](18, 0) NULL,
	[IndAuthToVote] [varchar](255) NULL,
	[MembershipTypeDesc] [varchar](255) NULL,
	[Mem_ID] [numeric](18, 0) NULL,
	[StoreContactName] [varchar](255) NULL,
	[MembershipOwner] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_PVA]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_PVA](
	[PMID] [varchar](255) NULL,
	[TM#] [varchar](255) NULL,
	[AAP#] [varchar](255) NULL,
	[API#] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[JanSales] [numeric](18, 2) NULL,
	[JanUDSales] [numeric](18, 2) NULL,
	[JanTotalPVASales] [numeric](18, 2) NULL,
	[FebAPIContract] [numeric](18, 2) NULL,
	[FebAAPContract] [numeric](18, 2) NULL,
	[FebUDContract] [numeric](18, 2) NULL,
	[FebTotalPVASales] [numeric](18, 2) NULL,
	[MarAPIContract] [numeric](18, 2) NULL,
	[MarAAPContract] [numeric](18, 2) NULL,
	[MARUDContract] [numeric](18, 2) NULL,
	[MarTotalPVASales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_PVA_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_PVA_bkp](
	[PMID] [varchar](255) NULL,
	[TM#] [varchar](255) NULL,
	[AAP#] [varchar](255) NULL,
	[API#] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[JanSales] [numeric](18, 2) NULL,
	[JanUDSales] [numeric](18, 2) NULL,
	[JanTotalPVASales] [numeric](18, 2) NULL,
	[FebAPIContract] [numeric](18, 2) NULL,
	[FebAAPContract] [numeric](18, 2) NULL,
	[FebUDContract] [numeric](18, 2) NULL,
	[FebTotalPVASales] [numeric](18, 2) NULL,
	[MarAPIContract] [numeric](18, 2) NULL,
	[MarAAPContract] [numeric](18, 2) NULL,
	[MARUDContract] [numeric](18, 2) NULL,
	[MarTotalPVASales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_PVA_ML]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_PVA_ML](
	[PMID] [varchar](255) NULL,
	[TM#] [varchar](255) NULL,
	[AAP#] [varchar](255) NULL,
	[API#] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[JanSales] [numeric](18, 2) NULL,
	[JanUDSales] [numeric](18, 2) NULL,
	[JanTotalPVASales] [numeric](18, 2) NULL,
	[FebAPIContract] [numeric](18, 2) NULL,
	[FebAAPContract] [numeric](18, 2) NULL,
	[FebUDContract] [numeric](18, 2) NULL,
	[FebTotalPVASales] [numeric](18, 2) NULL,
	[MarAPIContract] [numeric](18, 2) NULL,
	[MarAAPContract] [numeric](18, 2) NULL,
	[MARUDContract] [numeric](18, 2) NULL,
	[MarTotalPVASales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_PVA_ML_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_PVA_ML_bkp](
	[PMID] [varchar](255) NULL,
	[TM#] [varchar](255) NULL,
	[AAP#] [varchar](255) NULL,
	[API#] [varchar](255) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[JanSales] [numeric](18, 2) NULL,
	[JanUDSales] [numeric](18, 2) NULL,
	[JanTotalPVASales] [numeric](18, 2) NULL,
	[FebAPIContract] [numeric](18, 2) NULL,
	[FebAAPContract] [numeric](18, 2) NULL,
	[FebUDContract] [numeric](18, 2) NULL,
	[FebTotalPVASales] [numeric](18, 2) NULL,
	[MarAPIContract] [numeric](18, 2) NULL,
	[MarAAPContract] [numeric](18, 2) NULL,
	[MARUDContract] [numeric](18, 2) NULL,
	[MarTotalPVASales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD](
	[PMID] [int] NULL,
	[TM#] [varchar](4) NULL,
	[UD#] [varchar](5) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[January 10 Sales] [numeric](38, 2) NULL,
	[February 10 Sales] [numeric](38, 2) NULL,
	[March 10 Sales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD_ML]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD_ML](
	[PMID] [int] NULL,
	[TM#] [varchar](4) NULL,
	[UD#] [varchar](5) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[JanSales] [numeric](38, 2) NULL,
	[FebSales] [numeric](38, 2) NULL,
	[MarSales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD_ML_Only]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD_ML_Only](
	[PMID] [int] NULL,
	[TM#] [varchar](4) NULL,
	[UD#] [varchar](5) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[January 10 Sales] [numeric](38, 2) NULL,
	[February 10 Sales] [numeric](38, 2) NULL,
	[March 10 Sales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD_RollUp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD_RollUp](
	[pmid] [int] NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[TotJanSales] [numeric](38, 2) NULL,
	[TotFebSales] [numeric](38, 2) NULL,
	[TotMarSales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_10_UD_RollUp_ML]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_10_UD_RollUp_ML](
	[pmid] [int] NULL,
	[TM#] [varchar](4) NULL,
	[AAP#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[PhcyName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[ST] [varchar](2) NULL,
	[TotJanSales] [numeric](38, 2) NULL,
	[TotFebSales] [numeric](38, 2) NULL,
	[TotMarSales] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_Avg_Rollup]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_Avg_Rollup](
	[PMID] [varchar](255) NULL,
	[Q1AvgSales] [numeric](24, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_Avg_Rollup_bkp]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_Avg_Rollup_bkp](
	[PMID] [varchar](255) NULL,
	[Q1AvgSales] [numeric](24, 6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q2_ALLPVA_ML]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q2_ALLPVA_ML](
	[pmid] [int] NULL,
	[TM#] [varchar](10) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[ST] [varchar](2) NULL,
	[AprAPIContract] [float] NULL,
	[AprAAPContract] [float] NULL,
	[AprUDContract] [float] NULL,
	[AprTotalPVASales] [float] NULL,
	[MayAPIContract] [float] NULL,
	[MayAAPContract] [float] NULL,
	[MayUDContract] [float] NULL,
	[MayTotalPVASales] [float] NULL,
	[JunAPIContract] [float] NULL,
	[JunAAPContract] [float] NULL,
	[JunUDContract] [float] NULL,
	[JunTotalPVASales] [float] NULL,
	[TotalCHPVA] [float] NULL,
	[AprSalesML] [float] NULL,
	[MaySalesML] [float] NULL,
	[JunSalesML] [float] NULL,
	[TotalML] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q2_ALLPVA_ML_DYN]    Script Date: 12/22/2020 3:50:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q2_ALLPVA_ML_DYN](
	[pmid] [int] NULL,
	[TM#] [varchar](10) NULL,
	[AAP#] [varchar](20) NULL,
	[Parent#] [varchar](20) NULL,
	[API#] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[Name] [varchar](200) NULL,
	[City] [varchar](200) NULL,
	[ST] [varchar](2) NULL,
	[M1APIContract] [float] NULL,
	[M1AAPContract] [float] NULL,
	[M1UDContract] [float] NULL,
	[M1TotalPVASales] [float] NULL,
	[M2APIContract] [float] NULL,
	[M2AAPContract] [float] NULL,
	[M2UDContract] [float] NULL,
	[M2TotalPVASales] [float] NULL,
	[M3APIContract] [float] NULL,
	[M3AAPContract] [float] NULL,
	[M3UDContract] [float] NULL,
	[M3TotalPVASales] [float] NULL,
	[TotalCHPVA] [float] NULL,
	[M1SalesML] [float] NULL,
	[M2SalesML] [float] NULL,
	[M3SalesML] [float] NULL,
	[TotalML] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_RCFromBruce]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RCFromBruce](
	[TM] [float] NULL,
	[pmid] [float] NULL,
	[AAP#] [float] NULL,
	[Parent#] [float] NULL,
	[API#] [float] NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[Account DBA Name] [nvarchar](255) NULL,
	[Account Corporate Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[St] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[Whse Acct Date Opened] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Wholesaler] [nvarchar](255) NULL,
	[API Sep 09 Brand] [float] NULL,
	[API Sep 09 Generic] [float] NULL,
	[API Sep 09 OTC] [float] NULL,
	[API Sep 09 Total Whse] [float] NULL,
	[API Oct 09 Brand] [float] NULL,
	[API Oct 09 Generic] [float] NULL,
	[API Oct 09 OTC] [float] NULL,
	[API Oct 09 Total Whse] [float] NULL,
	[API Nov 09 Brand] [float] NULL,
	[API Nov 09 Generic] [float] NULL,
	[API Nov 09 OTC] [float] NULL,
	[API Nov 09 Total Whse] [float] NULL,
	[API Dec 09 Brand] [float] NULL,
	[API Dec 09 Generic] [float] NULL,
	[API Dec 09 OTC] [float] NULL,
	[API Dec 09 Total Whse] [float] NULL,
	[API Jan 10 Brand] [float] NULL,
	[API Jan 10 Generic] [float] NULL,
	[API Jan 10 OTC] [float] NULL,
	[API Jan 10 Total Whse] [float] NULL,
	[API Feb 10 Brand] [float] NULL,
	[API Feb 10 Generic] [float] NULL,
	[API Feb 10 OTC] [float] NULL,
	[API Feb 10 Total Whse] [float] NULL,
	[API Mar 10 Brand] [float] NULL,
	[API Mar 10 Generic] [float] NULL,
	[API Mar 10 OTC] [float] NULL,
	[API Mar 10 Total Whse] [float] NULL,
	[API Apr 10 Brand] [float] NULL,
	[API Apr 10 Generic] [float] NULL,
	[API Apr 10 OTC] [float] NULL,
	[API Apr 10 Total Whse] [float] NULL,
	[API May 10 Brand] [float] NULL,
	[API May 10 Generic] [float] NULL,
	[API May 10 OTC] [float] NULL,
	[API May 10 Total Whse] [float] NULL,
	[API Jun 10 Brand] [float] NULL,
	[API Jun 10 Generic] [float] NULL,
	[API Jun 10 OTC] [float] NULL,
	[API Jun 10 Total Whse] [float] NULL,
	[API Jul 10 Brand] [float] NULL,
	[API Jul 10 Generic] [float] NULL,
	[API Jul 10 OTC] [float] NULL,
	[API Jul 10 Total Whse] [float] NULL,
	[API Aug 10 Brand] [float] NULL,
	[API Aug 10 Generic] [float] NULL,
	[API Aug 10 OTC] [float] NULL,
	[API Aug 10 Total Whse] [float] NULL,
	[API Sep 10 Brand] [float] NULL,
	[API Sep 10 Generic] [float] NULL,
	[API Sep 10 OTC] [float] NULL,
	[API Sep 10 Total Whse] [float] NULL,
	[API Total Brand Sales] [float] NULL,
	[API Total Generic Sales] [float] NULL,
	[API Total OTC Sales] [float] NULL,
	[API Total Sales] [float] NULL,
	[CAH Feb AAP Brand] [float] NULL,
	[CAH Feb AAP Src Generics] [float] NULL,
	[CAH Feb AAP Other Sales] [float] NULL,
	[CAH Feb AAP Total Sales] [float] NULL,
	[CAH Mar AAP Brand] [float] NULL,
	[CAH Mar AAP Src Generics] [float] NULL,
	[CAH Mar AAP Other Sales] [float] NULL,
	[CAH Mar AAP Total Sales] [float] NULL,
	[CAH Apr AAP Brand] [float] NULL,
	[CAH Apr AAP Src Generics] [float] NULL,
	[CAH Apr AAP Other Sales] [float] NULL,
	[CAH Apr AAP Total Sales] [float] NULL,
	[CAH May AAP Brand] [float] NULL,
	[CAH May AAP Src Generics] [float] NULL,
	[CAH May AAP Other Sales] [float] NULL,
	[CAH May AAP Total Sales] [float] NULL,
	[CAH Jun AAP Brand] [float] NULL,
	[CAH Jun AAP Src Generics] [float] NULL,
	[CAH Jun AAP Other Sales] [float] NULL,
	[CAH Jun AAP Total Sales] [float] NULL,
	[CAH Jul AAP Brand] [float] NULL,
	[CAH Jul AAP Src Generics] [float] NULL,
	[CAH Jul AAP Other Sales] [float] NULL,
	[CAH Jul AAP Total Sales] [float] NULL,
	[CAH Aug AAP Brand] [float] NULL,
	[CAH Aug AAP Src Generics] [float] NULL,
	[CAH Aug AAP Other Sales] [float] NULL,
	[CAH Aug AAP Total Sales] [float] NULL,
	[CAH Total Brand Sales] [float] NULL,
	[CAH Total Src Generic Sales] [float] NULL,
	[CAH Total Other Sales] [float] NULL,
	[CAH Total Sales] [float] NULL,
	[ML Jan 10 Volume] [float] NULL,
	[ML Feb 10 Volume] [float] NULL,
	[ML Mar 10 Volume] [float] NULL,
	[ML Apr 10 Volume] [float] NULL,
	[ML May 10 Volume] [float] NULL,
	[ML Jun 10 Volume] [float] NULL,
	[ML Jul 10 Volume] [float] NULL,
	[ML Aug 10 Volume] [float] NULL,
	[ML YTD Total Volume] [float] NULL,
	[Total Sep 09 Combined Mthly Sales] [float] NULL,
	[Total Oct 09 Combined Mthly Sales] [float] NULL,
	[Total Nov 09 Combined Mthly Sales] [float] NULL,
	[Total Dec 09 Combined Mthly Sales] [float] NULL,
	[Total Jan 10 Combined Mthly Sales] [float] NULL,
	[Total Feb 10 Combined Mthly Sales] [float] NULL,
	[Total Mar 10 Combined Mthly Sales] [float] NULL,
	[Total Apr 10 Combined Mthly Sales] [float] NULL,
	[Total May 10 Combined Mthly Sales] [float] NULL,
	[Total Jun 10 Combined Mthly Sales] [float] NULL,
	[Total Jul 10 Combined Mthly Sales] [float] NULL,
	[Total Aug 10 Combined Mthly Sales] [float] NULL,
	[Total Sep 10 Combined Mthly Sales] [float] NULL,
	[Total Combined YTD Sales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_RxALly_bkp_091312_JMW]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RxALly_bkp_091312_JMW](
	[PMID] [int] NOT NULL,
	[IdentificationID] [varchar](6) NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[Owner/Officer] [varchar](30) NULL,
	[Name] [varchar](20) NULL,
	[StreetNumber] [varchar](7) NULL,
	[StreetName1] [varchar](30) NULL,
	[StreetName2] [varchar](30) NULL,
	[CityName] [varchar](15) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](5) NULL,
	[Owner/Officer email] [varchar](30) NULL,
	[Fax number] [varchar](10) NULL,
	[Affiliate] [varchar](30) NULL,
	[Notes] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_rxally_hold]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_rxally_hold](
	[PMID] [int] NOT NULL,
	[IdentificationID] [varchar](6) NULL,
	[NCPDP] [varchar](20) NULL,
	[NPI] [varchar](50) NULL,
	[Owner/Officer] [varchar](30) NULL,
	[Name] [varchar](20) NULL,
	[StreetNumber] [varchar](7) NULL,
	[StreetName1] [varchar](30) NULL,
	[StreetName2] [varchar](30) NULL,
	[CityName] [varchar](15) NULL,
	[State] [varchar](2) NULL,
	[ZipCode] [varchar](5) NULL,
	[Owner/Officer email] [varchar](30) NULL,
	[Fax number] [varchar](10) NULL,
	[Affiliate] [varchar](30) NULL,
	[Notes] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SalesReport0410]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SalesReport0410](
	[pmid] [nvarchar](255) NULL,
	[aapaccountno] [varchar](20) NULL,
	[apiaccountno] [varchar](20) NULL,
	[Affiliation] [nvarchar](255) NULL,
	[account name] [nvarchar](255) NULL,
	[Corpname] [varchar](100) NULL,
	[address] [varchar](100) NULL,
	[address2] [varchar](100) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](50) NULL,
	[contact] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[SourceSales] [money] NULL,
	[StoreRebate] [money] NULL,
	[AverageRebatePct] [money] NULL,
	[HRTA] [float] NULL,
	[territory] [varchar](4) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SLX_APIPayTerms]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLX_APIPayTerms](
	[PMID] [int] NULL,
	[TM] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[PayTerms] [varchar](255) NULL,
	[CreditLimit] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SLX_ChainCode_CS]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLX_ChainCode_CS](
	[AAPAccountNo] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[ChainCode] [float] NULL,
	[NPI] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[DEA] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SLXAccountsWB]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLXAccountsWB](
	[LastName] [varchar](255) NULL,
	[FirstName] [varchar](255) NULL,
	[Position] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Zip] [varchar](50) NULL,
	[GrpAffiliation] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Fax] [varchar](255) NULL,
	[Email] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SN_2011]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2011](
	[CIN] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SN_2011_byPMID]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2011_byPMID](
	[CIN] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SN_2011_byPMID3]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2011_byPMID3](
	[CIN] [nvarchar](255) NULL,
	[NDC] [nvarchar](11) NULL,
	[description] [nvarchar](255) NULL,
	[WAC_123111] [numeric](11, 5) NULL,
	[PS] [numeric](8, 3) NULL,
	[WACxPS] [numeric](20, 8) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SN_2012]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2012](
	[CIN] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SN_2012_byPMID]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2012_byPMID](
	[CIN] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_SN_2012_byPMID3]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2012_byPMID3](
	[CIN] [nvarchar](255) NULL,
	[NDC] [varchar](11) NULL,
	[description] [nvarchar](255) NULL,
	[WAC_060112] [numeric](11, 5) NULL,
	[PS] [numeric](8, 3) NULL,
	[WACxPS] [numeric](20, 8) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_taxName_jmw]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_taxName_jmw](
	[PMID] [float] NULL,
	[Acct DBA Name] [nvarchar](255) NULL,
	[AAP#] [float] NULL,
	[API#] [float] NULL,
	[APIStatus] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[FEDID] [nvarchar](255) NULL,
	[AAP Parent#] [float] NULL,
	[Quit Date] [datetime] NULL,
	[Tax Name] [nvarchar](255) NULL,
	[Entity type] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_test_am]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_test_am](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_UD_Vol_rpt]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UD_Vol_rpt](
	[CHAccountNo] [varchar](50) NULL,
	[PMID] [int] NULL,
	[Aug 10 Gen Vol] [float] NULL,
	[Aug 10 Tot Vol] [float] NULL,
	[Sep 10 Gen Vol] [float] NULL,
	[Sep 10 Tot Vol] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_vendorByType_CS]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorByType_CS](
	[PMID] [numeric](18, 0) NULL,
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[Store] [varchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Type] [varchar](255) NULL,
	[TM] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_WaltonRebates]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WaltonRebates](
	[DATE] [datetime] NULL,
	[SumOf Extended Sales] [money] NULL,
	[AAP Volume Admin Fee] [money] NULL,
	[SumOfBrand Rx Sales] [money] NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[SumOfTotal Generics] [money] NULL,
	[Est Generic Admin Fee] [money] NULL,
	[Calculated generic rebate] [money] NULL,
	[Leader Rebate] [money] NULL,
	[Pay to Store] [money] NULL,
	[Total to Pay Out] [money] NULL,
	[Effective Rebate%] [float] NULL,
	[HRTA] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_WaltonVolume]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_WaltonVolume](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[SumOfSales - COG Applied] [money] NULL,
	[SumOfNet Sales] [money] NULL,
	[SumOfRx Branded Sales] [money] NULL,
	[SumOfTot Generics w excluded] [money] NULL,
	[SumOfExcluded Gen] [money] NULL,
	[SumOfTop Generics Source] [money] NULL,
	[SumOfAAP Source] [money] NULL,
	[SumOfSource Backup] [money] NULL,
	[SumOfTot Generic Source] [money] NULL,
	[SumOfOTC Sales] [money] NULL,
	[SumOfOther] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_wh_allv]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wh_allv](
	[apiaccountno] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_wh_dist]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_wh_dist](
	[whaccountid] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpPMIDCII]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpPMIDCII](
	[pmid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpPMIDCII_All]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpPMIDCII_All](
	[PMID] [int] NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIStatus] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpPMIDCII_Final]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpPMIDCII_Final](
	[NDC] [varchar](15) NULL,
	[DrugName] [varchar](25) NULL,
	[Cardinal Acct #] [varchar](31) NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIStatus] [varchar](32) NULL,
	[PMID] [int] NOT NULL,
	[Marker] [bit] NULL,
	[Status] [varchar](32) NULL,
	[DEA] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[AKA] [varchar](255) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[IsMCAOnFile] [bit] NULL,
	[BusCls] [varchar](25) NULL,
	[Affiliate] [varchar](125) NULL,
	[CHParentCode] [varchar](25) NULL,
	[Division] [varchar](25) NULL,
	[DC] [varchar](100) NULL,
	[CHAccountNoPrimary] [varchar](50) NULL,
	[CHAccountNo2] [varchar](50) NULL,
	[CHAccountNo3] [varchar](50) NULL,
	[POSAcct] [varchar](50) NULL,
	[ScanTossAcct] [varchar](50) NULL,
	[CSOSAcct] [varchar](50) NULL,
	[AAPContractDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[IsMultipleStore] [bit] NULL,
	[MultipleStoreCode] [varchar](50) NULL,
	[GroupCode] [varchar](50) NULL,
	[CurrEstMoSales] [numeric](18, 2) NULL,
	[CurrGroupTotal] [numeric](18, 2) NULL,
	[EstVolAtLoad] [numeric](18, 2) NULL,
	[LastReviewDate] [datetime] NULL,
	[CurrAPICOG] [numeric](18, 4) NULL,
	[CurrCHCOG] [numeric](18, 4) NULL,
	[IsQPSStore] [bit] NULL,
	[PayTermsDesc] [varchar](255) NULL,
	[PayTermsCode] [varchar](50) NULL,
	[IsPendingChanges] [bit] NULL,
	[NotesCOGDifferences] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Territory] [varchar](10) NULL,
	[IsExcptToMatrix] [bit] NULL,
	[IsOptionalPayTerms] [bit] NULL,
	[IsFrontLoadNoReb] [bit] NULL,
	[WAPD] [numeric](18, 2) NULL,
	[DSO] [numeric](18, 2) NULL,
	[LastUpdate] [datetime] NULL,
	[WAPD2ndAcct] [numeric](18, 2) NULL,
	[DSO2ndAcct] [numeric](18, 2) NULL,
	[IsSublogicChange] [bit] NULL,
	[NotesOnTerms] [varchar](255) NULL,
	[ChangePending] [varchar](255) NULL,
	[ContractedDSO] [numeric](18, 2) NULL,
	[SecondDivision] [varchar](50) NULL,
	[SecondPrimaryNumber] [varchar](50) NULL,
	[Second2nd] [varchar](50) NULL,
	[Second3rd] [varchar](50) NULL,
	[SecondPOS] [varchar](50) NULL,
	[SecondCSOS] [varchar](50) NULL,
	[SecondCST] [varchar](50) NULL,
	[ThirdDivision] [varchar](50) NULL,
	[ThirdPrimaryNumber] [varchar](50) NULL,
	[Third2nd] [varchar](50) NULL,
	[ThirdPOS] [varchar](50) NULL,
	[ThirdCSOS] [varchar](50) NULL,
	[ThirdCST] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpPMIDCII_Quit]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpPMIDCII_Quit](
	[PMID] [int] NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[APIStatus] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tristate1]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tristate1](
	[Customer #] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Sate] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Business Type] [nvarchar](255) NULL,
	[Sales] [money] NULL,
	[Rebate Amount (3#5%)] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tristate2]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tristate2](
	[Customer #] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Sate] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Business Type] [nvarchar](255) NULL,
	[Sales] [money] NULL,
	[Rebate Amount (3#5%)] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[truescript_plan_claim_directpay_10022015]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[truescript_plan_claim_directpay_10022015](
	[PCLAIM_KEY] [int] NULL,
	[NABP] [char](7) NULL,
	[FEED_ID] [int] NULL,
	[PLAN_CYCLE_DT] [datetime] NULL,
	[PLAN_ID] [int] NULL,
	[RX_NUM] [char](20) NULL,
	[FILL_DT] [datetime] NULL,
	[BILL_AMT] [numeric](8, 2) NULL,
	[PAID_AMT] [numeric](8, 2) NULL,
	[REJECT_AMT] [numeric](8, 2) NULL,
	[INGRED_BILL_AMT] [numeric](8, 2) NULL,
	[INGRED_PD_AMT] [numeric](8, 2) NULL,
	[COPAY_AMT] [numeric](8, 2) NULL,
	[CONTRACT_FEE_AMT] [numeric](8, 2) NULL,
	[MISC_FEE_AMT] [numeric](8, 2) NULL,
	[REFILLS_QTY] [int] NULL,
	[CLAIM_TYPE] [varchar](63) NULL,
	[SUBMIT_CLARIF_CODE] [char](2) NULL,
	[GROUP_ID] [char](15) NULL,
	[PAYEE_ID] [int] NULL,
	[NPI] [varchar](10) NULL,
	[NDC] [varchar](17) NULL,
	[PAID_DT] [datetime] NULL,
	[ADJUSTMENT_AMT] [numeric](8, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uddw1_trace_20130730]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uddw1_trace_20130730](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[TextData] [ntext] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[NTUserName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[Duration] [bigint] NULL,
	[ClientProcessID] [int] NULL,
	[SPID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uddw1_trace_20130731]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uddw1_trace_20130731](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[TextData] [ntext] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[NTUserName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[Duration] [bigint] NULL,
	[ClientProcessID] [int] NULL,
	[SPID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uddw1_trace_knownbadquery]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uddw1_trace_knownbadquery](
	[RowNumber] [int] IDENTITY(0,1) NOT NULL,
	[EventClass] [int] NULL,
	[TextData] [ntext] NULL,
	[ApplicationName] [nvarchar](128) NULL,
	[NTUserName] [nvarchar](128) NULL,
	[LoginName] [nvarchar](128) NULL,
	[CPU] [int] NULL,
	[Reads] [bigint] NULL,
	[Writes] [bigint] NULL,
	[Duration] [bigint] NULL,
	[ClientProcessID] [int] NULL,
	[SPID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[BinaryData] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[RowNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnPaidLineItemSums]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnPaidLineItemSums](
	[PAYEE_ID] [int] NULL,
	[UNPAIDAMT] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[web2logs]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[web2logs](
	[date] [datetime] NULL,
	[time] [datetime] NULL,
	[s-sitename] [nvarchar](255) NULL,
	[s-computername] [nvarchar](255) NULL,
	[s-ip] [nvarchar](255) NULL,
	[cs-method] [nvarchar](255) NULL,
	[cs-uri-stem] [nvarchar](255) NULL,
	[cs-uri-query] [nvarchar](max) NULL,
	[s-port] [float] NULL,
	[cs-username] [nvarchar](255) NULL,
	[c-ip] [nvarchar](255) NULL,
	[cs(User-Agent)] [nvarchar](max) NULL,
	[cs(Referer)] [nvarchar](max) NULL,
	[sc-status] [float] NULL,
	[sc-substatus] [float] NULL,
	[sc-win32-status] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WV Invoice Customers]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WV Invoice Customers](
	[CustNbr] [nvarchar](11) NULL,
	[Name] [nvarchar](30) NULL,
	[Address1] [nvarchar](35) NULL,
	[Address2] [nvarchar](35) NULL,
	[City] [nvarchar](35) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[Contact] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WV Invoice Detail]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WV Invoice Detail](
	[API Customer #] [nvarchar](11) NULL,
	[Pharmacy Name] [nvarchar](30) NULL,
	[Pharmacy Contact] [nvarchar](20) NULL,
	[Address1] [nvarchar](35) NULL,
	[Address2] [nvarchar](35) NULL,
	[City] [nvarchar](35) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[DEA#] [nvarchar](255) NULL,
	[Inv Date] [nvarchar](255) NULL,
	[Inv#] [decimal](7, 0) NULL,
	[NDC] [nvarchar](15) NULL,
	[API#] [nvarchar](255) NULL,
	[Desc1] [nvarchar](255) NULL,
	[Desc2] [nvarchar](30) NULL,
	[Qty] [float] NULL,
	[Price] [float] NULL,
	[Amt] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WV Invoice Items]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WV Invoice Items](
	[API#] [nvarchar](255) NULL,
	[Desc1] [nvarchar](255) NULL,
	[Desc2] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XLTest]    Script Date: 12/22/2020 3:50:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XLTest](
	[API Item #] [nvarchar](255) NULL,
	[NDC #] [nvarchar](255) NULL,
	[Item Description] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Contract] [nvarchar](255) NULL,
	[API Price] [money] NULL,
	[billable cost] [float] NULL,
	[GPI] [nvarchar](255) NULL
) ON [PRIMARY]
GO
