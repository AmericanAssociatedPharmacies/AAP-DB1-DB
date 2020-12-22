USE [WebDev]
GO
/****** Object:  Table [dbo].[AdminFunctions]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminFunctions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](100) NULL,
	[FunctionName] [varchar](100) NOT NULL,
	[Description] [varchar](255) NULL,
	[Functiontype] [varchar](50) NULL,
	[Location] [varchar](255) NULL
) ON [PRIMARY]
GO
