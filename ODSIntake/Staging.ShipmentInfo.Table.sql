USE [ODSIntake]
GO
/****** Object:  Table [Staging].[ShipmentInfo]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ShipmentInfo](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ROW_NUM] [bigint] NOT NULL,
	[COMPANY_NO] [numeric](3, 0) NOT NULL,
	[PACKAGE_ID] [numeric](4, 0) NOT NULL,
	[ORDER_ID] [numeric](9, 0) NOT NULL,
	[ORDER_BO_CODE] [numeric](3, 0) NOT NULL,
	[COMPANY_ID] [varchar](25) NOT NULL,
	[TRACKING_NUMBER] [varchar](100) NOT NULL,
	[SHIP_COST] [numeric](11, 2) NOT NULL,
	[SHIP_DATE] [varchar](100) NULL,
	[SHIP_STATUS] [varchar](50) NOT NULL,
	[SHIP_METHOD] [varchar](50) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[ShipmentInfo] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
