USE [reporting]
GO
/****** Object:  Table [dbo].[NDC_DOWNLOAD_MASTER_ALL_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDC_DOWNLOAD_MASTER_ALL_del](
	[NDC11] [nvarchar](50) NULL,
	[Drug Name] [nvarchar](50) NULL,
	[Strength] [nvarchar](50) NULL,
	[Brand Type] [nvarchar](50) NULL,
	[DAW] [nvarchar](50) NULL,
	[Column 5] [nvarchar](50) NULL,
	[Dot Nbr] [nvarchar](50) NULL,
	[Metrics] [nvarchar](50) NULL,
	[TRx Count] [nvarchar](50) NULL,
	[TRx Quantity Dispensed] [nvarchar](50) NULL,
	[Total  AWP] [nvarchar](50) NULL,
	[Patient Paid Amount] [nvarchar](50) NULL,
	[Total Paid Amount] [nvarchar](50) NULL,
	[Dispensing Fee Amount] [nvarchar](50) NULL,
	[Total Ingredient Cost] [nvarchar](50) NULL,
	[Usual Customary Amount] [nvarchar](50) NULL
) ON [PRIMARY]
GO
