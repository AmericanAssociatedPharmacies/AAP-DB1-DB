USE [Reports]
GO
/****** Object:  Table [dbo].[import_priceprotectionII]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_priceprotectionII](
	[Date] [varchar](10) NULL,
	[Misc] [varchar](50) NULL,
	[Division] [varchar](50) NULL,
	[CustomerNumber] [varchar](50) NULL,
	[CustomerName] [varchar](255) NULL,
	[PriceProtectionDueToDate] [money] NULL,
	[LastMonthPriceProtectionDue] [money] NULL,
	[CurrentToRemoveFromRebate] [money] NULL,
	[Misc2] [nvarchar](255) NULL,
	[RowLabels] [varchar](50) NULL,
	[CustomerNumber2] [varchar](50) NULL,
	[PriceProtectionDueToDate2] [money] NULL
) ON [PRIMARY]
GO
