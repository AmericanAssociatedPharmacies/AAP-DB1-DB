USE [reporting]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_mnthly_bkp]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_mnthly_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
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
	[DECEMBER] [float] NULL
) ON [PRIMARY]
GO
