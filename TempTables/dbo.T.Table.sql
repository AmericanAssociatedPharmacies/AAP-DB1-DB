USE [TempTables]
GO
/****** Object:  Table [dbo].[T]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T](
	[IntCol] [int] NULL,
	[XmlCol] [xml] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
