USE [ODSIntake]
GO
/****** Object:  Table [dbo].[DBA_ShrinkFile_Log]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBA_ShrinkFile_Log](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[SQLCommand] [varchar](2000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DBA_ShrinkFile_Log] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
