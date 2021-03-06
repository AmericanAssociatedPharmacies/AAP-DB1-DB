USE [reporting]
GO
/****** Object:  Table [dbo].[DecliningRateAccounts]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DecliningRateAccounts](
	[WHAccountID] [float] NULL,
	[PMID] [float] NULL,
	[AvgRate] [nvarchar](255) NULL,
	[GenSales_Jan18] [money] NULL,
	[Feb] [nvarchar](255) NULL,
	[Mar] [nvarchar](255) NULL,
	[Apr] [nvarchar](255) NULL,
	[May] [nvarchar](255) NULL,
	[Jun] [nvarchar](255) NULL,
	[Jul] [nvarchar](255) NULL,
	[Aug] [nvarchar](255) NULL,
	[Sep] [nvarchar](255) NULL,
	[Oct] [nvarchar](255) NULL,
	[Nov] [nvarchar](255) NULL,
	[Dec] [nvarchar](255) NULL,
	[Total ] [nvarchar](255) NULL,
	[36K] [nvarchar](255) NULL
) ON [PRIMARY]
GO
