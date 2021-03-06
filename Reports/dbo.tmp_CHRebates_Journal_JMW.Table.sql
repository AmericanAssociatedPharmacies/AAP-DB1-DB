USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CHRebates_Journal_JMW]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHRebates_Journal_JMW](
	[Vendor ID] [numeric](18, 0) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](10) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [numeric](18, 2) NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
