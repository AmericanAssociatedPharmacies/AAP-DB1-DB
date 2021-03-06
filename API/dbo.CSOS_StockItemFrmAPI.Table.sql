USE [API]
GO
/****** Object:  Table [dbo].[CSOS_StockItemFrmAPI]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_StockItemFrmAPI](
	[StockItemFrmAPIId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[SchemaVersion] [nvarchar](50) NULL,
	[DatePrepared] [smalldatetime] NULL,
	[TimePrepared] [nvarchar](30) NULL,
	[ServiceContract] [nvarchar](45) NULL,
	[XmlToLegisym] [xml] NULL,
	[ActionCode] [nvarchar](50) NULL,
	[E222StockId] [nvarchar](50) NULL,
	[SupplierStockId] [nvarchar](28) NULL,
	[StockDescription] [nvarchar](50) NULL,
	[StockCategory] [nvarchar](50) NULL,
	[Source] [nvarchar](50) NULL,
	[DeaSchedule] [nvarchar](50) NULL,
	[DeaScheduleName] [nvarchar](50) NULL,
	[NdcNumber] [nvarchar](11) NULL,
	[PackageSize] [nvarchar](50) NULL,
	[ArcosQtyFactor] [nvarchar](50) NULL,
	[ArcosUnit] [nvarchar](50) NULL,
	[ArcosStrength] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[QtyonHand] [nvarchar](50) NULL,
	[BrandReference] [nvarchar](50) NULL,
	[PRDC] [nvarchar](50) NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_StockItem] PRIMARY KEY CLUSTERED 
(
	[StockItemFrmAPIId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
