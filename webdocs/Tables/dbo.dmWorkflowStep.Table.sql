USE [webdocs]
GO
/****** Object:  Table [dbo].[dmWorkflowStep]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowStep](
	[FlowKey] [char](36) NOT NULL,
	[StepKey] [char](36) NOT NULL,
	[Description] [varchar](1024) NOT NULL,
	[TimeLimit] [int] NOT NULL,
	[TimeLimitAction] [int] NOT NULL,
	[Title] [varchar](120) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[TimeLimitUM] [int] NOT NULL,
	[DiagramLeft] [int] NULL,
	[DiagramTop] [int] NULL,
	[DiagramRight] [int] NULL,
	[DiagramBottom] [int] NULL,
	[AllowComplete] [bit] NOT NULL,
	[AllowGlobalComplete] [bit] NOT NULL,
	[AllowTransfer] [bit] NOT NULL,
	[Notify] [bit] NOT NULL,
	[AllowEdit] [bit] NOT NULL,
 CONSTRAINT [PK_dmWorkflowStep] PRIMARY KEY NONCLUSTERED 
(
	[FlowKey] ASC,
	[StepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_TimeLimitAction]  DEFAULT ((0)) FOR [TimeLimitAction]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_TimeLimitUM]  DEFAULT ((0)) FOR [TimeLimitUM]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramLeft]  DEFAULT ((0)) FOR [DiagramLeft]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramTop]  DEFAULT ((0)) FOR [DiagramTop]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramRight]  DEFAULT ((0)) FOR [DiagramRight]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_DiagramBottom]  DEFAULT ((0)) FOR [DiagramBottom]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowComplete]  DEFAULT ((0)) FOR [AllowComplete]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowGlobalComplete]  DEFAULT ((0)) FOR [AllowGlobalComplete]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowTransfer]  DEFAULT ((0)) FOR [AllowTransfer]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_Notify]  DEFAULT ((0)) FOR [Notify]
GO
ALTER TABLE [dbo].[dmWorkflowStep] ADD  CONSTRAINT [DF_dmWorkflowStep_AllowEdit]  DEFAULT ((0)) FOR [AllowEdit]
GO
