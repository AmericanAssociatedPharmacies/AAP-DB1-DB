USE [ShipmentInfo]
GO
/****** Object:  Table [Staging].[ShipmentDataTable]    Script Date: 12/22/2020 5:14:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ShipmentDataTable](
	[RowID] [int] NOT NULL,
	[PCKNUM] [nvarchar](80) NULL,
	[TrackNum] [nvarchar](35) NULL,
	[ShipWeight] [numeric](18, 3) NULL,
	[PubCost] [numeric](18, 2) NULL,
	[ShipCost] [numeric](18, 2) NULL,
	[ShipDate] [datetime] NULL,
	[ShipStatus] [nvarchar](50) NULL,
	[ShipMethod] [nvarchar](50) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [varbinary](8) NOT NULL,
	[RowCreatedDateETL] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_ShipmentDataTable] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[ShipmentDataTable] ADD  DEFAULT (getdate()) FOR [RowCreatedDateETL]
GO
