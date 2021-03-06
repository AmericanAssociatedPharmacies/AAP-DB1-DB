USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[ProcessThreadGroups]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessThreadGroups](
	[ThreadID] [smallint] IDENTITY(1,1) NOT NULL,
	[ThreadDesc] [varchar](50) NOT NULL,
	[ThreadPollingInterval] [int] NOT NULL,
	[ThreadCount] [int] NOT NULL,
	[ThreadStartTime] [datetime] NOT NULL,
	[ThreadEndTime] [datetime] NOT NULL,
	[ThreadWindowsServiceName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ThreadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
