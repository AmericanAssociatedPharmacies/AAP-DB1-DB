USE [AAP]
GO
/****** Object:  Table [dbo].[VendorReporting]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorReporting](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[LoadID] [int] NULL,
	[AccountID] [int] NOT NULL,
	[dt] [datetime] NULL,
	[vendor_id] [int] NULL,
	[loadType] [int] NULL,
	[Amount] [numeric](18, 2) NULL,
	[LoadTime] [datetime] NULL,
	[LoadedBy] [varchar](50) NULL
) ON [PRIMARY]
GO
