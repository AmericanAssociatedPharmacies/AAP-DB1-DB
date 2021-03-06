USE [webdocs]
GO
/****** Object:  Table [dbo].[dmWorkflowDocument]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowDocument](
	[DocumentKey] [char](36) NOT NULL,
	[FlowKey] [char](36) NOT NULL,
	[StepKey] [char](36) NOT NULL,
	[Status] [int] NOT NULL,
	[Expiration] [datetime] NULL,
	[OwnerKey] [char](36) NOT NULL,
	[RouteManagerNotified] [bit] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
 CONSTRAINT [PK_dmWorkflowDocument] PRIMARY KEY NONCLUSTERED 
(
	[DocumentKey] ASC,
	[FlowKey] ASC,
	[StepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmWorkflowDocument] ADD  CONSTRAINT [DF_dmWorkflowDocument_OwnerKey]  DEFAULT ('') FOR [OwnerKey]
GO
ALTER TABLE [dbo].[dmWorkflowDocument] ADD  DEFAULT ((0)) FOR [RouteManagerNotified]
GO
ALTER TABLE [dbo].[dmWorkflowDocument] ADD  CONSTRAINT [DF_dmWorkflowDocument_LastUpdated]  DEFAULT (getdate()) FOR [LastUpdated]
GO
