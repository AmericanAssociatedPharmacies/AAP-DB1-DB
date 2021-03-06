USE [Reports]
GO
/****** Object:  Table [dbo].[TestSalesAvg]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSalesAvg](
	[PMID] [int] NULL,
	[TotalBRx] [decimal](18, 2) NULL,
	[TotalGrx] [decimal](18, 2) NULL,
	[OtherRx] [decimal](18, 2) NULL,
	[NonRx] [decimal](18, 2) NULL,
	[Excluded] [decimal](18, 2) NULL,
	[AVGTotal] [decimal](18, 2) NULL,
	[APIBrand] [decimal](18, 2) NULL,
	[APIGen] [decimal](18, 2) NULL,
	[APIOTC] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
