USE [reporting]
GO
/****** Object:  Table [dbo].[atb_reporting_log_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atb_reporting_log_del](
	[RPT_LOG_ID] [int] NULL,
	[RPT_DESCRIPTION] [varchar](50) NULL,
	[RPT_WE_DT] [datetime] NULL
) ON [PRIMARY]
GO
