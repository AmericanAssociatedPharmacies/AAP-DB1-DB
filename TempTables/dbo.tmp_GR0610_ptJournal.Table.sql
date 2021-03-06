USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_GR0610_ptJournal]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GR0610_ptJournal](
	[Vendor ID] [nvarchar](255) NULL,
	[Invoice #] [varchar](7) NOT NULL,
	[Date] [varchar](8) NOT NULL,
	[Date Due] [varchar](8) NOT NULL,
	[Accounts Payable Account] [varchar](7) NOT NULL,
	[Number Of Distributions] [int] NOT NULL,
	[GL Account] [varchar](7) NOT NULL,
	[Amount] [money] NULL,
	[Recur Number] [int] NOT NULL,
	[Recur Frequency] [int] NOT NULL
) ON [PRIMARY]
GO
