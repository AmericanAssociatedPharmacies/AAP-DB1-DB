USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[VendorTransaction_BK20200327]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTransaction_BK20200327](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL
) ON [PRIMARY]
GO
