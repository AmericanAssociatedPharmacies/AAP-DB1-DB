USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PPRevenueDistribution2018]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PPRevenueDistribution2018](
	[Preferred Partner] [nvarchar](255) NULL,
	[Admin Fee] [float] NULL,
	[Rebate] [float] NULL,
	[Total] [float] NULL,
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[Active] [bit] NULL,
	[DistributionPercent] [decimal](8, 2) NULL
) ON [PRIMARY]
GO
