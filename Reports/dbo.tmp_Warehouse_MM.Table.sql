USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_Warehouse_MM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Warehouse_MM](
	[PMID] [int] NULL,
	[TM] [nvarchar](255) NULL,
	[Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[ZIP] [nvarchar](255) NULL
) ON [PRIMARY]
GO
