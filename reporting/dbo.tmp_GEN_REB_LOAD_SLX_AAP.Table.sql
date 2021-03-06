USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_GEN_REB_LOAD_SLX_AAP]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GEN_REB_LOAD_SLX_AAP](
	[Store_Name] [varchar](8000) NULL,
	[acct_no] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[mo1_gen_vol_amt] [numeric](38, 2) NULL,
	[mo1_rx_vol_amt] [numeric](38, 2) NULL,
	[mo2_gen_vol_amt] [numeric](38, 2) NULL,
	[mo2_rx_vol_amt] [numeric](38, 2) NULL,
	[mo3_gen_vol_amt] [numeric](38, 2) NULL,
	[mo3_rx_vol_amt] [numeric](38, 2) NULL,
	[gen_vol_tot] [numeric](38, 2) NULL,
	[rx_vol_tot] [numeric](38, 2) NULL,
	[compliancePerc] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
