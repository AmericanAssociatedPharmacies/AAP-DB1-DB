USE [API]
GO
/****** Object:  Table [dbo].[APIContactName_del]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIContactName_del](
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[ContactFromAPI] [varchar](100) NULL,
	[Email] [varchar](75) NULL,
	[DEA] [varchar](50) NULL
) ON [PRIMARY]
GO
