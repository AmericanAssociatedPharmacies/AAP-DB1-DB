USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_MapAPIGroupToPMGroup]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MapAPIGroupToPMGroup](
	[buscls] [varchar](50) NULL,
	[PMGroupNo] [int] NOT NULL
) ON [PRIMARY]
GO
