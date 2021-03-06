USE [webdocs]
GO
/****** Object:  Table [dbo].[dmWorkflow]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflow](
	[FlowKey] [char](36) NOT NULL,
	[Description] [varchar](1024) NULL,
	[NotifyAccept] [bit] NOT NULL,
	[NotifyComplete] [bit] NOT NULL,
	[NotifyReject] [bit] NOT NULL,
	[ManagerKey] [char](36) NULL,
	[AllowReject] [bit] NOT NULL,
	[ClearOnReject] [bit] NOT NULL,
	[Title] [varchar](120) NOT NULL,
 CONSTRAINT [PK_dmWorkflow] PRIMARY KEY NONCLUSTERED 
(
	[FlowKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
