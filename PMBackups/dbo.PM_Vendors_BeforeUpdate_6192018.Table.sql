USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Vendors_BeforeUpdate_6192018]    Script Date: 12/22/2020 4:47:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Vendors_BeforeUpdate_6192018](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
