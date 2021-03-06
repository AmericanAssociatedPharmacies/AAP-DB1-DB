USE [ODSIntake]
GO
/****** Object:  Table [dbo].[ShipmentInfo_20200811]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentInfo_20200811](
	[ROW_NUM] [bigint] NOT NULL,
	[COMPANY_NO] [numeric](3, 0) NOT NULL,
	[PACKAGE_ID] [numeric](4, 0) NOT NULL,
	[ORDER_ID] [numeric](9, 0) NOT NULL,
	[ORDER_BO_CODE] [numeric](3, 0) NOT NULL,
	[COMPANY_ID] [char](7) NOT NULL,
	[TRACKING_NUMBER] [char](30) NOT NULL,
	[SHIP_COST] [numeric](11, 2) NOT NULL,
	[SHIP_DATE] [varchar](49) NULL,
	[SHIP_STATUS] [varchar](7) NOT NULL,
	[SHIP_METHOD] [varchar](4) NOT NULL
) ON [PRIMARY]
GO
