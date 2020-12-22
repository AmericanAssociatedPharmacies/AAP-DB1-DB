USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[Partners_backup_RSE_20200206]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_backup_RSE_20200206](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[RebateReportDisplayName] [varchar](255) NULL,
	[PPVendorID] [int] NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
