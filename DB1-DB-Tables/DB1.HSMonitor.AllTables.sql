USE [HSMonitor]
GO
/****** Object:  Table [dbo].[ReportData]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportData](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RecordID] [int] NOT NULL,
	[FieldID] [int] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportFields]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportFields](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRecords]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePreferences]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePreferences](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](250) NOT NULL,
	[PreferenceName] [nvarchar](250) NOT NULL,
	[PreferenceValue] [nvarchar](250) NULL,
	[MonitorLevel] [int] NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[ModifyDate] [datetime2](7) NULL,
	[IsBasePreference] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebdocsCustomizationQueue]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebdocsCustomizationQueue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MonitorID] [int] NOT NULL,
	[WebdocsDocumentID] [nvarchar](100) NOT NULL,
	[WebdocsRouteID] [nvarchar](100) NOT NULL,
	[WebdocsRouteStepID] [nvarchar](100) NOT NULL,
	[WebdocsUserID] [nvarchar](100) NOT NULL,
	[IsWebdocsRouteComplete] [bit] NULL,
	[NextExecutionAttempt] [datetime2](7) NOT NULL,
	[TimeAdded] [datetime2](7) NOT NULL,
	[NumberOfAttempts] [int] NOT NULL,
	[HasExecuted] [bit] NOT NULL,
 CONSTRAINT [PK_WebdocsCustomizationQueue_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WindowsServiceRegistrations]    Script Date: 12/22/2020 2:56:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WindowsServiceRegistrations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NOT NULL,
	[LastRan] [datetime2](7) NOT NULL,
	[OrderIndex] [int] NOT NULL,
 CONSTRAINT [PK_WindowsServiceRegistrations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReportData] ADD  DEFAULT ('') FOR [Data]
GO
ALTER TABLE [dbo].[ReportRecords] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ServicePreferences] ADD  DEFAULT ((0)) FOR [MonitorLevel]
GO
ALTER TABLE [dbo].[ServicePreferences] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_WebdocsDocumentID_1]  DEFAULT ('') FOR [WebdocsDocumentID]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_WebdocsRouteID]  DEFAULT ('') FOR [WebdocsRouteID]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_WebdocsRouteStep]  DEFAULT ('') FOR [WebdocsRouteStepID]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_WebdocsUser]  DEFAULT ('') FOR [WebdocsUserID]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_TimeAdded_1]  DEFAULT (getdate()) FOR [TimeAdded]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_NumberOfAttempts]  DEFAULT ((0)) FOR [NumberOfAttempts]
GO
ALTER TABLE [dbo].[WebdocsCustomizationQueue] ADD  CONSTRAINT [DF_WebdocsCustomizationQueue_HasExecuted_1]  DEFAULT ((0)) FOR [HasExecuted]
GO
ALTER TABLE [dbo].[WindowsServiceRegistrations] ADD  CONSTRAINT [DF_WindowsServiceRegistrations_OrderIndex]  DEFAULT ((0)) FOR [OrderIndex]
GO
ALTER TABLE [dbo].[ReportData]  WITH CHECK ADD  CONSTRAINT [FK_ReportData_ReportFields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[ReportFields] ([ID])
GO
ALTER TABLE [dbo].[ReportData] CHECK CONSTRAINT [FK_ReportData_ReportFields]
GO
ALTER TABLE [dbo].[ReportData]  WITH CHECK ADD  CONSTRAINT [FK_ReportData_ReportRecords] FOREIGN KEY([RecordID])
REFERENCES [dbo].[ReportRecords] ([ID])
GO
ALTER TABLE [dbo].[ReportData] CHECK CONSTRAINT [FK_ReportData_ReportRecords]
GO
