USE [ODSIntake]
GO
/****** Object:  Table [dbo].[FileLog]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](1000) NULL,
	[DownloadDateTime] [datetime] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[Process] [varchar](250) NULL,
 CONSTRAINT [CPK_FileLog] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FileLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
