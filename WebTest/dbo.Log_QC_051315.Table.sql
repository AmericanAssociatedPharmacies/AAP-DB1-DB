USE [WebTest]
GO
/****** Object:  Table [dbo].[Log_QC_051315]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_QC_051315](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabname] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[PMID] [int] NULL,
	[date_accessed] [datetime] NULL,
	[userrole] [varchar](15) NULL
) ON [PRIMARY]
GO
