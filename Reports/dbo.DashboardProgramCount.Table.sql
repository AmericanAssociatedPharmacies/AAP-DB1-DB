USE [Reports]
GO
/****** Object:  Table [dbo].[DashboardProgramCount]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardProgramCount](
	[Program] [varchar](125) NULL,
	[Count] [int] NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
