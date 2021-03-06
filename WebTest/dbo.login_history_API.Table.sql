USE [WebTest]
GO
/****** Object:  Table [dbo].[login_history_API]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_history_API](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dt] [datetime] NOT NULL,
	[login] [varchar](50) NULL,
	[nslogin] [varchar](50) NULL,
	[PMID] [int] NULL,
	[userrole] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[login_history_API] ADD  CONSTRAINT [DF_login_history_API_dt]  DEFAULT (getdate()) FOR [dt]
GO
