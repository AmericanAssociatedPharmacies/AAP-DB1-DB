USE [ShipmentInfo]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_new_old_20200406_2]    Script Date: 12/22/2020 5:14:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDataTable_new_old_20200406_2](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
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
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_ShipmentDataTable_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShipmentDataTable_new_old_20200406_2] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
