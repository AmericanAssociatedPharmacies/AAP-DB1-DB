USE [webdocs]
GO
/****** Object:  Table [dbo].[dmWorkflowStepUser]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowStepUser](
	[StepKey] [char](36) NOT NULL,
	[UserKey] [char](36) NOT NULL,
 CONSTRAINT [PK_dmWorkflowStepUser] PRIMARY KEY CLUSTERED 
(
	[StepKey] ASC,
	[UserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
