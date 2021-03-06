USE [TempTables]
GO
/****** Object:  Table [dbo].[import_CHFinal0610_calcVariance]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_CHFinal0610_calcVariance](
	[pmid] [nvarchar](255) NULL,
	[SumOfCCA = AAP Generics 872, 25676, 25677] [money] NULL,
	[calc] [money] NULL,
	[csfn] [float] NULL,
	[sort code] [nvarchar](255) NULL,
	[pay to store] [money] NULL
) ON [PRIMARY]
GO
