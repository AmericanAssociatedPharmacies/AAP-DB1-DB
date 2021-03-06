USE [webdocs]
GO
/****** Object:  Table [dbo].[dmWorkflowConnect]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmWorkflowConnect](
	[FromFlowKey] [char](36) NOT NULL,
	[FromStepKey] [char](36) NOT NULL,
	[ToFlowKey] [char](36) NOT NULL,
	[ToStepKey] [char](36) NOT NULL,
	[Condition] [varchar](512) NULL,
 CONSTRAINT [PK_dmWorkflowConnect] PRIMARY KEY NONCLUSTERED 
(
	[FromFlowKey] ASC,
	[FromStepKey] ASC,
	[ToFlowKey] ASC,
	[ToStepKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
