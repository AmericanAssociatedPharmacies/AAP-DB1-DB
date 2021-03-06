USE [ODSIntake]
GO
/****** Object:  Table [dbo].[InvoiceComparison]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceComparison](
	[Date] [datetime] NULL,
	[Type] [nvarchar](15) NULL,
	[CIN] [float] NULL,
	[DESCRIPTION] [nvarchar](255) NULL,
	[SIZE] [nvarchar](50) NULL,
	[AAP Price] [float] NULL,
	[Supplier] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](100) NULL,
	[NDC/UPC] [nvarchar](15) NULL,
	[GPI_ID] [nvarchar](25) NULL,
	[AWP] [float] NULL,
	[Select] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
	[Comp Price] [nvarchar](50) NULL,
	[Invoice#] [nvarchar](50) NULL,
	[Invoice date] [datetime] NULL,
	[AAP Ext] [nvarchar](50) NULL,
	[Comp Ext] [nvarchar](50) NULL,
	[Size diff] [nvarchar](50) NULL,
	[Comp NDC] [nvarchar](50) NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
