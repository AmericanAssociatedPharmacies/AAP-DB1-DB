USE [API]
GO
/****** Object:  Table [dbo].[APISalesDetail_Report_2]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APISalesDetail_Report_2](
	[WHAccountID] [varchar](8) NOT NULL,
	[MinInvDate] [datetime] NULL,
	[MaxInvDate] [datetime] NULL
) ON [PRIMARY]
GO
