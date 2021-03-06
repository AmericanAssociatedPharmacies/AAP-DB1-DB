USE [reporting]
GO
/****** Object:  Table [dbo].[DATES_TABLE]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATES_TABLE](
	[DATE_ID] [int] NOT NULL,
	[DATE] [datetime] NOT NULL,
	[NEXT_DAY_DATE] [datetime] NOT NULL,
	[YEAR] [smallint] NOT NULL,
	[YEAR_QUARTER] [int] NOT NULL,
	[YEAR_MONTH] [int] NOT NULL,
	[YEAR_DAY_OF_YEAR] [int] NOT NULL,
	[QUARTER] [tinyint] NOT NULL,
	[MONTH] [tinyint] NOT NULL,
	[DAY_OF_YEAR] [smallint] NOT NULL,
	[DAY_OF_MONTH] [smallint] NOT NULL,
	[DAY_OF_WEEK] [tinyint] NOT NULL,
	[YEAR_NAME] [varchar](4) NOT NULL,
	[YEAR_QUARTER_NAME] [varchar](7) NOT NULL,
	[YEAR_MONTH_NAME] [varchar](8) NOT NULL,
	[YEAR_MONTH_NAME_LONG] [varchar](14) NOT NULL,
	[QUARTER_NAME] [varchar](2) NOT NULL,
	[MONTH_NAME] [varchar](3) NOT NULL,
	[MONTH_NAME_LONG] [varchar](9) NOT NULL,
	[WEEKDAY_NAME] [varchar](3) NOT NULL,
	[WEEKDAY_NAME_LONG] [varchar](9) NOT NULL,
	[START_OF_YEAR_DATE] [datetime] NOT NULL,
	[END_OF_YEAR_DATE] [datetime] NOT NULL,
	[START_OF_QUARTER_DATE] [datetime] NOT NULL,
	[END_OF_QUARTER_DATE] [datetime] NOT NULL,
	[START_OF_MONTH_DATE] [datetime] NOT NULL,
	[END_OF_MONTH_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_SUN_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_SUN_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_MON_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_MON_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_TUE_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_TUE_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_WED_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_WED_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_THU_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_THU_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_FRI_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_FRI_DATE] [datetime] NOT NULL,
	[START_OF_WEEK_STARTING_SAT_DATE] [datetime] NOT NULL,
	[END_OF_WEEK_STARTING_SAT_DATE] [datetime] NOT NULL,
	[QUARTER_SEQ_NO] [int] NOT NULL,
	[MONTH_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_SUN_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_MON_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_TUE_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_WED_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_THU_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_FRI_SEQ_NO] [int] NOT NULL,
	[WEEK_STARTING_SAT_SEQ_NO] [int] NOT NULL,
	[JULIAN_DATE] [int] NOT NULL,
	[MODIFIED_JULIAN_DATE] [int] NOT NULL,
	[ISO_DATE] [varchar](10) NOT NULL,
	[ISO_YEAR_WEEK_NO] [int] NOT NULL,
	[ISO_WEEK_NO] [smallint] NOT NULL,
	[ISO_DAY_OF_WEEK] [tinyint] NOT NULL,
	[ISO_YEAR_WEEK_NAME] [varchar](8) NOT NULL,
	[ISO_YEAR_WEEK_DAY_OF_WEEK_NAME] [varchar](10) NOT NULL,
	[DATE_FORMAT_YYYY_MM_DD] [varchar](10) NOT NULL,
	[DATE_FORMAT_YYYY_M_D] [varchar](10) NOT NULL,
	[DATE_FORMAT_MM_DD_YYYY] [varchar](10) NOT NULL,
	[DATE_FORMAT_M_D_YYYY] [varchar](10) NOT NULL,
	[DATE_FORMAT_MMM_D_YYYY] [varchar](12) NOT NULL,
	[DATE_FORMAT_MMMMMMMMM_D_YYYY] [varchar](18) NOT NULL,
	[DATE_FORMAT_MM_DD_YY] [varchar](8) NOT NULL,
	[DATE_FORMAT_M_D_YY] [varchar](8) NOT NULL
) ON [PRIMARY]
GO
