USE [WebDev]
GO
/****** Object:  Table [dbo].[MessageCenter_Log]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCenter_Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[messageid] [int] NOT NULL,
	[login] [varchar](50) NOT NULL,
	[PMID] [int] NULL,
	[date_read] [datetime] NOT NULL,
	[userrole] [varchar](50) NULL,
 CONSTRAINT [PK_MessageCenter_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MessageCenter_Log] ADD  CONSTRAINT [DF_MessageCenter_Log_date_read]  DEFAULT (getdate()) FOR [date_read]
GO
