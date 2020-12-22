USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_Brand_CHPrice]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Brand_CHPrice](
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
	[BRANDNAME] [nvarchar](50) NULL,
	[GENERICPRODUCTDESCRIPTION] [nvarchar](50) NULL,
	[INVOICEPRICE] [nvarchar](50) NULL,
	[DrugTypeShort] [varchar](3) NULL
) ON [PRIMARY]
GO
