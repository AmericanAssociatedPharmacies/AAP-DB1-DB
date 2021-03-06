USE [reporting]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_ndc_Quarterly_bkp]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_ndc_Quarterly_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[Q1] [float] NULL,
	[Q2] [float] NULL,
	[Q3] [float] NULL,
	[Q4] [float] NULL,
	[Q1_st_cnt] [int] NULL,
	[Q2_st_cnt] [int] NULL,
	[Q3_st_cnt] [int] NULL,
	[Q4_st_cnt] [int] NULL,
	[Q1_qty] [int] NULL,
	[Q2_qty] [int] NULL,
	[Q3_qty] [int] NULL,
	[Q4_qty] [int] NULL
) ON [PRIMARY]
GO
