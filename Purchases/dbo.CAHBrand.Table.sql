USE [Purchases]
GO
/****** Object:  Table [dbo].[CAHBrand]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHBrand](
	[CIN] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Size] [numeric](18, 3) NULL,
	[Strength] [nvarchar](50) NULL,
	[Col1] [nvarchar](50) NULL,
	[CAHPrice] [numeric](18, 4) NULL,
	[Col2] [nvarchar](50) NULL,
	[Col3] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[Col10] [nvarchar](50) NULL,
	[Col11] [numeric](18, 4) NULL,
	[Col12] [nvarchar](50) NULL,
	[Column 13] [nvarchar](50) NULL,
	[Column 14] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[UnitOfIssue] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
