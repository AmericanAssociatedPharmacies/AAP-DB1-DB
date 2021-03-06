USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_COG_XLS_0909]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COG_XLS_0909](
	[NCPDP] [varchar](7) NULL,
	[DEA] [varchar](10) NULL,
	[StoreName] [varchar](65) NULL,
	[UD_ACCT_NO] [varchar](50) NULL,
	[AAP_ACCT_NO] [varchar](20) NULL,
	[API_ACCT_NO] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[NSTerritory] [varchar](2) NULL,
	[SLXTerritory] [varchar](32) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG Buy Plan %] [float] NULL,
	[Q3_Total_RX] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[avg_mo_total_sales_group] [numeric](38, 2) NULL,
	[Curr_UpfrontDiscount] [numeric](38, 2) NULL,
	[New_UpfrontDiscount] [numeric](38, 2) NULL,
	[AVG_Total_RX] [money] NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
