USE [webdocs]
GO
/****** Object:  Table [dbo].[dmUser]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmUser](
	[UserKey] [char](36) NOT NULL,
	[LoginName] [varchar](20) NOT NULL,
	[LoginPassword] [varchar](256) NOT NULL,
	[Expiration] [datetime] NULL,
	[Email] [varchar](128) NOT NULL,
	[Description] [varchar](256) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](40) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Company] [varchar](40) NOT NULL,
	[Title] [varchar](40) NOT NULL,
	[Admin] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[TimeStamp] [timestamp] NULL,
	[CheckoutFolder] [varchar](255) NULL,
	[UseCheckoutFolder] [bit] NULL,
	[TemplateFolder] [varchar](255) NULL,
	[UseTemplateFolder] [bit] NULL,
	[LocationKey] [char](36) NULL,
	[EnterpriseWorkflowUsername] [varchar](255) NOT NULL,
	[EnterpriseWorkflowPassword] [varchar](255) NOT NULL,
	[AllowEnterpriseWorkflow] [bit] NOT NULL,
	[WebFormsUsername] [varchar](255) NOT NULL,
	[WebFormsPassword] [varchar](255) NOT NULL,
	[AllowWebForms] [bit] NOT NULL,
	[DefaultDocumentTypeKey] [char](36) NULL,
	[DefaultFolderKey] [char](36) NULL,
	[MustChangePassword] [bit] NOT NULL,
	[AuthenticationServerId] [char](36) NOT NULL,
 CONSTRAINT [PK_dmUser] PRIMARY KEY NONCLUSTERED 
(
	[UserKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_dmUser_LoginName] UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_LocationKey]  DEFAULT ('') FOR [LocationKey]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_EnterpriseWorkflowUsername]  DEFAULT ('') FOR [EnterpriseWorkflowUsername]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_EnterpriseWorkflowPassword]  DEFAULT ('') FOR [EnterpriseWorkflowPassword]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_AllowEnterpriseWorkflow]  DEFAULT ((0)) FOR [AllowEnterpriseWorkflow]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_WebFormsUsername]  DEFAULT ('') FOR [WebFormsUsername]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_WebFormsPassword]  DEFAULT ('') FOR [WebFormsPassword]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_AllowWebForms]  DEFAULT ((0)) FOR [AllowWebForms]
GO
ALTER TABLE [dbo].[dmUser] ADD  DEFAULT ('') FOR [DefaultDocumentTypeKey]
GO
ALTER TABLE [dbo].[dmUser] ADD  DEFAULT ('') FOR [DefaultFolderKey]
GO
ALTER TABLE [dbo].[dmUser] ADD  CONSTRAINT [DF_dmUser_MustChangePassword]  DEFAULT ((0)) FOR [MustChangePassword]
GO
ALTER TABLE [dbo].[dmUser] ADD  DEFAULT ('') FOR [AuthenticationServerId]
GO
