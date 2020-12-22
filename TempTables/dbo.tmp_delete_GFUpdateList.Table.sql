USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_delete_GFUpdateList]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_GFUpdateList](
	[PMID] [float] NULL,
	[AAP#] [float] NULL,
	[Parent] [float] NULL,
	[Account DBA Name] [nvarchar](255) NULL,
	[AAP Quit] [datetime] NULL,
	[Change Account Description To:] [nvarchar](255) NULL,
	[Why Quit] [nvarchar](255) NULL
) ON [PRIMARY]
GO
