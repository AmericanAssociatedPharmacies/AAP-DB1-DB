USE [WebDev]
GO
/****** Object:  Table [dbo].[RebateDelayDates]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RebateDelayDates](
	[RebateDate] [datetime] NOT NULL,
	[DelayUntilDate] [datetime] NOT NULL,
	[RebateType] [varchar](20) NULL
) ON [PRIMARY]
GO
