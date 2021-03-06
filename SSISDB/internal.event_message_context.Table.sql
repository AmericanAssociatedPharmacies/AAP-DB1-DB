USE [SSISDB]
GO
/****** Object:  Table [internal].[event_message_context]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[event_message_context](
	[context_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[event_message_id] [bigint] NOT NULL,
	[context_depth] [int] NULL,
	[package_path] [nvarchar](max) NULL,
	[context_type] [smallint] NULL,
	[context_source_name] [nvarchar](4000) NULL,
	[context_source_id] [nvarchar](38) NULL,
	[property_name] [nvarchar](4000) NULL,
	[property_value] [sql_variant] NULL,
 CONSTRAINT [PK_Event_Message_Context] PRIMARY KEY CLUSTERED 
(
	[context_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [internal].[event_message_context]  WITH CHECK ADD  CONSTRAINT [FK_EventMessageContext_EventMessageId_EventMessages] FOREIGN KEY([event_message_id])
REFERENCES [internal].[event_messages] ([event_message_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[event_message_context] CHECK CONSTRAINT [FK_EventMessageContext_EventMessageId_EventMessages]
GO
ALTER TABLE [internal].[event_message_context]  WITH CHECK ADD  CONSTRAINT [FK_EventMessagecontext_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
GO
ALTER TABLE [internal].[event_message_context] CHECK CONSTRAINT [FK_EventMessagecontext_Operations]
GO
