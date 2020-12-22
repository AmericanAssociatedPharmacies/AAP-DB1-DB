USE [WebTest]
GO
/****** Object:  Table [dbo].[MessageCenter_AccessCodes]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_AccessCodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[access_code] [varchar](15) NOT NULL,
	[description] [varchar](255) NULL
) ON [PRIMARY]
GO
