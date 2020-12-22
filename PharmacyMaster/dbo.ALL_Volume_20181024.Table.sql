USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[ALL_Volume_20181024]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_20181024](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[AndaTotal] [float] NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_ALL_Volume_New_20181024] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALL_Volume_20181024] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
