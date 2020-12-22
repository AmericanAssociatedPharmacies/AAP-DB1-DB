USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_ndc_sales_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ndc_sales_del](
	[ID] [int] NOT NULL,
	[ndc] [varchar](15) NULL,
	[YTD_Sales] [float] NULL,
	[PctTotalSales] [float] NULL
) ON [PRIMARY]
GO
