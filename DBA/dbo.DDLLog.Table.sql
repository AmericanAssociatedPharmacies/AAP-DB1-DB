USE [DBA]
GO
/****** Object:  Table [dbo].[DDLLog]    Script Date: 12/22/2020 4:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DDLLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[EventXML] [xml] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DDLLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
