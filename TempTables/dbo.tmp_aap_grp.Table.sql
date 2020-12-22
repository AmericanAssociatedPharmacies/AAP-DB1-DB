USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_aap_grp]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_aap_grp](
	[pmid] [int] NOT NULL,
	[GroupName] [varchar](50) NULL,
	[aapid] [bigint] NULL,
	[PMGroupNo] [int] NULL
) ON [PRIMARY]
GO
