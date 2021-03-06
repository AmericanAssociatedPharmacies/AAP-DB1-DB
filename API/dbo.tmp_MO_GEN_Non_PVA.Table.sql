USE [API]
GO
/****** Object:  Table [dbo].[tmp_MO_GEN_Non_PVA]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MO_GEN_Non_PVA](
	[WH Acct. No] [varchar](20) NULL,
	[AccountName] [varchar](65) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](4) NULL,
	[Aug. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Sept. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Oct. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Nov. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Dec. 2009 Generic Rx] [numeric](38, 2) NULL,
	[Jan. 2010 Generic Rx] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
