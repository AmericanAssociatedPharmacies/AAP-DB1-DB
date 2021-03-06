USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[NCPDPPaymentCenter]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCPDPPaymentCenter](
	[Payment Center ID] [nvarchar](6) NULL,
	[Payment Center Name] [nvarchar](35) NULL,
	[Remittance Address 1] [nvarchar](55) NULL,
	[Remittance Address 2] [nvarchar](55) NULL,
	[Remittance City] [nvarchar](30) NULL,
	[Remittance State Code] [nvarchar](2) NULL,
	[Remittance Zip Code] [nvarchar](9) NULL,
	[Remittance Phone Number] [nvarchar](10) NULL,
	[Remittance Extension] [nvarchar](5) NULL,
	[Remittance FAX Number] [nvarchar](10) NULL,
	[Remittance Contact Name] [nvarchar](30) NULL,
	[Remittance Contact Title] [nvarchar](30) NULL,
	[Remittance E-Mail Address] [nvarchar](50) NULL,
	[Delete Date] [nvarchar](8) NULL
) ON [PRIMARY]
GO
