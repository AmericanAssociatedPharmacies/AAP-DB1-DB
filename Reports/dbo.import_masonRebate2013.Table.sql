USE [Reports]
GO
/****** Object:  Table [dbo].[import_masonRebate2013]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_masonRebate2013](
	[AccountName] [varchar](50) NULL,
	[PMID] [varchar](50) NULL,
	[Units] [float] NULL,
	[Rebate] [money] NULL,
	[CANumber] [varchar](255) NULL,
	[Division] [varchar](50) NULL
) ON [PRIMARY]
GO
