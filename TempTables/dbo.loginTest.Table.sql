USE [TempTables]
GO
/****** Object:  Table [dbo].[loginTest]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loginTest](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[active] [bit] NULL
) ON [PRIMARY]
GO
