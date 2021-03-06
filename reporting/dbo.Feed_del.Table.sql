USE [reporting]
GO
/****** Object:  Table [dbo].[Feed_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feed_del](
	[Feed_id] [int] NULL,
	[data_src_id] [int] NULL,
	[data_src_type] [char](1) NULL,
	[plan_cycle_dt] [datetime] NULL,
	[layout_id] [char](10) NULL,
	[Load_Start_TM] [datetime] NULL,
	[Load_End_TM] [datetime] NULL,
	[feed_stat] [char](1) NULL,
	[error_code] [char](10) NULL,
	[feed_stat_desc] [varchar](48) NULL,
	[Feed_Stat_TM] [datetime] NULL,
	[filename] [varchar](32) NULL,
	[record_count] [int] NULL,
	[total_amt] [numeric](12, 2) NULL,
	[total_misc_amt] [numeric](10, 2) NULL,
	[uploaded_to_access] [smallint] NULL
) ON [PRIMARY]
GO
