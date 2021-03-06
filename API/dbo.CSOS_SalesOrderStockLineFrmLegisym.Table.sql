USE [API]
GO
/****** Object:  Table [dbo].[CSOS_SalesOrderStockLineFrmLegisym]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSOS_SalesOrderStockLineFrmLegisym](
	[StockLineId] [bigint] IDENTITY(1,1) NOT NULL,
	[LineId] [int] NOT NULL,
	[StockCode] [varchar](20) NOT NULL,
	[StockDescription] [varchar](50) NOT NULL,
	[StockCategory] [varchar](50) NOT NULL,
	[DeaSchedule] [varchar](8) NOT NULL,
	[DeaScheduleName] [varchar](75) NOT NULL,
	[NdcNumber] [varchar](11) NULL,
	[PackageSize] [nvarchar](50) NULL,
	[ArcosQtyFactor] [int] NULL,
	[ArcosUnit] [nvarchar](60) NULL,
	[ArcosStrength] [nvarchar](150) NULL,
	[OrderQty] [int] NOT NULL,
	[StockLineCustomData] [nvarchar](500) NULL,
	[Price] [nvarchar](50) NULL,
	[QtyonHand] [nvarchar](50) NULL,
	[BrandReference] [nvarchar](50) NULL,
	[SalesOrderFrmLegisymId] [bigint] NULL,
 CONSTRAINT [PK_CSOS_SalesOrdersStockLineFrmLegisym] PRIMARY KEY CLUSTERED 
(
	[StockLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CSOS_SalesOrderStockLineFrmLegisym]  WITH CHECK ADD  CONSTRAINT [FK_CSOS_SalesOrderStockLineFrmLegisym_CSOS_SalesOrderFrmLegisym] FOREIGN KEY([SalesOrderFrmLegisymId])
REFERENCES [dbo].[CSOS_SalesOrderFrmLegisym] ([SalesOrderFrmLegisymId])
GO
ALTER TABLE [dbo].[CSOS_SalesOrderStockLineFrmLegisym] CHECK CONSTRAINT [FK_CSOS_SalesOrderStockLineFrmLegisym_CSOS_SalesOrderFrmLegisym]
GO
