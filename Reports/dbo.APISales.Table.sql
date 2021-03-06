USE [Reports]
GO
/****** Object:  Table [dbo].[APISales]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISales](
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Date] [smalldatetime] NULL,
	[APIGenericSales] [money] NULL,
	[APIBrandSales] [money] NULL,
	[APIOTCSales] [money] NULL
) ON [PRIMARY]
GO
