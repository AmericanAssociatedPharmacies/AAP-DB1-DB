USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDiv_Journal]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDiv_Journal](
	[Vendor ID] [int] NULL,
	[Invoice #] [varchar](11) NOT NULL,
	[Date] [varchar](10) NOT NULL,
	[Date Due] [varchar](10) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [numeric](18, 2) NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
