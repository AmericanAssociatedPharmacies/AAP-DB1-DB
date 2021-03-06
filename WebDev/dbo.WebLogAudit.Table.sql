USE [WebDev]
GO
/****** Object:  Table [dbo].[WebLogAudit]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLogAudit](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[WebPage] [varchar](8000) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_WebLogAudit_RowID] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WebLogAudit] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
