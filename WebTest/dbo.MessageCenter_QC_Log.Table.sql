USE [WebTest]
GO
/****** Object:  Table [dbo].[MessageCenter_QC_Log]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_QC_Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[messageid] [int] NOT NULL,
	[login] [varchar](50) NOT NULL,
	[PMID] [int] NULL,
	[date_read] [datetime] NOT NULL,
	[userrole] [varchar](50) NULL
) ON [PRIMARY]
GO
