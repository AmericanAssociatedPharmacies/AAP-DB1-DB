USE [AAPReportServerTempDB]
GO
/****** Object:  Table [dbo].[ExecutionCache]    Script Date: 12/22/2020 4:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExecutionCache](
	[ExecutionCacheID] [uniqueidentifier] NOT NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[ExpirationFlags] [int] NOT NULL,
	[AbsoluteExpiration] [datetime] NULL,
	[RelativeExpiration] [int] NULL,
	[SnapshotDataID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ExecutionCache] PRIMARY KEY NONCLUSTERED 
(
	[ExecutionCacheID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
