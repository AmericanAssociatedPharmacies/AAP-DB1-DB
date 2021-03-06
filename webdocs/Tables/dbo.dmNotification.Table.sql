USE [webdocs]
GO
/****** Object:  Table [dbo].[dmNotification]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmNotification](
	[NotificationKey] [char](36) NOT NULL,
	[FolderKey] [char](36) NOT NULL,
	[UserKey] [char](36) NOT NULL,
	[NotifyOnAdd] [bit] NOT NULL,
	[AttachmentOption] [int] NOT NULL,
	[SendLink] [bit] NOT NULL,
	[NotificationType] [varchar](50) NULL,
 CONSTRAINT [PK_dmNotification] PRIMARY KEY CLUSTERED 
(
	[NotificationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_NotificationKey]  DEFAULT (newid()) FOR [NotificationKey]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_NotifyAdd]  DEFAULT ((0)) FOR [NotifyOnAdd]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_SendDocument]  DEFAULT ((0)) FOR [AttachmentOption]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_SendLink]  DEFAULT ((0)) FOR [SendLink]
GO
ALTER TABLE [dbo].[dmNotification] ADD  CONSTRAINT [DF_dmNotification_NotificationType]  DEFAULT ('Email') FOR [NotificationType]
GO
