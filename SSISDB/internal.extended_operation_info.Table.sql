USE [SSISDB]
GO
/****** Object:  Table [internal].[extended_operation_info]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[extended_operation_info](
	[info_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[object_name] [nvarchar](260) NOT NULL,
	[object_type] [smallint] NULL,
	[reference_id] [bigint] NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NOT NULL,
	[end_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Operation_Info] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [internal].[extended_operation_info]  WITH CHECK ADD  CONSTRAINT [FK_OperationInfo_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[extended_operation_info] CHECK CONSTRAINT [FK_OperationInfo_Operations]
GO
