USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_delete_vol2009]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_vol2009](
	[pmid] [int] NULL,
	[vendor] [varchar](64) NULL,
	[col] [varchar](12) NULL,
	[volume] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
