USE [reporting]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_ndc_bkp]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_ndc_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[NDC] [varchar](50) NOT NULL,
	[JANUARY] [float] NULL,
	[FEBRUARY] [float] NULL,
	[MARCH] [float] NULL,
	[APRIL] [float] NULL,
	[MAY] [float] NULL,
	[JUNE] [float] NULL,
	[JULY] [float] NULL,
	[AUGUST] [float] NULL,
	[SEPTEMBER] [float] NULL,
	[OCTOBER] [float] NULL,
	[NOVEMBER] [float] NULL,
	[DECEMBER] [float] NULL,
	[january_st_cnt] [int] NULL,
	[february_st_cnt] [int] NULL,
	[march_st_cnt] [int] NULL,
	[april_st_cnt] [int] NULL,
	[may_st_cnt] [int] NULL,
	[june_st_cnt] [int] NULL,
	[july_st_cnt] [int] NULL,
	[august_st_cnt] [int] NULL,
	[september_st_cnt] [int] NULL,
	[october_st_cnt] [int] NULL,
	[november_st_cnt] [int] NULL,
	[december_st_cnt] [int] NULL,
	[january_qty] [int] NULL,
	[february_qty] [int] NULL,
	[march_qty] [int] NULL,
	[april_qty] [int] NULL,
	[may_qty] [int] NULL,
	[june_qty] [int] NULL,
	[july_qty] [int] NULL,
	[august_qty] [int] NULL,
	[september_qty] [int] NULL,
	[october_qty] [int] NULL,
	[november_qty] [int] NULL,
	[december_qty] [int] NULL
) ON [PRIMARY]
GO
