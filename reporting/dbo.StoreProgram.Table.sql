USE [reporting]
GO
/****** Object:  Table [dbo].[StoreProgram]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreProgram](
	[ID] [int] NULL,
	[PROGRAM_ID] [int] NULL,
	[STORE_ID] [int] NULL,
	[COMMENT] [varchar](50) NULL,
	[EFFECTIVE_DT] [datetime] NULL
) ON [PRIMARY]
GO
