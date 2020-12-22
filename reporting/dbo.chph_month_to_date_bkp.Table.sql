USE [reporting]
GO
/****** Object:  Table [dbo].[chph_month_to_date_bkp]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_month_to_date_bkp](
	[Year] [int] NULL,
	[Store] [varchar](31) NULL,
	[WEEK01] [float] NULL,
	[WEEK02] [float] NULL,
	[WEEK03] [float] NULL,
	[WEEK04] [float] NULL,
	[WEEK05] [float] NULL,
	[WEEK06] [float] NULL,
	[Month] [varchar](2) NULL
) ON [PRIMARY]
GO
