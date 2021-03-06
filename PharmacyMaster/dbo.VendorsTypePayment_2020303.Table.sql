USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[VendorsTypePayment_2020303]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorsTypePayment_2020303](
	[Vendor ID] [nvarchar](255) NULL,
	[Vendor Name] [nvarchar](255) NULL,
	[Contact] [nvarchar](255) NULL,
	[Telephone 1] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Balance] [money] NULL,
	[1099 Type] [nvarchar](255) NULL,
	[E-mail] [nvarchar](255) NULL,
	[Remit To Address 1] [nvarchar](255) NULL,
	[Mail To City] [nvarchar](255) NULL,
	[Remit To State] [nvarchar](255) NULL,
	[Remit To Address 2] [nvarchar](255) NULL
) ON [PRIMARY]
GO
