USE [API]
GO
/****** Object:  Table [dbo].[APIDailySummary]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIDailySummary](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[API#] [varchar](10) NULL,
	[InvDate] [datetime] NULL,
	[InvDateKey] [int] NULL,
	[OrderType] [varchar](15) NULL,
	[DailySales] [money] NULL,
	[OrderedUnits] [int] NULL,
	[RowCreateDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_APIDailySummary] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_APIDailySummary_APINum_InvDateKey] UNIQUE NONCLUSTERED 
(
	[API#] ASC,
	[InvDateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APIDailySummary] ADD  DEFAULT (getdate()) FOR [RowCreateDate]
GO
