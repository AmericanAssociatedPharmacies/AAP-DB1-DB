USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Vendors_BCO]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Vendors_BCO](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL
) ON [PRIMARY]
GO
