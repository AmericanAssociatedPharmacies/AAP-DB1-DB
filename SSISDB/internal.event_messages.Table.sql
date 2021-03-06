USE [SSISDB]
GO
/****** Object:  Table [internal].[event_messages]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[event_messages](
	[event_message_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) NULL,
	[package_name] [nvarchar](260) NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[event_name] [nvarchar](1024) NULL,
	[message_source_name] [nvarchar](4000) NULL,
	[message_source_id] [nvarchar](38) NULL,
	[subcomponent_name] [nvarchar](4000) NULL,
	[package_path] [nvarchar](max) NULL,
	[threadID] [int] NOT NULL,
	[message_code] [int] NULL,
 CONSTRAINT [PK_Event_Messages] PRIMARY KEY CLUSTERED 
(
	[event_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [internal].[event_messages]  WITH CHECK ADD  CONSTRAINT [FK_EventMessage_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
GO
ALTER TABLE [internal].[event_messages] CHECK CONSTRAINT [FK_EventMessage_Operations]
GO
ALTER TABLE [internal].[event_messages]  WITH CHECK ADD  CONSTRAINT [FK_EventMessages_OperationMessageId_OperationMessage] FOREIGN KEY([event_message_id])
REFERENCES [internal].[operation_messages] ([operation_message_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[event_messages] CHECK CONSTRAINT [FK_EventMessages_OperationMessageId_OperationMessage]
GO
