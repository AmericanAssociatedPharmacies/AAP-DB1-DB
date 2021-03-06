USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[APICustomerList]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICustomerList](
	[TM] [nvarchar](50) NULL,
	[Acct#] [nvarchar](50) NULL,
	[Pharmacy Name] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[ST] [nvarchar](50) NULL,
	[ZIP] [nvarchar](50) NULL,
	[WHS] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[FAX] [nvarchar](50) NULL,
	[BUSCLS] [nvarchar](50) NULL,
	[MOT] [nvarchar](50) NULL
) ON [PRIMARY]
GO
