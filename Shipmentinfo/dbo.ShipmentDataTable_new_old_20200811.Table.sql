USE [ShipmentInfo]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_new_old_20200811]    Script Date: 12/22/2020 5:14:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDataTable_new_old_20200811](
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
	[S2KRowID] [int] NULL,
	[OrderID] [varchar](50) NULL,
 CONSTRAINT [CPK_ShipmentDataTable_New_2] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
