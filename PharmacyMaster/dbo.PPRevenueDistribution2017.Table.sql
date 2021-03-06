USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PPRevenueDistribution2017]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRevenueDistribution2017](
	[Partner Name] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL,
	[VendorName] [nvarchar](255) NULL,
	[VendorID] [float] NULL,
	[Active] [float] NULL
) ON [PRIMARY]
GO
