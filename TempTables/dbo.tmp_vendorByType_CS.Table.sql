USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_vendorByType_CS]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_vendorByType_CS](
	[PMID] [numeric](18, 0) NULL,
	[DEA] [varchar](50) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[Store] [varchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Type] [varchar](255) NULL,
	[TM] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
