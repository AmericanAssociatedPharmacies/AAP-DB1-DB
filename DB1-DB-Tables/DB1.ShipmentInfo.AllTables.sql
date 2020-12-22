USE [ShipmentInfo]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_new]    Script Date: 12/22/2020 3:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDataTable_new](
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
	[RowversionID] [varbinary](8) NULL,
	[S2KRowID] [int] NULL,
	[OrderID] [varchar](50) NULL,
	[RowversionIDS2K] [timestamp] NOT NULL,
 CONSTRAINT [CPK_ShipmentDataTable_New_20200811] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_New_20200323]    Script Date: 12/22/2020 3:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDataTable_New_20200323](
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
	[RowUpdatedDateETL] [datetime] NULL,
 CONSTRAINT [CPK_ShipmentDataTable_New2] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_new_backup_20200811]    Script Date: 12/22/2020 3:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDataTable_new_backup_20200811](
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
	[OrderID] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_new_old]    Script Date: 12/22/2020 3:49:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDataTable_new_old](
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
	[RowversionID] [varbinary](8) NOT NULL,
 CONSTRAINT [CPK_ShipmentDataTable_New_20200406] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDataTable_new_old_20200406_2]    Script Date: 12/22/2020 3:49:15 AM ******/
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
/****** Object:  Table [dbo].[ShipmentDataTable_new_old_20200811]    Script Date: 12/22/2020 3:49:15 AM ******/
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
/****** Object:  Table [Staging].[ShipmentDataTable]    Script Date: 12/22/2020 3:49:15 AM ******/
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
ALTER TABLE [dbo].[ShipmentDataTable_new] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ShipmentDataTable_New_20200323] ADD  DEFAULT (getdate()) FOR [RowCreatedDateETL]
GO
ALTER TABLE [dbo].[ShipmentDataTable_new_old] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[ShipmentDataTable_new_old_20200406_2] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[ShipmentDataTable] ADD  DEFAULT (getdate()) FOR [RowCreatedDateETL]
GO
