USE [HSMonitor]
GO
/****** Object:  Table [dbo].[WebdocsCustomizationQueue]    Script Date: 12/22/2020 4:30:50 AM ******/
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
