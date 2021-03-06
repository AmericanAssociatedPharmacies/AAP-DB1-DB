USE [WebDev]
GO
/****** Object:  Table [dbo].[Program_log]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Program_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Program] [varchar](50) NOT NULL,
	[program_id] [int] NULL,
	[event] [varchar](50) NULL,
	[date] [datetime] NOT NULL,
	[PMID] [int] NULL,
	[field1] [varchar](255) NULL,
	[field2] [varchar](255) NULL,
	[field3] [varchar](255) NULL,
	[field4] [varchar](255) NULL,
	[field5] [varchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Program_log] ADD  CONSTRAINT [DF_Program_log_date]  DEFAULT (getdate()) FOR [date]
GO
