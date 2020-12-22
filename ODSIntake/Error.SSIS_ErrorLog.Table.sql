USE [ODSIntake]
GO
/****** Object:  Table [Error].[SSIS_ErrorLog]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Error].[SSIS_ErrorLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionID] [bigint] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Error].[SSIS_ErrorLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
