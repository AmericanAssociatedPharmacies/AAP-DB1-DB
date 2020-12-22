USE [Reports]
GO
/****** Object:  Table [dbo].[tmpAAPVolAdmin_Adj]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpAAPVolAdmin_Adj](
	[PMID] [nvarchar](255) NULL,
	[SumOfAAP Volume Admin Fee] [money] NULL,
	[AAP PVA Vol Admin] [float] NULL,
	[Adjustment to make] [money] NULL
) ON [PRIMARY]
GO
