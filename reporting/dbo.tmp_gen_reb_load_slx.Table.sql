USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_gen_reb_load_slx]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_reb_load_slx](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[DEA] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[oct_gen_vol_amt] [numeric](38, 2) NULL,
	[oct_rx_vol_amt] [numeric](38, 2) NULL,
	[nov_gen_vol_amt] [numeric](38, 2) NULL,
	[nov_rx_vol_amt] [numeric](38, 2) NULL,
	[dec_gen_vol_amt] [numeric](38, 2) NULL,
	[dec_rx_vol_amt] [numeric](38, 2) NULL,
	[gen_vol_avg] [numeric](38, 2) NULL,
	[rx_vol_avg] [numeric](38, 2) NULL,
	[compliancePerc] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
