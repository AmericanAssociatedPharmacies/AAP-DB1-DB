USE [reporting]
GO
/****** Object:  Table [dbo].[temp_COG_Compare0909_group_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_COG_Compare0909_group_del](
	[acct_no] [varchar](50) NULL,
	[store] [varchar](65) NULL,
	[nsterritory] [varchar](2) NULL,
	[AFF] [float] NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[GroupId] [varchar](10) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG Buy Plan %] [float] NULL,
	[Q3_Total_Sales] [numeric](38, 2) NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[Q3_Total_RX] [numeric](38, 2) NULL,
	[Q3_Total_RX_BRAND] [numeric](38, 2) NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[Q3_Total_Generics] [numeric](38, 2) NULL,
	[Q3_Total_Source_Generic] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[Q3_OTC_COG_Applied] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL,
	[GCR%] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
