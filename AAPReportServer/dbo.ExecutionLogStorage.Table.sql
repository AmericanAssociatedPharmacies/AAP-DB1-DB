USE [AAPReportServer]
GO
/****** Object:  Table [dbo].[ExecutionLogStorage]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecutionLogStorage](
	[LogEntryId] [bigint] IDENTITY(1,1) NOT NULL,
	[InstanceName] [nvarchar](38) NOT NULL,
	[ReportID] [uniqueidentifier] NULL,
	[UserName] [nvarchar](260) NULL,
	[ExecutionId] [nvarchar](64) NULL,
	[RequestType] [bit] NOT NULL,
	[Format] [nvarchar](26) NULL,
	[Parameters] [ntext] NULL,
	[ReportAction] [tinyint] NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[TimeDataRetrieval] [int] NOT NULL,
	[TimeProcessing] [int] NOT NULL,
	[TimeRendering] [int] NOT NULL,
	[Source] [tinyint] NOT NULL,
	[Status] [nvarchar](40) NOT NULL,
	[ByteCount] [bigint] NOT NULL,
	[RowCount] [bigint] NOT NULL,
	[AdditionalInfo] [xml] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
