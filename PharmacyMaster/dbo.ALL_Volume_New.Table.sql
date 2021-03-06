USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[ALL_Volume_New]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_Volume_New](
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
 CONSTRAINT [CPK_ALL_Volume_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_All_Volume_New] UNIQUE NONCLUSTERED 
(
	[Date] ASC,
	[PMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APICOGAppliedSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APINetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENRx]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENTotalP2P3]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [APIOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPCOGAppliedSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPGENExcl]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AAPOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [UDAdminOnly]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombNetSales]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombBrands]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombGENTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombGENTotalSrc]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombOther]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [CombAdminOnly]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPIBrand]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0)) FOR [WHAPIBrandUnits]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPIGeneric]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0)) FOR [WHAPIGenericUnits]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPIOTC]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0)) FOR [WHAPIOTCUnits]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [WHAPITotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [MLTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT ((0.00)) FOR [AndaTotal]
GO
ALTER TABLE [dbo].[ALL_Volume_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
