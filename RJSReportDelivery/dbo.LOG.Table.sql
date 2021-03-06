USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[LOG]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ThreadID] [varchar](255) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[TypeOfStatus] [varchar](20) NOT NULL,
	[Destination] [varchar](255) NOT NULL,
	[TypeOfFile] [varchar](10) NOT NULL,
	[SpoolFileQueue] [varchar](10) NOT NULL,
	[SpoolFileLibrary] [varchar](10) NOT NULL,
	[SpoolFileName] [varchar](10) NOT NULL,
	[SpoolFileUserData] [varchar](10) NOT NULL,
	[SpoolFileFormType] [varchar](10) NOT NULL,
	[SpoolFileUserDefinedData] [varchar](256) NOT NULL,
	[SpoolFileJobName] [varchar](10) NOT NULL,
	[SpoolFileJobUser] [varchar](10) NOT NULL,
	[SpoolFileJobNumber] [varchar](10) NOT NULL,
	[SpoolFileNumber] [varchar](10) NOT NULL,
	[PCFilePath] [varchar](255) NOT NULL,
	[PCFileName] [varchar](255) NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[Description] [varchar](1024) NOT NULL,
 CONSTRAINT [PK_LOG] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
