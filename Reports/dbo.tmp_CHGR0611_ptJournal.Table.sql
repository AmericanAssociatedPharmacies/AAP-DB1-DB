USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_CHGR0611_ptJournal]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHGR0611_ptJournal](
	[Vendor ID] [numeric](18, 0) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](7) NOT NULL,
	[Date Due] [varchar](6) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
