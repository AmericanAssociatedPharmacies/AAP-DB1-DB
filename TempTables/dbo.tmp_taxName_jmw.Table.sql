USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_taxName_jmw]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_taxName_jmw](
	[PMID] [float] NULL,
	[Acct DBA Name] [nvarchar](255) NULL,
	[AAP#] [float] NULL,
	[API#] [float] NULL,
	[APIStatus] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[FEDID] [nvarchar](255) NULL,
	[AAP Parent#] [float] NULL,
	[Quit Date] [datetime] NULL,
	[Tax Name] [nvarchar](255) NULL,
	[Entity type] [nvarchar](255) NULL,
	[Notes] [nvarchar](255) NULL
) ON [PRIMARY]
GO
