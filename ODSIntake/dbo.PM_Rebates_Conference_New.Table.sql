USE [ODSIntake]
GO
/****** Object:  Table [dbo].[PM_Rebates_Conference_New]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_Conference_New](
	[date] [datetime] NULL,
	[date_period_start] [datetime] NULL,
	[date_period_end] [datetime] NULL,
	[rebate_type] [varchar](32) NULL,
	[PMID] [float] NULL,
	[accountname] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
