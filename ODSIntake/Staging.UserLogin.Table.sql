USE [ODSIntake]
GO
/****** Object:  Table [Staging].[UserLogin]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[UserLogin](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[uname] [char](30) NOT NULL,
	[name] [char](30) NOT NULL,
	[pwd] [char](10) NOT NULL,
	[active] [char](1) NOT NULL,
	[api_id] [char](11) NOT NULL,
	[default_pmid] [char](6) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[UserLogin] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
