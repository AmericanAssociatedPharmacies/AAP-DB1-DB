USE [AAP]
GO
/****** Object:  Table [dbo].[AAPPrograms]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPPrograms](
	[PROGRAM_ID] [int] NULL,
	[DESCRIPTION] [varchar](50) NULL,
	[COMMENT_CONST] [varchar](255) NULL,
	[CATEGORY] [char](1) NULL
) ON [PRIMARY]
GO
