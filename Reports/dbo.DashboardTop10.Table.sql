USE [Reports]
GO
/****** Object:  Table [dbo].[DashboardTop10]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardTop10](
	[Date] [datetime] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[Sales] [numeric](38, 2) NULL,
	[DrugName] [varchar](255) NULL
) ON [PRIMARY]
GO
