USE [WebDev]
GO
/****** Object:  Table [dbo].[Log_SPT]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_SPT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[button] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[PMID] [int] NULL,
	[date_accessed] [datetime] NULL,
	[userrole] [varchar](15) NULL
) ON [PRIMARY]
GO
