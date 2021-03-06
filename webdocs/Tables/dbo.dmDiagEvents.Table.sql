USE [webdocs]
GO
/****** Object:  Table [dbo].[dmDiagEvents]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmDiagEvents](
	[EventKey] [bigint] IDENTITY(1,1) NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [char](10) NOT NULL,
	[EventTargetKey] [char](36) NOT NULL,
	[EventMessage] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT (getdate()) FOR [EventTime]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT ('DEBUG') FOR [EventType]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT ('') FOR [EventTargetKey]
GO
ALTER TABLE [dbo].[dmDiagEvents] ADD  DEFAULT ('') FOR [EventMessage]
GO
