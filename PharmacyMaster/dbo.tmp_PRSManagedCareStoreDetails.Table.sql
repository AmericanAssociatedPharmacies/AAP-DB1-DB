USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[tmp_PRSManagedCareStoreDetails]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PRSManagedCareStoreDetails](
	[NCPDP] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](50) NULL,
	[FacilityAddress1] [nvarchar](50) NULL,
	[FacilityAddress2] [nvarchar](50) NULL,
	[FacilityCity] [nvarchar](50) NULL,
	[FacilityState] [nvarchar](50) NULL,
	[FacilityZip] [nvarchar](50) NULL,
	[FacilityPhone] [nvarchar](50) NULL,
	[FacilityFax] [nvarchar](50) NULL,
	[NPINumber] [nvarchar](50) NULL
) ON [PRIMARY]
GO
