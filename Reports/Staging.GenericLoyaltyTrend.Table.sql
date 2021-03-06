USE [Reports]
GO
/****** Object:  Table [Staging].[GenericLoyaltyTrend]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[GenericLoyaltyTrend](
	[RowID] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[1stQrtr] [money] NULL,
	[2ndQrtr] [money] NULL,
	[3rdQrtr] [money] NULL,
	[4thQrtr] [money] NULL,
	[RowCreatedDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
