USE [reporting]
GO
/****** Object:  Table [dbo].[Load_Log]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Load_Log](
	[load_type_id] [int] NULL,
	[data_date] [datetime] NOT NULL,
	[load_date] [datetime] NOT NULL,
	[filename] [varchar](255) NULL,
	[type] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Load_Log]  WITH CHECK ADD  CONSTRAINT [FK_Load_Log_Load_Description] FOREIGN KEY([load_type_id])
REFERENCES [dbo].[Load_Description] ([load_type_id])
GO
ALTER TABLE [dbo].[Load_Log] CHECK CONSTRAINT [FK_Load_Log_Load_Description]
GO
