USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_delete_pivottest]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_pivottest](
	[pmid] [int] NULL,
	[col] [varchar](60) NULL,
	[value] [float] NULL
) ON [PRIMARY]
GO
