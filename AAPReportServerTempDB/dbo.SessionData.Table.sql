USE [AAPReportServerTempDB]
GO
/****** Object:  Table [dbo].[SessionData]    Script Date: 12/22/2020 4:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionData](
	[SessionID] [varchar](32) NOT NULL,
	[CompiledDefinition] [uniqueidentifier] NULL,
	[SnapshotDataID] [uniqueidentifier] NULL,
	[IsPermanentSnapshot] [bit] NULL,
	[ReportPath] [nvarchar](424) NULL,
	[Timeout] [int] NOT NULL,
	[AutoRefreshSeconds] [int] NULL,
	[Expiration] [datetime] NOT NULL,
	[ShowHideInfo] [image] NULL,
	[DataSourceInfo] [image] NULL,
	[OwnerID] [uniqueidentifier] NOT NULL,
	[EffectiveParams] [ntext] NULL,
	[CreationTime] [datetime] NOT NULL,
	[HasInteractivity] [bit] NULL,
	[SnapshotExpirationDate] [datetime] NULL,
	[HistoryDate] [datetime] NULL,
	[PageHeight] [float] NULL,
	[PageWidth] [float] NULL,
	[TopMargin] [float] NULL,
	[BottomMargin] [float] NULL,
	[LeftMargin] [float] NULL,
	[RightMargin] [float] NULL,
	[AwaitingFirstExecution] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
