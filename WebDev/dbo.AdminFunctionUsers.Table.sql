USE [WebDev]
GO
/****** Object:  Table [dbo].[AdminFunctionUsers]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminFunctionUsers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[functionid] [int] NULL
) ON [PRIMARY]
GO
